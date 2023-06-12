import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/data/api_client.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/utils/appwrite_storage_image_url_helper.dart';
import 'package:codeswipe/utils/environment_helper.dart';
import 'package:codeswipe/utils/mixins/cubit_maybe_emit_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_cubit.freezed.dart';
part 'auth_cubit.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    AppUser? user,
    @Default(false) bool isOtpAvailable,
    String? phoneUserId,
    String? pickedImagePath,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}

class AuthCubit extends HydratedCubit<AuthState> with CubitMaybeEmit {
  ///Singleton
  static AuthCubit get instance => _instance;
  static final AuthCubit _instance = AuthCubit._internal();

  AuthCubit._internal() : super(const AuthState());

  ///Singleton

  ApiClient? _apiClient;

  ///Stores country code for phone login
  String countryCode = kDefaultCountryCode;

  void initialize(ApiClient apiClient) {
    ///Checking if already initialized
    if (_apiClient != null) {
      return;
    }

    _apiClient = apiClient;
  }

  bool get isSignedIn => state.user != null;

  void login(AppUser user) => emit(
        state.copyWith(
          user: user,
          isOtpAvailable: false,
        ),
      );

  ///Initiates phone login with [phoneNumber] using appwrite createPhoneSession method
  ///[phoneNumber] should be in the format of [countryCode] + [phoneNumber]
  Future<void> initiatePhoneLogin(String phoneNumber) async {
    final accountApi = getAccountApi();

    ///Clear otp availability before creating new session
    updateSessionAvailability(false);

    final session = await accountApi.createPhoneSession(
      userId: ID.unique(),
      phone: phoneNumber,
    );

    updateSessionAvailability(true, phoneUserId: session.userId);
  }

  ///Updates Session availability for phone login
  void updateSessionAvailability(bool value, {String? phoneUserId}) {
    emit(
      state.copyWith(
        isOtpAvailable: value,
        phoneUserId: phoneUserId,
      ),
    );
  }

  ///Verifies otp for phone login and checks if account exists
  Future<void> verifyOtp(String otp) async {
    final accountApi = getAccountApi();

    try {
      await accountApi.updatePhoneSession(
        userId: state.phoneUserId!,
        secret: otp,
      );
    } on AppwriteException catch (e) {
      if (e.type == 'user_invalid_token') {
        throw Exception('Invalid OTP. Please try again.');
      } else {
        rethrow;
      }
    }

    await checkIfAccountExists('phone');
  }

  void updateCountryCode(String? countryCode) {
    this.countryCode = countryCode ?? kDefaultCountryCode;
  }

  Future<void> loginWithProvider(String provider) async {
    final accountApi = getAccountApi();
    await accountApi.createOAuth2Session(provider: provider, scopes: []);

    ///Workaround Delaying for 1 second to allow appwrite to create session
    ///TODO remove when appwrite fixes it
    await Future.delayed(const Duration(seconds: 1));

    await checkIfAccountExists(provider);
  }

  Future<void> checkIfAccountExists(String provider) async {
    Session? sessionInfo;
    User? accountInfo;

    final accountApi = getAccountApi();

    try {
      accountInfo = await accountApi.get();

      sessionInfo = await accountApi.getSession(sessionId: 'current');

      final document = await _apiClient?.databases.getDocument(
        databaseId: EnvironmentHelper().getDatabaseId(),
        collectionId: kUsersCollection,
        documentId: sessionInfo.userId,
      );

      ///TODO handle edge case of save oauth token if different oauth service is used on existing account

      if (document == null) {
        throw Exception('Login Failed. Please try again.');
      }
      final appUser = AppUser.fromJson(document.data);
      login(appUser);
    } on AppwriteException catch (e) {
      if (e.type == 'document_not_found') {
        if (accountInfo == null || sessionInfo == null) {
          throw Exception(
            'Login Failed. Error fetching data. Please try again',
          );
        }

        final appUser = await createUser(
          accountInfo,
          sessionInfo,
          provider,
        );

        login(appUser);
      } else {
        rethrow;
      }
    }
  }

  Future<void> getUser() async {
    final document = await _apiClient!.databases.getDocument(
      databaseId: EnvironmentHelper().getDatabaseId(),
      collectionId: kUsersCollection,
      documentId: state.user!.id,
    );
    final appUser = AppUser.fromJson(document.data);
    emit(
      state.copyWith(
        user: appUser,
      ),
    );
  }

  Future<AppUser> createUser(
      User accountInfo, Session sessionInfo, String provider) async {
    AppUser appUser = AppUser(
      id: accountInfo.$id,
      name: accountInfo.name,
      email: accountInfo.email,
    );

    if (provider == 'github') {
      appUser = appUser.copyWith(
        ghAccessToken: sessionInfo.providerAccessToken,
        ghTokenExpiry: sessionInfo.providerAccessTokenExpiry,
      );
    } else if (provider == 'phone') {
      appUser = appUser.copyWith(
        phone: accountInfo.phone,
      );
    }

    await _apiClient?.databases.createDocument(
      databaseId: EnvironmentHelper().getDatabaseId(),
      collectionId: kUsersCollection,
      documentId: accountInfo.$id,
      data: appUser.toJson(),
    );

    return appUser;
  }

  Future<void> logout() async {
    final accountApi = getAccountApi();
    await accountApi.deleteSession(sessionId: 'current');
    emit(
      state.copyWith(
        user: null,
      ),
    );
  }

  Account getAccountApi() {
    if (_apiClient == null) {
      throw Exception('AuthCubit not initialized');
    }

    return _apiClient!.account;
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toJson();

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    ///We don't want to persist these values
    json.remove('isOtpAvailable');
    json.remove('phoneSessionId');
    return AuthState.fromJson(json);
  }

  void markUserSurveyAttempted() {
    final accountApi = getAccountApi();
    accountApi.updatePrefs(
      prefs: {
        userSurveyAttemptedPref: true,
      },
    );
  }

  Future<void> updateProfile({
    required String? name,
    required String? email,
    required String? course,
    required String? collegeName,
    required String? graduationYear,
    required String? bio,
  }) async {
    final user = state.user;

    if (user == null) {
      logout();
      return;
    } else {
      final updatedUser = user.copyWith(
        name: name ?? user.name,
        email: email ?? user.email,
        course: course ?? user.course,
        collegeName: collegeName ?? user.collegeName,
        graduationYear: graduationYear ?? user.graduationYear,
        bio: bio ?? user.bio,
        avatar: getStorageFileUrl(user.id),
      );

      ///Checking if there was no change
      if (state.user == updatedUser) {
        return;
      }

      await updateUser(updatedUser);
    }
  }

  Future<void> updateUserSkills(List<String> skills) async {
    final user = state.user;

    if (user == null) {
      logout();
      return;
    } else {
      final updatedUser = user.copyWith(
        skills: skills,
      );

      ///Checking if there was no change
      if (state.user == updatedUser) {
        return;
      }

      await updateUser(updatedUser);
    }
  }

  Future<void> updateUser(AppUser updatedUser) async {
    await _apiClient?.databases.updateDocument(
      databaseId: EnvironmentHelper().getDatabaseId(),
      collectionId: kUsersCollection,
      documentId: updatedUser.id,
      data: updatedUser.toJson(),
    );

    emit(
      state.copyWith(
        user: updatedUser,
      ),
    );
  }

  Future<void> updateUserPrefs({
    required List<String> preferredThemes,
    required String preferredHackathonMode,
    required String teamMemberPreferredLocation,
  }) async {
    final user = state.user;

    if (user == null) {
      logout();
      return;
    } else {
      final updatedUser = user.copyWith(
        hackathonThemeInterests: preferredThemes,
        hackathonModeInterests: preferredHackathonMode,
        teamMemberPreferredLocation: teamMemberPreferredLocation,
      );

      ///Checking if there was no change
      if (state.user == updatedUser) {
        return;
      }

      await updateUser(updatedUser);
    }
  }

  void updateUserTeamID(String $id) {
    emit(
      state.copyWith(
        user: state.user?.copyWith(teamId: $id),
      ),
    );
  }

  void updatePickedPhoto(XFile file) {
    emit(
      state.copyWith(
        pickedImagePath: file.path,
      ),
    );
  }

  void clearPickedPhoto() {
    emit(
      state.copyWith(pickedImagePath: null),
    );
  }

  Future<void> uploadUserImage() async {
    final userId = state.user!.id;
    await _apiClient!.storage.createFile(
      bucketId: EnvironmentHelper().getStorageBucketId(),
      file: InputFile.fromPath(
        path: state.pickedImagePath!,
        filename: 'user_image-$userId',
      ),
      fileId: userId,
    );

    emit(
      state.copyWith(
        pickedImagePath: null,
      ),
    );
  }

  Future<void> updateMatches(
      List<String> matchesList, List<String> matchRequests) async {
    emit(
      state.copyWith(
        user: state.user?.copyWith(
          matches: matchesList,
          matchRequests: matchRequests,
        ),
      ),
    );
  }
}

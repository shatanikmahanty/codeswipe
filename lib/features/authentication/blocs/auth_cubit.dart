import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/data/api_client.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/utils/database_id_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_cubit.freezed.dart';
part 'auth_cubit.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    AppUser? user,
    @Default(false) bool isOtpAvailable,
    String? phoneUserId,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}

class AuthCubit extends HydratedCubit<AuthState> {
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
        databaseId: DataBaseIdHelper().getId(),
        collectionId: kUsersCollection,
        documentId: sessionInfo.userId,
      );

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
      databaseId: DataBaseIdHelper().getId(),
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
}

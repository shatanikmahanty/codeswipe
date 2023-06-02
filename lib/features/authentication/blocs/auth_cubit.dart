import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/data/api_client.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/utils/databaseIdHelper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_cubit.freezed.dart';
part 'auth_cubit.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    AppUser? user,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}

class AuthCubit extends HydratedCubit<AuthState> {
  static AuthCubit get instance => _instance;
  static final AuthCubit _instance = AuthCubit._internal();

  ApiClient? _apiClient;

  AuthCubit._internal() : super(const AuthState());

  void initialize(ApiClient apiClient) {
    if (_apiClient != null) {
      throw Exception('Account API already initialized');
    }

    _apiClient = apiClient;
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) => AuthState.fromJson(json);

  bool get isSignedIn => state.user != null;

  void login(AppUser user, String token) => emit(
        state.copyWith(
          user: user,
        ),
      );

  Future loginWithProvider(String provider) async {
    if (_apiClient == null) {
      throw Exception('AuthCubit not initialized');
    }

    final accountApi = _apiClient!.account;

    Session? sessionInfo;
    User? accountInfo;

    try {
      await accountApi.createOAuth2Session(provider: provider, scopes: []);
      accountInfo = await accountApi.get();
      sessionInfo = await accountApi.getSession(sessionId: 'current');

      final document = await _apiClient?.databases.getDocument(
        databaseId: DataBaseIdHelper().getId(),
        collectionId: kUsersCollection,
        documentId: sessionInfo.userId,
      );
    } on AppwriteException catch (e) {
      if (e.type == 'document_not_found') {
        if (accountInfo == null || sessionInfo == null) {
          throw Exception(
            'Login Failed. Error fetching data. Please try again',
          );
        }

        await _apiClient?.databases.createDocument(
          databaseId: DataBaseIdHelper().getId(),
          collectionId: kUsersCollection,
          documentId: sessionInfo.userId,
          data: {
            'name': accountInfo.name,
            'email': accountInfo.email,
            'id': sessionInfo.userId,
          },
        );
      }
    }
  }

  Future<void> logout() async {
    emit(
      state.copyWith(
        user: null,
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toJson();
}

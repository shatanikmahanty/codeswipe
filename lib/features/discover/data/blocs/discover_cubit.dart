import 'package:appwrite/appwrite.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/utils/environment_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../app/data/api_client.dart';

part 'discover_cubit.freezed.dart';
part 'discover_cubit.g.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    @Default([]) List<AppUser> profiles,
    @Default(false) bool isLoading,
  }) = _DiscoverState;

  factory DiscoverState.fromJson(Map<String, dynamic> json) =>
      _$DiscoverStateFromJson(json);
}

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit() : super(const DiscoverState());

  Databases? _database;

  void initialize(ApiClient apiClient) {
    if (_database != null) {
      return;
    }
    _database = apiClient.databases;
  }

  Future<void> loadProfiles() async {
    emit(state.copyWith(isLoading: true));

    try {
      final documents = await _database!.listDocuments(
        collectionId: kUsersCollection,
        databaseId: EnvironmentHelper().getDatabaseId(),
        queries: [
          Query.notEqual('id', AuthCubit.instance.state.user!.id),
        ],
      );

      final models = documents.documents
          .map<AppUser>((doc) => AppUser.fromJson(doc.data))
          .where((element) => !(AuthCubit.instance.state.user!.likes ?? [])
              .contains(element.id))
          .where((element) => !(AuthCubit.instance.state.user!.dislikes ?? [])
              .contains(element.id))
          .toList();

      emit(state.copyWith(
        profiles: models,
      ));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> likeProfile(String likedUserId) async {
    try {
      final databaseId = EnvironmentHelper().getDatabaseId();
      final currentUserId = AuthCubit.instance.state.user!.id;

      final currentUserDoc = await _database!.getDocument(
        databaseId: databaseId,
        collectionId: kUsersCollection,
        documentId: currentUserId,
      );

      List<String> likesList = List<String>.from(currentUserDoc.data['likes']);
      likesList.add(likedUserId);

      await _database!.updateDocument(
        collectionId: kUsersCollection,
        documentId: currentUserId,
        databaseId: databaseId,
        data: {
          'likes': likesList,
        },
      );

      final likedUserDoc = await _database!.getDocument(
        databaseId: databaseId,
        collectionId: kUsersCollection,
        documentId: likedUserId,
      );

      List<String> matchRequestsList =
          List<String>.from(likedUserDoc.data['match_requests']);
      matchRequestsList.add(currentUserId);

      await _database!.updateDocument(
        collectionId: kUsersCollection,
        documentId: likedUserId,
        databaseId: databaseId,
        data: {
          'match_requests': matchRequestsList,
        },
      );

      //TODO update authCubit
    } catch (e) {
      rethrow;
    }
  }

  Future<void> disLikeProfile(String disLikedUserId) async {
    try {
      final databaseId = EnvironmentHelper().getDatabaseId();
      final currentUserId = AuthCubit.instance.state.user!.id;

      final currentUserDoc = await _database!.getDocument(
        databaseId: databaseId,
        collectionId: kUsersCollection,
        documentId: currentUserId,
      );

      List<String> likesList =
          List<String>.from(currentUserDoc.data['dislikes']);
      likesList.add(disLikedUserId);

      await _database!.updateDocument(
        collectionId: kUsersCollection,
        documentId: currentUserId,
        databaseId: databaseId,
        data: {
          'dislikes': likesList,
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}

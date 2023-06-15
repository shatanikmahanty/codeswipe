import 'package:appwrite/appwrite.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/utils/environment_helper.dart';
import 'package:codeswipe/utils/mixins/cubit_maybe_emit_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../app/data/api_client.dart';

part 'discover_cubit.freezed.dart';
part 'discover_cubit.g.dart';

//TODO add match error to state for rewind
@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    @Default([]) List<AppUser> profiles,
    @Default([]) List<AppUser> matches,
    @Default([]) List<AppUser> requests,
    @Default(false) bool isLoading,
  }) = _DiscoverState;

  factory DiscoverState.fromJson(Map<String, dynamic> json) =>
      _$DiscoverStateFromJson(json);
}

class DiscoverCubit extends Cubit<DiscoverState> with CubitMaybeEmit {
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
          .where((element) => !(AuthCubit.instance.state.user!.matches ?? [])
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

  Future<void> loadMatchProfiles() async {
    await loadDiscoverListProfiles(
      idList: AuthCubit.instance.state.user!.matches ?? [],
    );
  }

  Future<void> loadMatchRequests() async {
    await loadDiscoverListProfiles(
      idList: AuthCubit.instance.state.user!.matchRequests ?? [],
      isRequests: true,
    );
  }

  Future<void> loadDiscoverListProfiles({
    required List<String> idList,
    bool isRequests = false,
  }) async {
    emit(state.copyWith(isLoading: true));

    List<AppUser> userList = [];
    try {
      for (final String id in idList) {
        final document = await _database!.getDocument(
          databaseId: EnvironmentHelper().getDatabaseId(),
          collectionId: kUsersCollection,
          documentId: id,
        );
        userList.add(
          AppUser.fromJson(document.data),
        );
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
    emit(
      isRequests
          ? state.copyWith(
              requests: userList,
              isLoading: false,
            )
          : state.copyWith(
              matches: userList,
              isLoading: false,
            ),
    );
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

      List<String> disLikesList =
          List<String>.from(currentUserDoc.data['dislikes']);
      disLikesList.add(disLikedUserId);

      await _database!.updateDocument(
        collectionId: kUsersCollection,
        documentId: currentUserId,
        databaseId: databaseId,
        data: {
          'dislikes': disLikesList,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> matchProfile(String matchedUserId) async {
    try {
      final databaseId = EnvironmentHelper().getDatabaseId();
      final currentUserId = AuthCubit.instance.state.user!.id;

      final currentUserDoc = await _database!.getDocument(
        databaseId: databaseId,
        collectionId: kUsersCollection,
        documentId: currentUserId,
      );

      List<String> matchesList =
          List<String>.from(currentUserDoc.data['matches']);
      List<String> matchRequestsList =
          List<String>.from(currentUserDoc.data['match_requests']);
      matchRequestsList.remove(matchedUserId);
      matchesList.add(matchedUserId);

      await _database!.updateDocument(
        collectionId: kUsersCollection,
        documentId: currentUserId,
        databaseId: databaseId,
        data: {
          'matches': matchesList,
          'match_requests': matchRequestsList,
        },
      );

      final matchedUserDoc = await _database!.getDocument(
        databaseId: databaseId,
        collectionId: kUsersCollection,
        documentId: matchedUserId,
      );

      AuthCubit.instance.updateMatches(
        matchesList,
        matchRequestsList,
      );

      List<String> matchesList2 =
          List<String>.from(matchedUserDoc.data['matches']);
      matchesList2.add(currentUserId);

      List<String> likedList = List<String>.from(currentUserDoc.data['likes']);
      likedList.remove(currentUserId);

      await _database!.updateDocument(
        collectionId: kUsersCollection,
        documentId: matchedUserId,
        databaseId: databaseId,
        data: {
          'matches': matchesList2,
          'likes': likedList,
        },
      );

      await _database!.createDocument(
        databaseId: databaseId,
        collectionId: kChatsCollection,
        documentId: ID.unique(),
        data: {
          'user_id1': currentUserId,
          'user_id2': matchedUserId,
        },
      );

      await loadMatchProfiles();
      await loadMatchRequests();
      await loadProfiles();
    } catch (e) {
      rethrow;
    }
  }
}

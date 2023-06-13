import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/data/api_client.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/features/chat/data/model/chat_room_model.dart';
import 'package:codeswipe/utils/environment_helper.dart';
import 'package:codeswipe/utils/mixins/cubit_maybe_emit_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'chat_cubit.freezed.dart';
part 'chat_cubit.g.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatRoom> rooms,
    @Default(false) bool isLoading,
  }) = _ChatState;

  factory ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);
}

class ChatCubit extends HydratedCubit<ChatState> with CubitMaybeEmit {
  ChatCubit() : super(const ChatState());

  ApiClient? _apiClient;

  void initialize({required ApiClient apiClient}) {
    ///Checking if already initialized
    if (_apiClient != null) {
      return;
    }

    _apiClient = apiClient;
  }

  Future<void> loadChatRooms() async {
    final userChatRoomIds = AuthCubit.instance.state.user?.chatRooms ?? [];
    if (userChatRoomIds.isEmpty) {
      return;
    }

    emit(state.copyWith(isLoading: true));

    final loadedChatRoomIDs =
        state.rooms.map((room) => room.chatRoomId).toList();

    List<ChatRoom> rooms = [];

    for (final chatRoomId in userChatRoomIds) {
      if (!loadedChatRoomIDs.contains(chatRoomId)) {
        final doc = await _apiClient!.databases.getDocument(
          databaseId: EnvironmentHelper().getDatabaseId(),
          collectionId: kChatsCollection,
          documentId: chatRoomId,
        );

        final userId1 = doc.data['user_id1'];
        final userId2 = doc.data['user_id2'];

        final senderId =
            userId1 == AuthCubit.instance.state.user?.id ? userId2 : userId1;

        final senderDoc = await _apiClient!.databases.getDocument(
          databaseId: EnvironmentHelper().getDatabaseId(),
          collectionId: kUsersCollection,
          documentId: senderId,
        );

        print(senderDoc);
        final chatRoom = ChatRoom(
          chatRoomId: chatRoomId,
          senderImage: senderDoc.data['avatar'],
          senderName: senderDoc.data['name'],
        );
        rooms.add(chatRoom);
      }
    }
    emit(
      state.copyWith(rooms: [...state.rooms, ...rooms], isLoading: false),
    );
  }

  // Future<void> subscribeToChatRooms() async {
  //   emit(
  //     state.copyWith(
  //       isLoading: true,
  //     ),
  //   );
  //
  //   final teamDocs = await _apiClient!.realtime.subscribe(
  //     [
  //       'database.${EnvironmentHelper().getDatabaseId()}.teams.',
  //     ],
  //   );
  //
  //   emit(
  //     state.copyWith(
  //       teams: teamDocs.documents
  //           .map((team) => UserTeam.fromJson(team.data))
  //           .toList(),
  //       isLoading: false,
  //     ),
  //   );
  // }

  @override
  ChatState? fromJson(Map<String, dynamic> json) => ChatState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ChatState state) => state.toJson();
}

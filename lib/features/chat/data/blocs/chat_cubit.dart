import 'package:appwrite/appwrite.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/data/api_client.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/features/chat/data/model/chat_message_model.dart';
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
    @Default({}) Map<String, List<ChatMessage>> messages,
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

  Future<void> getMessagesForChatRooms() async {
    for (final room in state.rooms) {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final messages = await _apiClient!.databases.listDocuments(
        databaseId: EnvironmentHelper().getDatabaseId(),
        collectionId: room.chatRoomId,
        queries: [
          Query.orderAsc('time'),
          if (state.messages.containsKey(room.chatRoomId) &&
              state.messages[room.chatRoomId]!.isNotEmpty)
            Query.cursorAfter(state.messages[room.chatRoomId]!.last.messageId),
        ],
      );

      final chatMessages = messages.documents
          .map((message) => ChatMessage.fromJson(message.data))
          .toList();

      List<ChatMessage> chatRoomMessages =
          state.messages[room.chatRoomId] ?? [];

      chatRoomMessages.addAll(chatMessages);

      Map<String, List<ChatMessage>> allRooms =
          Map<String, List<ChatMessage>>.from(state.messages);
      allRooms[room.chatRoomId] = chatRoomMessages;

      emit(
        state.copyWith(
          messages: allRooms,
          isLoading: false,
        ),
      );
      subscribeToChatRooms();
    }
  }

  void clearChats() {
    emit(
      state.copyWith(
        messages: {},
        rooms: [],
      ),
    );
  }

  Future<void> subscribeToChatRooms() async {
    final subscription = _apiClient!.realtime.subscribe(
      [
        'documents',
      ],
    );

    subscription.stream.listen((event) {
      if (event.payload.containsKey('message') &&
          event.payload.containsKey('sender_name')) {
        final message = ChatMessage.fromJson(event.payload);
        addMessageToRoom(
          roomId: event.payload['\$collectionId'],
          chatMessage: message,
        );
      }
    });
  }

  void addMessageToRoom({
    required String roomId,
    required ChatMessage chatMessage,
  }) {
    emit(state.copyWith(isLoading: true));
    final messages = state.messages[roomId] ?? [];
    messages.add(chatMessage);

    Map<String, List<ChatMessage>> allRooms =
        Map<String, List<ChatMessage>>.from(state.messages);
    allRooms[roomId] = messages;

    emit(
      state.copyWith(
        isLoading: false,
        messages: allRooms,
      ),
    );
  }

  @override
  ChatState? fromJson(Map<String, dynamic> json) => ChatState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ChatState state) => state.toJson();

  Future<void> sendMessage({
    required ChatMessage chatMessageModel,
    required String roomId,
  }) async {
    await _apiClient!.databases.createDocument(
      databaseId: EnvironmentHelper().getDatabaseId(),
      collectionId: roomId,
      documentId: ID.unique(),
      data: {
        'message': chatMessageModel.message,
        'sender_id': chatMessageModel.senderID,
        'sender_name': chatMessageModel.senderName,
        'time': chatMessageModel.time.toIso8601String(),
      },
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

//ignore_for_file: invalid_annotation_target
@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    @JsonKey(name: 'sender_name') required String senderName,
    @JsonKey(name: '\$id') required String messageId,
    @JsonKey(name: 'sender_id') required String senderID,
    required String message,
    @JsonKey(name: 'message_type') String? messageType,
    required DateTime time,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

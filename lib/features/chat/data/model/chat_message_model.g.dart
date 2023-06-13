// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessage _$$_ChatMessageFromJson(Map<String, dynamic> json) =>
    _$_ChatMessage(
      senderName: json['sender_name'] as String,
      messageId: json[r'$id'] as String,
      senderID: json['sender_id'] as String,
      message: json['message'] as String,
      messageType: json['message_type'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$_ChatMessageToJson(_$_ChatMessage instance) =>
    <String, dynamic>{
      'sender_name': instance.senderName,
      r'$id': instance.messageId,
      'sender_id': instance.senderID,
      'message': instance.message,
      'message_type': instance.messageType,
      'time': instance.time.toIso8601String(),
    };

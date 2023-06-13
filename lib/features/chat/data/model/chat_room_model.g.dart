// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoom _$$_ChatRoomFromJson(Map<String, dynamic> json) => _$_ChatRoom(
      chatRoomId: json[r'$id'] as String,
      senderImage: json['senderImage'] as String,
      senderName: json['senderName'] as String,
    );

Map<String, dynamic> _$$_ChatRoomToJson(_$_ChatRoom instance) =>
    <String, dynamic>{
      r'$id': instance.chatRoomId,
      'senderImage': instance.senderImage,
      'senderName': instance.senderName,
    };

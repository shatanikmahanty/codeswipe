// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatState _$$_ChatStateFromJson(Map<String, dynamic> json) => _$_ChatState(
      rooms: (json['rooms'] as List<dynamic>?)
              ?.map((e) => ChatRoom.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      messages: (json['messages'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k,
                (e as List<dynamic>)
                    .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
                    .toList()),
          ) ??
          const {},
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ChatStateToJson(_$_ChatState instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
      'messages': instance.messages,
      'isLoading': instance.isLoading,
    };

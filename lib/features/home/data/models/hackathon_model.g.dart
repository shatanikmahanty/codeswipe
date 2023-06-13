// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hackathon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HackathonModel _$$_HackathonModelFromJson(Map<String, dynamic> json) =>
    _$_HackathonModel(
      id: json[r'$id'] as String,
      name: json['name'] as String,
      mode: json['mode'] as String,
      theme: json['theme'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      onClick: json['onClick'] as String?,
      banner: json['banner'] as String,
    );

Map<String, dynamic> _$$_HackathonModelToJson(_$_HackathonModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      'name': instance.name,
      'mode': instance.mode,
      'theme': instance.theme,
      'start_date': instance.startDate.toIso8601String(),
      'onClick': instance.onClick,
      'banner': instance.banner,
    };

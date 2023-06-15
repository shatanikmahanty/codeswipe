// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_vacancy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamVacancy _$$_TeamVacancyFromJson(Map<String, dynamic> json) =>
    _$_TeamVacancy(
      id: json[r'$id'] as String,
      position: json['position'] as String,
      skills: json['skills'] as String,
      expectations: json['expectations'] as String,
      teamId: json['team_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      createdBy: json['created_by'] as String,
      joinRequests: (json['join_requests'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_TeamVacancyToJson(_$_TeamVacancy instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      'position': instance.position,
      'skills': instance.skills,
      'expectations': instance.expectations,
      'team_id': instance.teamId,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by': instance.createdBy,
      'join_requests': instance.joinRequests,
    };

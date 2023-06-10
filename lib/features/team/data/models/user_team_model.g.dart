// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserTeam _$$_UserTeamFromJson(Map<String, dynamic> json) => _$_UserTeam(
      name: json['name'] as String,
      id: json[r'$id'] as String,
      member:
          (json['member'] as List<dynamic>?)?.map((e) => e as String).toList(),
      memberRoles: json[r'$member_roles'] as String,
      admin: json['admin'] as String,
    );

Map<String, dynamic> _$$_UserTeamToJson(_$_UserTeam instance) =>
    <String, dynamic>{
      'name': instance.name,
      r'$id': instance.id,
      'member': instance.member,
      r'$member_roles': instance.memberRoles,
      'admin': instance.admin,
    };

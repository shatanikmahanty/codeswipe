// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamState _$$_TeamStateFromJson(Map<String, dynamic> json) => _$_TeamState(
      team: json['team'] == null
          ? null
          : UserTeam.fromJson(json['team'] as Map<String, dynamic>),
      teams: (json['teams'] as List<dynamic>?)
              ?.map((e) => UserTeam.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
      pickedImagePath: json['pickedImagePath'] as String?,
    );

Map<String, dynamic> _$$_TeamStateToJson(_$_TeamState instance) =>
    <String, dynamic>{
      'team': instance.team,
      'teams': instance.teams,
      'isLoading': instance.isLoading,
      'pickedImagePath': instance.pickedImagePath,
    };

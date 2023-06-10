// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamState _$$_TeamStateFromJson(Map<String, dynamic> json) => _$_TeamState(
      team: json['team'] == null
          ? null
          : UserTeam.fromJson(json['team'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TeamStateToJson(_$_TeamState instance) =>
    <String, dynamic>{
      'team': instance.team,
      'isLoading': instance.isLoading,
    };

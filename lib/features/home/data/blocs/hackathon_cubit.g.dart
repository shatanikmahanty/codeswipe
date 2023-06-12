// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hackathon_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HackathonState _$$_HackathonStateFromJson(Map<String, dynamic> json) =>
    _$_HackathonState(
      hackathons: (json['hackathons'] as List<dynamic>?)
              ?.map((e) => HackathonModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$_HackathonStateToJson(_$_HackathonState instance) =>
    <String, dynamic>{
      'hackathons': instance.hackathons,
      'isLoading': instance.isLoading,
    };

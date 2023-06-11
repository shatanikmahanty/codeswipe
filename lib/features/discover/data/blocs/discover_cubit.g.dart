// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiscoverState _$$_DiscoverStateFromJson(Map<String, dynamic> json) =>
    _$_DiscoverState(
      profiles: (json['profiles'] as List<dynamic>?)
              ?.map((e) => AppUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$_DiscoverStateToJson(_$_DiscoverState instance) =>
    <String, dynamic>{
      'profiles': instance.profiles,
      'isLoading': instance.isLoading,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BannerState _$$_BannerStateFromJson(Map<String, dynamic> json) =>
    _$_BannerState(
      models: (json['models'] as List<dynamic>?)
              ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$_BannerStateToJson(_$_BannerState instance) =>
    <String, dynamic>{
      'models': instance.models,
      'isLoading': instance.isLoading,
    };

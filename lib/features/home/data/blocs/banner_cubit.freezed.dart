// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BannerState _$BannerStateFromJson(Map<String, dynamic> json) {
  return _BannerState.fromJson(json);
}

/// @nodoc
mixin _$BannerState {
  List<BannerModel> get models => throw _privateConstructorUsedError;

  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BannerStateCopyWith<BannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerStateCopyWith<$Res> {
  factory $BannerStateCopyWith(
          BannerState value, $Res Function(BannerState) then) =
      _$BannerStateCopyWithImpl<$Res, BannerState>;

  @useResult
  $Res call({List<BannerModel> models, bool isLoading});
}

/// @nodoc
class _$BannerStateCopyWithImpl<$Res, $Val extends BannerState>
    implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      models: null == models
          ? _value.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<BannerModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BannerStateCopyWith<$Res>
    implements $BannerStateCopyWith<$Res> {
  factory _$$_BannerStateCopyWith(
          _$_BannerState value, $Res Function(_$_BannerState) then) =
      __$$_BannerStateCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({List<BannerModel> models, bool isLoading});
}

/// @nodoc
class __$$_BannerStateCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$_BannerState>
    implements _$$_BannerStateCopyWith<$Res> {
  __$$_BannerStateCopyWithImpl(
      _$_BannerState _value, $Res Function(_$_BannerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = null,
    Object? isLoading = null,
  }) {
    return _then(_$_BannerState(
      models: null == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<BannerModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BannerState implements _BannerState {
  const _$_BannerState(
      {final List<BannerModel> models = const [], this.isLoading = false})
      : _models = models;

  factory _$_BannerState.fromJson(Map<String, dynamic> json) =>
      _$$_BannerStateFromJson(json);

  final List<BannerModel> _models;

  @override
  @JsonKey()
  List<BannerModel> get models {
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_models);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'BannerState(models: $models, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BannerState &&
            const DeepCollectionEquality().equals(other._models, _models) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_models), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BannerStateCopyWith<_$_BannerState> get copyWith =>
      __$$_BannerStateCopyWithImpl<_$_BannerState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BannerStateToJson(
      this,
    );
  }
}

abstract class _BannerState implements BannerState {
  const factory _BannerState(
      {final List<BannerModel> models, final bool isLoading}) = _$_BannerState;

  factory _BannerState.fromJson(Map<String, dynamic> json) =
      _$_BannerState.fromJson;

  @override
  List<BannerModel> get models;

  @override
  bool get isLoading;

  @override
  @JsonKey(ignore: true)
  _$$_BannerStateCopyWith<_$_BannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

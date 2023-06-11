// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiscoverState _$DiscoverStateFromJson(Map<String, dynamic> json) {
  return _DiscoverState.fromJson(json);
}

/// @nodoc
mixin _$DiscoverState {
  List<AppUser> get profiles => throw _privateConstructorUsedError;

  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscoverStateCopyWith<DiscoverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverStateCopyWith<$Res> {
  factory $DiscoverStateCopyWith(
          DiscoverState value, $Res Function(DiscoverState) then) =
      _$DiscoverStateCopyWithImpl<$Res, DiscoverState>;

  @useResult
  $Res call({List<AppUser> profiles, bool isLoading});
}

/// @nodoc
class _$DiscoverStateCopyWithImpl<$Res, $Val extends DiscoverState>
    implements $DiscoverStateCopyWith<$Res> {
  _$DiscoverStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profiles = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      profiles: null == profiles
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<AppUser>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscoverStateCopyWith<$Res>
    implements $DiscoverStateCopyWith<$Res> {
  factory _$$_DiscoverStateCopyWith(
          _$_DiscoverState value, $Res Function(_$_DiscoverState) then) =
      __$$_DiscoverStateCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({List<AppUser> profiles, bool isLoading});
}

/// @nodoc
class __$$_DiscoverStateCopyWithImpl<$Res>
    extends _$DiscoverStateCopyWithImpl<$Res, _$_DiscoverState>
    implements _$$_DiscoverStateCopyWith<$Res> {
  __$$_DiscoverStateCopyWithImpl(
      _$_DiscoverState _value, $Res Function(_$_DiscoverState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profiles = null,
    Object? isLoading = null,
  }) {
    return _then(_$_DiscoverState(
      profiles: null == profiles
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<AppUser>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiscoverState implements _DiscoverState {
  const _$_DiscoverState(
      {final List<AppUser> profiles = const [], this.isLoading = false})
      : _profiles = profiles;

  factory _$_DiscoverState.fromJson(Map<String, dynamic> json) =>
      _$$_DiscoverStateFromJson(json);

  final List<AppUser> _profiles;

  @override
  @JsonKey()
  List<AppUser> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'DiscoverState(profiles: $profiles, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscoverState &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_profiles), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscoverStateCopyWith<_$_DiscoverState> get copyWith =>
      __$$_DiscoverStateCopyWithImpl<_$_DiscoverState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscoverStateToJson(
      this,
    );
  }
}

abstract class _DiscoverState implements DiscoverState {
  const factory _DiscoverState(
      {final List<AppUser> profiles, final bool isLoading}) = _$_DiscoverState;

  factory _DiscoverState.fromJson(Map<String, dynamic> json) =
      _$_DiscoverState.fromJson;

  @override
  List<AppUser> get profiles;

  @override
  bool get isLoading;

  @override
  @JsonKey(ignore: true)
  _$$_DiscoverStateCopyWith<_$_DiscoverState> get copyWith =>
      throw _privateConstructorUsedError;
}

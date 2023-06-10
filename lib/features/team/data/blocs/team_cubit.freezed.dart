// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamState _$TeamStateFromJson(Map<String, dynamic> json) {
  return _TeamState.fromJson(json);
}

/// @nodoc
mixin _$TeamState {
  UserTeam? get team => throw _privateConstructorUsedError;

  bool get isLoading => throw _privateConstructorUsedError;

  String? get pickedImagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeamStateCopyWith<TeamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamStateCopyWith<$Res> {
  factory $TeamStateCopyWith(TeamState value, $Res Function(TeamState) then) =
      _$TeamStateCopyWithImpl<$Res, TeamState>;

  @useResult
  $Res call({UserTeam? team, bool isLoading, String? pickedImagePath});

  $UserTeamCopyWith<$Res>? get team;
}

/// @nodoc
class _$TeamStateCopyWithImpl<$Res, $Val extends TeamState>
    implements $TeamStateCopyWith<$Res> {
  _$TeamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = freezed,
    Object? isLoading = null,
    Object? pickedImagePath = freezed,
  }) {
    return _then(_value.copyWith(
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as UserTeam?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      pickedImagePath: freezed == pickedImagePath
          ? _value.pickedImagePath
          : pickedImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserTeamCopyWith<$Res>? get team {
    if (_value.team == null) {
      return null;
    }

    return $UserTeamCopyWith<$Res>(_value.team!, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TeamStateCopyWith<$Res> implements $TeamStateCopyWith<$Res> {
  factory _$$_TeamStateCopyWith(
          _$_TeamState value, $Res Function(_$_TeamState) then) =
      __$$_TeamStateCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({UserTeam? team, bool isLoading, String? pickedImagePath});

  @override
  $UserTeamCopyWith<$Res>? get team;
}

/// @nodoc
class __$$_TeamStateCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_TeamState>
    implements _$$_TeamStateCopyWith<$Res> {
  __$$_TeamStateCopyWithImpl(
      _$_TeamState _value, $Res Function(_$_TeamState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = freezed,
    Object? isLoading = null,
    Object? pickedImagePath = freezed,
  }) {
    return _then(_$_TeamState(
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as UserTeam?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      pickedImagePath: freezed == pickedImagePath
          ? _value.pickedImagePath
          : pickedImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamState implements _TeamState {
  const _$_TeamState({this.team, this.isLoading = false, this.pickedImagePath});

  factory _$_TeamState.fromJson(Map<String, dynamic> json) =>
      _$$_TeamStateFromJson(json);

  @override
  final UserTeam? team;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? pickedImagePath;

  @override
  String toString() {
    return 'TeamState(team: $team, isLoading: $isLoading, pickedImagePath: $pickedImagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamState &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.pickedImagePath, pickedImagePath) ||
                other.pickedImagePath == pickedImagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, team, isLoading, pickedImagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamStateCopyWith<_$_TeamState> get copyWith =>
      __$$_TeamStateCopyWithImpl<_$_TeamState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamStateToJson(
      this,
    );
  }
}

abstract class _TeamState implements TeamState {
  const factory _TeamState(
      {final UserTeam? team,
      final bool isLoading,
      final String? pickedImagePath}) = _$_TeamState;

  factory _TeamState.fromJson(Map<String, dynamic> json) =
      _$_TeamState.fromJson;

  @override
  UserTeam? get team;

  @override
  bool get isLoading;

  @override
  String? get pickedImagePath;

  @override
  @JsonKey(ignore: true)
  _$$_TeamStateCopyWith<_$_TeamState> get copyWith =>
      throw _privateConstructorUsedError;
}

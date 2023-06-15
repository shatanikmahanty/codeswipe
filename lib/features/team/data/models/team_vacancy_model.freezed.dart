// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_vacancy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamVacancy _$TeamVacancyFromJson(Map<String, dynamic> json) {
  return _TeamVacancy.fromJson(json);
}

/// @nodoc
mixin _$TeamVacancy {
  @JsonKey(name: '\$id')
  String get id => throw _privateConstructorUsedError;

  String get position => throw _privateConstructorUsedError;

  String get skills => throw _privateConstructorUsedError;

  String get expectations => throw _privateConstructorUsedError;

  @JsonKey(name: 'team_id')
  String get teamId => throw _privateConstructorUsedError;

  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(name: 'created_by')
  String get createdBy => throw _privateConstructorUsedError;

  @JsonKey(name: 'join_requests')
  List<String> get joinRequests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeamVacancyCopyWith<TeamVacancy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamVacancyCopyWith<$Res> {
  factory $TeamVacancyCopyWith(
          TeamVacancy value, $Res Function(TeamVacancy) then) =
      _$TeamVacancyCopyWithImpl<$Res, TeamVacancy>;

  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String id,
      String position,
      String skills,
      String expectations,
      @JsonKey(name: 'team_id') String teamId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'join_requests') List<String> joinRequests});
}

/// @nodoc
class _$TeamVacancyCopyWithImpl<$Res, $Val extends TeamVacancy>
    implements $TeamVacancyCopyWith<$Res> {
  _$TeamVacancyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? skills = null,
    Object? expectations = null,
    Object? teamId = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? joinRequests = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as String,
      expectations: null == expectations
          ? _value.expectations
          : expectations // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      joinRequests: null == joinRequests
          ? _value.joinRequests
          : joinRequests // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeamVacancyCopyWith<$Res>
    implements $TeamVacancyCopyWith<$Res> {
  factory _$$_TeamVacancyCopyWith(
          _$_TeamVacancy value, $Res Function(_$_TeamVacancy) then) =
      __$$_TeamVacancyCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String id,
      String position,
      String skills,
      String expectations,
      @JsonKey(name: 'team_id') String teamId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'join_requests') List<String> joinRequests});
}

/// @nodoc
class __$$_TeamVacancyCopyWithImpl<$Res>
    extends _$TeamVacancyCopyWithImpl<$Res, _$_TeamVacancy>
    implements _$$_TeamVacancyCopyWith<$Res> {
  __$$_TeamVacancyCopyWithImpl(
      _$_TeamVacancy _value, $Res Function(_$_TeamVacancy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? skills = null,
    Object? expectations = null,
    Object? teamId = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? joinRequests = null,
  }) {
    return _then(_$_TeamVacancy(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as String,
      expectations: null == expectations
          ? _value.expectations
          : expectations // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      joinRequests: null == joinRequests
          ? _value._joinRequests
          : joinRequests // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamVacancy implements _TeamVacancy {
  const _$_TeamVacancy(
      {@JsonKey(name: '\$id') required this.id,
      required this.position,
      required this.skills,
      required this.expectations,
      @JsonKey(name: 'team_id') required this.teamId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'created_by') required this.createdBy,
      @JsonKey(name: 'join_requests') required final List<String> joinRequests})
      : _joinRequests = joinRequests;

  factory _$_TeamVacancy.fromJson(Map<String, dynamic> json) =>
      _$$_TeamVacancyFromJson(json);

  @override
  @JsonKey(name: '\$id')
  final String id;
  @override
  final String position;
  @override
  final String skills;
  @override
  final String expectations;
  @override
  @JsonKey(name: 'team_id')
  final String teamId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by')
  final String createdBy;
  final List<String> _joinRequests;

  @override
  @JsonKey(name: 'join_requests')
  List<String> get joinRequests {
    if (_joinRequests is EqualUnmodifiableListView) return _joinRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinRequests);
  }

  @override
  String toString() {
    return 'TeamVacancy(id: $id, position: $position, skills: $skills, expectations: $expectations, teamId: $teamId, createdAt: $createdAt, createdBy: $createdBy, joinRequests: $joinRequests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamVacancy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.skills, skills) || other.skills == skills) &&
            (identical(other.expectations, expectations) ||
                other.expectations == expectations) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality()
                .equals(other._joinRequests, _joinRequests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      position,
      skills,
      expectations,
      teamId,
      createdAt,
      createdBy,
      const DeepCollectionEquality().hash(_joinRequests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamVacancyCopyWith<_$_TeamVacancy> get copyWith =>
      __$$_TeamVacancyCopyWithImpl<_$_TeamVacancy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamVacancyToJson(
      this,
    );
  }
}

abstract class _TeamVacancy implements TeamVacancy {
  const factory _TeamVacancy(
      {@JsonKey(name: '\$id') required final String id,
      required final String position,
      required final String skills,
      required final String expectations,
      @JsonKey(name: 'team_id') required final String teamId,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'created_by') required final String createdBy,
      @JsonKey(name: 'join_requests')
      required final List<String> joinRequests}) = _$_TeamVacancy;

  factory _TeamVacancy.fromJson(Map<String, dynamic> json) =
      _$_TeamVacancy.fromJson;

  @override
  @JsonKey(name: '\$id')
  String get id;

  @override
  String get position;

  @override
  String get skills;

  @override
  String get expectations;

  @override
  @JsonKey(name: 'team_id')
  String get teamId;

  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  @override
  @JsonKey(name: 'created_by')
  String get createdBy;

  @override
  @JsonKey(name: 'join_requests')
  List<String> get joinRequests;

  @override
  @JsonKey(ignore: true)
  _$$_TeamVacancyCopyWith<_$_TeamVacancy> get copyWith =>
      throw _privateConstructorUsedError;
}

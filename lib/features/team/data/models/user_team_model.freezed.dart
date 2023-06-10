// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserTeam _$UserTeamFromJson(Map<String, dynamic> json) {
  return _UserTeam.fromJson(json);
}

/// @nodoc
mixin _$UserTeam {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: '\$id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_image')
  String get teamImage => throw _privateConstructorUsedError;
  List<String>? get member => throw _privateConstructorUsedError;
  @JsonKey(name: '\$member_roles')
  String get memberRoles => throw _privateConstructorUsedError;
  String get admin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTeamCopyWith<UserTeam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTeamCopyWith<$Res> {
  factory $UserTeamCopyWith(UserTeam value, $Res Function(UserTeam) then) =
      _$UserTeamCopyWithImpl<$Res, UserTeam>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: '\$id') String id,
      @JsonKey(name: 'team_image') String teamImage,
      List<String>? member,
      @JsonKey(name: '\$member_roles') String memberRoles,
      String admin});
}

/// @nodoc
class _$UserTeamCopyWithImpl<$Res, $Val extends UserTeam>
    implements $UserTeamCopyWith<$Res> {
  _$UserTeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? teamImage = null,
    Object? member = freezed,
    Object? memberRoles = null,
    Object? admin = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamImage: null == teamImage
          ? _value.teamImage
          : teamImage // ignore: cast_nullable_to_non_nullable
              as String,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      memberRoles: null == memberRoles
          ? _value.memberRoles
          : memberRoles // ignore: cast_nullable_to_non_nullable
              as String,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserTeamCopyWith<$Res> implements $UserTeamCopyWith<$Res> {
  factory _$$_UserTeamCopyWith(
          _$_UserTeam value, $Res Function(_$_UserTeam) then) =
      __$$_UserTeamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: '\$id') String id,
      @JsonKey(name: 'team_image') String teamImage,
      List<String>? member,
      @JsonKey(name: '\$member_roles') String memberRoles,
      String admin});
}

/// @nodoc
class __$$_UserTeamCopyWithImpl<$Res>
    extends _$UserTeamCopyWithImpl<$Res, _$_UserTeam>
    implements _$$_UserTeamCopyWith<$Res> {
  __$$_UserTeamCopyWithImpl(
      _$_UserTeam _value, $Res Function(_$_UserTeam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? teamImage = null,
    Object? member = freezed,
    Object? memberRoles = null,
    Object? admin = null,
  }) {
    return _then(_$_UserTeam(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamImage: null == teamImage
          ? _value.teamImage
          : teamImage // ignore: cast_nullable_to_non_nullable
              as String,
      member: freezed == member
          ? _value._member
          : member // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      memberRoles: null == memberRoles
          ? _value.memberRoles
          : memberRoles // ignore: cast_nullable_to_non_nullable
              as String,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserTeam implements _UserTeam {
  const _$_UserTeam(
      {required this.name,
      @JsonKey(name: '\$id') required this.id,
      @JsonKey(name: 'team_image') required this.teamImage,
      final List<String>? member,
      @JsonKey(name: '\$member_roles') required this.memberRoles,
      required this.admin})
      : _member = member;

  factory _$_UserTeam.fromJson(Map<String, dynamic> json) =>
      _$$_UserTeamFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: '\$id')
  final String id;
  @override
  @JsonKey(name: 'team_image')
  final String teamImage;
  final List<String>? _member;
  @override
  List<String>? get member {
    final value = _member;
    if (value == null) return null;
    if (_member is EqualUnmodifiableListView) return _member;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: '\$member_roles')
  final String memberRoles;
  @override
  final String admin;

  @override
  String toString() {
    return 'UserTeam(name: $name, id: $id, teamImage: $teamImage, member: $member, memberRoles: $memberRoles, admin: $admin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserTeam &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teamImage, teamImage) ||
                other.teamImage == teamImage) &&
            const DeepCollectionEquality().equals(other._member, _member) &&
            (identical(other.memberRoles, memberRoles) ||
                other.memberRoles == memberRoles) &&
            (identical(other.admin, admin) || other.admin == admin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, teamImage,
      const DeepCollectionEquality().hash(_member), memberRoles, admin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserTeamCopyWith<_$_UserTeam> get copyWith =>
      __$$_UserTeamCopyWithImpl<_$_UserTeam>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserTeamToJson(
      this,
    );
  }
}

abstract class _UserTeam implements UserTeam {
  const factory _UserTeam(
      {required final String name,
      @JsonKey(name: '\$id') required final String id,
      @JsonKey(name: 'team_image') required final String teamImage,
      final List<String>? member,
      @JsonKey(name: '\$member_roles') required final String memberRoles,
      required final String admin}) = _$_UserTeam;

  factory _UserTeam.fromJson(Map<String, dynamic> json) = _$_UserTeam.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: '\$id')
  String get id;
  @override
  @JsonKey(name: 'team_image')
  String get teamImage;
  @override
  List<String>? get member;
  @override
  @JsonKey(name: '\$member_roles')
  String get memberRoles;
  @override
  String get admin;
  @override
  @JsonKey(ignore: true)
  _$$_UserTeamCopyWith<_$_UserTeam> get copyWith =>
      throw _privateConstructorUsedError;
}

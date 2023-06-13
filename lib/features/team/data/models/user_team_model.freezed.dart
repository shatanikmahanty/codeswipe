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
  @JsonKey(name: 'members')
  List<String>? get memberIDs => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<AppUser>? get members => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'member_roles', readValue: _memberRolesFromJson, toJson: jsonEncode)
  Map<String, dynamic>? get memberRoles => throw _privateConstructorUsedError;
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
      @JsonKey(name: '\$id')
          String id,
      @JsonKey(name: 'members')
          List<String>? memberIDs,
      @JsonKey(includeFromJson: false, includeToJson: false)
          List<AppUser>? members,
      @JsonKey(name: 'member_roles', readValue: _memberRolesFromJson, toJson: jsonEncode)
          Map<String, dynamic>? memberRoles,
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
    Object? memberIDs = freezed,
    Object? members = freezed,
    Object? memberRoles = freezed,
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
      memberIDs: freezed == memberIDs
          ? _value.memberIDs
          : memberIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<AppUser>?,
      memberRoles: freezed == memberRoles
          ? _value.memberRoles
          : memberRoles // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
      @JsonKey(name: '\$id')
          String id,
      @JsonKey(name: 'members')
          List<String>? memberIDs,
      @JsonKey(includeFromJson: false, includeToJson: false)
          List<AppUser>? members,
      @JsonKey(name: 'member_roles', readValue: _memberRolesFromJson, toJson: jsonEncode)
          Map<String, dynamic>? memberRoles,
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
    Object? memberIDs = freezed,
    Object? members = freezed,
    Object? memberRoles = freezed,
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
      memberIDs: freezed == memberIDs
          ? _value._memberIDs
          : memberIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<AppUser>?,
      memberRoles: freezed == memberRoles
          ? _value._memberRoles
          : memberRoles // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
      @JsonKey(name: '\$id')
          required this.id,
      @JsonKey(name: 'members')
          final List<String>? memberIDs,
      @JsonKey(includeFromJson: false, includeToJson: false)
          final List<AppUser>? members,
      @JsonKey(name: 'member_roles', readValue: _memberRolesFromJson, toJson: jsonEncode)
          final Map<String, dynamic>? memberRoles,
      required this.admin})
      : _memberIDs = memberIDs,
        _members = members,
        _memberRoles = memberRoles;

  factory _$_UserTeam.fromJson(Map<String, dynamic> json) =>
      _$$_UserTeamFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: '\$id')
  final String id;
  final List<String>? _memberIDs;
  @override
  @JsonKey(name: 'members')
  List<String>? get memberIDs {
    final value = _memberIDs;
    if (value == null) return null;
    if (_memberIDs is EqualUnmodifiableListView) return _memberIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AppUser>? _members;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<AppUser>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _memberRoles;
  @override
  @JsonKey(
      name: 'member_roles', readValue: _memberRolesFromJson, toJson: jsonEncode)
  Map<String, dynamic>? get memberRoles {
    final value = _memberRoles;
    if (value == null) return null;
    if (_memberRoles is EqualUnmodifiableMapView) return _memberRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String admin;

  @override
  String toString() {
    return 'UserTeam(name: $name, id: $id, memberIDs: $memberIDs, members: $members, memberRoles: $memberRoles, admin: $admin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserTeam &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._memberIDs, _memberIDs) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality()
                .equals(other._memberRoles, _memberRoles) &&
            (identical(other.admin, admin) || other.admin == admin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      id,
      const DeepCollectionEquality().hash(_memberIDs),
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_memberRoles),
      admin);

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
      @JsonKey(name: '\$id')
          required final String id,
      @JsonKey(name: 'members')
          final List<String>? memberIDs,
      @JsonKey(includeFromJson: false, includeToJson: false)
          final List<AppUser>? members,
      @JsonKey(name: 'member_roles', readValue: _memberRolesFromJson, toJson: jsonEncode)
          final Map<String, dynamic>? memberRoles,
      required final String admin}) = _$_UserTeam;

  factory _UserTeam.fromJson(Map<String, dynamic> json) = _$_UserTeam.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: '\$id')
  String get id;
  @override
  @JsonKey(name: 'members')
  List<String>? get memberIDs;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<AppUser>? get members;
  @override
  @JsonKey(
      name: 'member_roles', readValue: _memberRolesFromJson, toJson: jsonEncode)
  Map<String, dynamic>? get memberRoles;
  @override
  String get admin;
  @override
  @JsonKey(ignore: true)
  _$$_UserTeamCopyWith<_$_UserTeam> get copyWith =>
      throw _privateConstructorUsedError;
}

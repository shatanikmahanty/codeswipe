// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get id => throw _privateConstructorUsedError;

  String get name => throw _privateConstructorUsedError;

  @JsonKey(includeIfNull: false)
  String? get email => throw _privateConstructorUsedError;

  @JsonKey(includeIfNull: false)
  String? get phone => throw _privateConstructorUsedError;

  @JsonKey(includeIfNull: false, name: 'gh_access_token')
  String? get ghAccessToken => throw _privateConstructorUsedError;

  @JsonKey(includeIfNull: false, name: 'gh_token_expiry')
  String? get ghTokenExpiry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;

  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(includeIfNull: false) String? email,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false, name: 'gh_access_token')
      String? ghAccessToken,
      @JsonKey(includeIfNull: false, name: 'gh_token_expiry')
      String? ghTokenExpiry});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? ghAccessToken = freezed,
    Object? ghTokenExpiry = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      ghAccessToken: freezed == ghAccessToken
          ? _value.ghAccessToken
          : ghAccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      ghTokenExpiry: freezed == ghTokenExpiry
          ? _value.ghTokenExpiry
          : ghTokenExpiry // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(includeIfNull: false) String? email,
      @JsonKey(includeIfNull: false) String? phone,
      @JsonKey(includeIfNull: false, name: 'gh_access_token')
      String? ghAccessToken,
      @JsonKey(includeIfNull: false, name: 'gh_token_expiry')
      String? ghTokenExpiry});
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$_AppUser>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? ghAccessToken = freezed,
    Object? ghTokenExpiry = freezed,
  }) {
    return _then(_$_AppUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      ghAccessToken: freezed == ghAccessToken
          ? _value.ghAccessToken
          : ghAccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      ghTokenExpiry: freezed == ghTokenExpiry
          ? _value.ghTokenExpiry
          : ghTokenExpiry // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser implements _AppUser {
  const _$_AppUser(
      {required this.id,
      required this.name,
      @JsonKey(includeIfNull: false) this.email,
      @JsonKey(includeIfNull: false) this.phone,
      @JsonKey(includeIfNull: false, name: 'gh_access_token')
      this.ghAccessToken,
      @JsonKey(includeIfNull: false, name: 'gh_token_expiry')
      this.ghTokenExpiry});

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(includeIfNull: false)
  final String? email;
  @override
  @JsonKey(includeIfNull: false)
  final String? phone;
  @override
  @JsonKey(includeIfNull: false, name: 'gh_access_token')
  final String? ghAccessToken;
  @override
  @JsonKey(includeIfNull: false, name: 'gh_token_expiry')
  final String? ghTokenExpiry;

  @override
  String toString() {
    return 'AppUser(id: $id, name: $name, email: $email, phone: $phone, ghAccessToken: $ghAccessToken, ghTokenExpiry: $ghTokenExpiry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.ghAccessToken, ghAccessToken) ||
                other.ghAccessToken == ghAccessToken) &&
            (identical(other.ghTokenExpiry, ghTokenExpiry) ||
                other.ghTokenExpiry == ghTokenExpiry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, email, phone, ghAccessToken, ghTokenExpiry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {required final String id,
      required final String name,
      @JsonKey(includeIfNull: false) final String? email,
      @JsonKey(includeIfNull: false) final String? phone,
      @JsonKey(includeIfNull: false, name: 'gh_access_token')
      final String? ghAccessToken,
      @JsonKey(includeIfNull: false, name: 'gh_token_expiry')
      final String? ghTokenExpiry}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String get id;

  @override
  String get name;

  @override
  @JsonKey(includeIfNull: false)
  String? get email;

  @override
  @JsonKey(includeIfNull: false)
  String? get phone;

  @override
  @JsonKey(includeIfNull: false, name: 'gh_access_token')
  String? get ghAccessToken;

  @override
  @JsonKey(includeIfNull: false, name: 'gh_token_expiry')
  String? get ghTokenExpiry;

  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}

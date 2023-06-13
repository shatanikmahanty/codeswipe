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
  @JsonKey(name: 'gh_access_token')
  String? get ghAccessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'gh_token_expiry')
  String? get ghTokenExpiry => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  List<String>? get skills => throw _privateConstructorUsedError;
  @JsonKey(name: 'hackathon_mode_interests')
  String? get hackathonModeInterests => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_location')
  String? get currentLocation => throw _privateConstructorUsedError;

  ///Preferred location of teammate
  @JsonKey(name: 'teammate_preferred_location')
  String? get teamMemberPreferredLocation => throw _privateConstructorUsedError;

  ///Preferred  hackathon themes
  @JsonKey(name: 'hackathon_theme_interests')
  List<String>? get hackathonThemeInterests =>
      throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'college_name')
  String? get collegeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'graduation_year')
  String? get graduationYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'course')
  String? get course => throw _privateConstructorUsedError;

  @JsonKey(name: 'team_id')
  String? get teamId => throw _privateConstructorUsedError;

  String? get avatar => throw _privateConstructorUsedError;

  List<String>? get likes => throw _privateConstructorUsedError;

  List<String>? get dislikes => throw _privateConstructorUsedError;

  @JsonKey(name: 'match_requests')
  List<String>? get matchRequests => throw _privateConstructorUsedError;

  @JsonKey(name: 'matches')
  List<String>? get matches => throw _privateConstructorUsedError;

  @JsonKey(name: 'chat_rooms')
  List<String>? get chatRooms => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'gh_access_token') String? ghAccessToken,
      @JsonKey(name: 'gh_token_expiry') String? ghTokenExpiry,
      @JsonKey(includeIfNull: false) List<String>? skills,
      @JsonKey(name: 'hackathon_mode_interests') String? hackathonModeInterests,
      @JsonKey(name: 'current_location') String? currentLocation,
      @JsonKey(name: 'teammate_preferred_location')
      String? teamMemberPreferredLocation,
      @JsonKey(name: 'hackathon_theme_interests')
      List<String>? hackathonThemeInterests,
      String? bio,
      @JsonKey(name: 'college_name') String? collegeName,
      @JsonKey(name: 'graduation_year') String? graduationYear,
      @JsonKey(name: 'course') String? course,
      @JsonKey(name: 'team_id') String? teamId,
      String? avatar,
      List<String>? likes,
      List<String>? dislikes,
      @JsonKey(name: 'match_requests') List<String>? matchRequests,
      @JsonKey(name: 'matches') List<String>? matches,
      @JsonKey(name: 'chat_rooms') List<String>? chatRooms});
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
    Object? skills = freezed,
    Object? hackathonModeInterests = freezed,
    Object? currentLocation = freezed,
    Object? teamMemberPreferredLocation = freezed,
    Object? hackathonThemeInterests = freezed,
    Object? bio = freezed,
    Object? collegeName = freezed,
    Object? graduationYear = freezed,
    Object? course = freezed,
    Object? teamId = freezed,
    Object? avatar = freezed,
    Object? likes = freezed,
    Object? dislikes = freezed,
    Object? matchRequests = freezed,
    Object? matches = freezed,
    Object? chatRooms = freezed,
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
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hackathonModeInterests: freezed == hackathonModeInterests
          ? _value.hackathonModeInterests
          : hackathonModeInterests // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      teamMemberPreferredLocation: freezed == teamMemberPreferredLocation
          ? _value.teamMemberPreferredLocation
          : teamMemberPreferredLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      hackathonThemeInterests: freezed == hackathonThemeInterests
          ? _value.hackathonThemeInterests
          : hackathonThemeInterests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      collegeName: freezed == collegeName
          ? _value.collegeName
          : collegeName // ignore: cast_nullable_to_non_nullable
              as String?,
      graduationYear: freezed == graduationYear
          ? _value.graduationYear
          : graduationYear // ignore: cast_nullable_to_non_nullable
              as String?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String?,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      dislikes: freezed == dislikes
          ? _value.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      matchRequests: freezed == matchRequests
          ? _value.matchRequests
          : matchRequests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      matches: freezed == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      chatRooms: freezed == chatRooms
          ? _value.chatRooms
          : chatRooms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      @JsonKey(name: 'gh_access_token') String? ghAccessToken,
      @JsonKey(name: 'gh_token_expiry') String? ghTokenExpiry,
      @JsonKey(includeIfNull: false) List<String>? skills,
      @JsonKey(name: 'hackathon_mode_interests') String? hackathonModeInterests,
      @JsonKey(name: 'current_location') String? currentLocation,
      @JsonKey(name: 'teammate_preferred_location')
      String? teamMemberPreferredLocation,
      @JsonKey(name: 'hackathon_theme_interests')
      List<String>? hackathonThemeInterests,
      String? bio,
      @JsonKey(name: 'college_name') String? collegeName,
      @JsonKey(name: 'graduation_year') String? graduationYear,
      @JsonKey(name: 'course') String? course,
      @JsonKey(name: 'team_id') String? teamId,
      String? avatar,
      List<String>? likes,
      List<String>? dislikes,
      @JsonKey(name: 'match_requests') List<String>? matchRequests,
      @JsonKey(name: 'matches') List<String>? matches,
      @JsonKey(name: 'chat_rooms') List<String>? chatRooms});
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
    Object? skills = freezed,
    Object? hackathonModeInterests = freezed,
    Object? currentLocation = freezed,
    Object? teamMemberPreferredLocation = freezed,
    Object? hackathonThemeInterests = freezed,
    Object? bio = freezed,
    Object? collegeName = freezed,
    Object? graduationYear = freezed,
    Object? course = freezed,
    Object? teamId = freezed,
    Object? avatar = freezed,
    Object? likes = freezed,
    Object? dislikes = freezed,
    Object? matchRequests = freezed,
    Object? matches = freezed,
    Object? chatRooms = freezed,
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
      skills: freezed == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hackathonModeInterests: freezed == hackathonModeInterests
          ? _value.hackathonModeInterests
          : hackathonModeInterests // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      teamMemberPreferredLocation: freezed == teamMemberPreferredLocation
          ? _value.teamMemberPreferredLocation
          : teamMemberPreferredLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      hackathonThemeInterests: freezed == hackathonThemeInterests
          ? _value._hackathonThemeInterests
          : hackathonThemeInterests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      collegeName: freezed == collegeName
          ? _value.collegeName
          : collegeName // ignore: cast_nullable_to_non_nullable
              as String?,
      graduationYear: freezed == graduationYear
          ? _value.graduationYear
          : graduationYear // ignore: cast_nullable_to_non_nullable
              as String?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String?,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      dislikes: freezed == dislikes
          ? _value._dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      matchRequests: freezed == matchRequests
          ? _value._matchRequests
          : matchRequests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      matches: freezed == matches
          ? _value._matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      chatRooms: freezed == chatRooms
          ? _value._chatRooms
          : chatRooms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      @JsonKey(name: 'gh_access_token') this.ghAccessToken,
      @JsonKey(name: 'gh_token_expiry') this.ghTokenExpiry,
      @JsonKey(includeIfNull: false) final List<String>? skills,
      @JsonKey(name: 'hackathon_mode_interests') this.hackathonModeInterests,
      @JsonKey(name: 'current_location') this.currentLocation,
      @JsonKey(name: 'teammate_preferred_location')
      this.teamMemberPreferredLocation,
      @JsonKey(name: 'hackathon_theme_interests')
      final List<String>? hackathonThemeInterests,
      this.bio,
      @JsonKey(name: 'college_name') this.collegeName,
      @JsonKey(name: 'graduation_year') this.graduationYear,
      @JsonKey(name: 'course') this.course,
      @JsonKey(name: 'team_id') this.teamId,
      this.avatar,
      final List<String>? likes,
      final List<String>? dislikes,
      @JsonKey(name: 'match_requests') final List<String>? matchRequests,
      @JsonKey(name: 'matches') final List<String>? matches,
      @JsonKey(name: 'chat_rooms') final List<String>? chatRooms})
      : _skills = skills,
        _hackathonThemeInterests = hackathonThemeInterests,
        _likes = likes,
        _dislikes = dislikes,
        _matchRequests = matchRequests,
        _matches = matches,
        _chatRooms = chatRooms;

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
  @JsonKey(name: 'gh_access_token')
  final String? ghAccessToken;
  @override
  @JsonKey(name: 'gh_token_expiry')
  final String? ghTokenExpiry;
  final List<String>? _skills;
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'hackathon_mode_interests')
  final String? hackathonModeInterests;
  @override
  @JsonKey(name: 'current_location')
  final String? currentLocation;

  ///Preferred location of teammate
  @override
  @JsonKey(name: 'teammate_preferred_location')
  final String? teamMemberPreferredLocation;

  ///Preferred  hackathon themes
  final List<String>? _hackathonThemeInterests;

  ///Preferred  hackathon themes
  @override
  @JsonKey(name: 'hackathon_theme_interests')
  List<String>? get hackathonThemeInterests {
    final value = _hackathonThemeInterests;
    if (value == null) return null;
    if (_hackathonThemeInterests is EqualUnmodifiableListView)
      return _hackathonThemeInterests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? bio;
  @override
  @JsonKey(name: 'college_name')
  final String? collegeName;
  @override
  @JsonKey(name: 'graduation_year')
  final String? graduationYear;
  @override
  @JsonKey(name: 'course')
  final String? course;
  @override
  @JsonKey(name: 'team_id')
  final String? teamId;
  @override
  final String? avatar;
  final List<String>? _likes;
  @override
  List<String>? get likes {
    final value = _likes;
    if (value == null) return null;
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _dislikes;
  @override
  List<String>? get dislikes {
    final value = _dislikes;
    if (value == null) return null;
    if (_dislikes is EqualUnmodifiableListView) return _dislikes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _matchRequests;
  @override
  @JsonKey(name: 'match_requests')
  List<String>? get matchRequests {
    final value = _matchRequests;
    if (value == null) return null;
    if (_matchRequests is EqualUnmodifiableListView) return _matchRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _matches;

  @override
  @JsonKey(name: 'matches')
  List<String>? get matches {
    final value = _matches;
    if (value == null) return null;
    if (_matches is EqualUnmodifiableListView) return _matches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _chatRooms;

  @override
  @JsonKey(name: 'chat_rooms')
  List<String>? get chatRooms {
    final value = _chatRooms;
    if (value == null) return null;
    if (_chatRooms is EqualUnmodifiableListView) return _chatRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppUser(id: $id, name: $name, email: $email, phone: $phone, ghAccessToken: $ghAccessToken, ghTokenExpiry: $ghTokenExpiry, skills: $skills, hackathonModeInterests: $hackathonModeInterests, currentLocation: $currentLocation, teamMemberPreferredLocation: $teamMemberPreferredLocation, hackathonThemeInterests: $hackathonThemeInterests, bio: $bio, collegeName: $collegeName, graduationYear: $graduationYear, course: $course, teamId: $teamId, avatar: $avatar, likes: $likes, dislikes: $dislikes, matchRequests: $matchRequests, matches: $matches, chatRooms: $chatRooms)';
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
                other.ghTokenExpiry == ghTokenExpiry) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.hackathonModeInterests, hackathonModeInterests) ||
                other.hackathonModeInterests == hackathonModeInterests) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.teamMemberPreferredLocation,
                    teamMemberPreferredLocation) ||
                other.teamMemberPreferredLocation ==
                    teamMemberPreferredLocation) &&
            const DeepCollectionEquality().equals(
                other._hackathonThemeInterests, _hackathonThemeInterests) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.collegeName, collegeName) ||
                other.collegeName == collegeName) &&
            (identical(other.graduationYear, graduationYear) ||
                other.graduationYear == graduationYear) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality().equals(other._dislikes, _dislikes) &&
            const DeepCollectionEquality()
                .equals(other._matchRequests, _matchRequests) &&
            const DeepCollectionEquality().equals(other._matches, _matches) &&
            const DeepCollectionEquality()
                .equals(other._chatRooms, _chatRooms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        email,
        phone,
        ghAccessToken,
        ghTokenExpiry,
        const DeepCollectionEquality().hash(_skills),
        hackathonModeInterests,
        currentLocation,
        teamMemberPreferredLocation,
        const DeepCollectionEquality().hash(_hackathonThemeInterests),
        bio,
        collegeName,
        graduationYear,
        course,
        teamId,
        avatar,
        const DeepCollectionEquality().hash(_likes),
        const DeepCollectionEquality().hash(_dislikes),
        const DeepCollectionEquality().hash(_matchRequests),
        const DeepCollectionEquality().hash(_matches),
        const DeepCollectionEquality().hash(_chatRooms)
      ]);

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
      @JsonKey(name: 'gh_access_token') final String? ghAccessToken,
      @JsonKey(name: 'gh_token_expiry') final String? ghTokenExpiry,
      @JsonKey(includeIfNull: false) final List<String>? skills,
      @JsonKey(name: 'hackathon_mode_interests')
      final String? hackathonModeInterests,
      @JsonKey(name: 'current_location') final String? currentLocation,
      @JsonKey(name: 'teammate_preferred_location')
      final String? teamMemberPreferredLocation,
      @JsonKey(name: 'hackathon_theme_interests')
      final List<String>? hackathonThemeInterests,
      final String? bio,
      @JsonKey(name: 'college_name') final String? collegeName,
      @JsonKey(name: 'graduation_year') final String? graduationYear,
      @JsonKey(name: 'course') final String? course,
      @JsonKey(name: 'team_id') final String? teamId,
      final String? avatar,
      final List<String>? likes,
      final List<String>? dislikes,
      @JsonKey(name: 'match_requests') final List<String>? matchRequests,
      @JsonKey(name: 'matches') final List<String>? matches,
      @JsonKey(name: 'chat_rooms') final List<String>? chatRooms}) = _$_AppUser;

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
  @JsonKey(name: 'gh_access_token')
  String? get ghAccessToken;
  @override
  @JsonKey(name: 'gh_token_expiry')
  String? get ghTokenExpiry;
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get skills;
  @override
  @JsonKey(name: 'hackathon_mode_interests')
  String? get hackathonModeInterests;
  @override
  @JsonKey(name: 'current_location')
  String? get currentLocation;
  @override

  ///Preferred location of teammate
  @JsonKey(name: 'teammate_preferred_location')
  String? get teamMemberPreferredLocation;
  @override

  ///Preferred  hackathon themes
  @JsonKey(name: 'hackathon_theme_interests')
  List<String>? get hackathonThemeInterests;
  @override
  String? get bio;
  @override
  @JsonKey(name: 'college_name')
  String? get collegeName;
  @override
  @JsonKey(name: 'graduation_year')
  String? get graduationYear;
  @override
  @JsonKey(name: 'course')
  String? get course;
  @override
  @JsonKey(name: 'team_id')
  String? get teamId;
  @override
  String? get avatar;

  @override
  List<String>? get likes;

  @override
  List<String>? get dislikes;

  @override
  @JsonKey(name: 'match_requests')
  List<String>? get matchRequests;

  @override
  @JsonKey(name: 'matches')
  List<String>? get matches;

  @override
  @JsonKey(name: 'chat_rooms')
  List<String>? get chatRooms;

  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}

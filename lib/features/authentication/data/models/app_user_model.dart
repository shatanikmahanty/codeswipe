import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

//ignore_for_file: invalid_annotation_target
@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String name,
    @JsonKey(includeIfNull: false) String? email,
    @JsonKey(includeIfNull: false) String? phone,
    @JsonKey(name: 'gh_access_token') String? ghAccessToken,
    @JsonKey(name: 'gh_token_expiry') String? ghTokenExpiry,
    @JsonKey(includeIfNull: false) List<String>? skills,
    @JsonKey(name: 'hackathon_mode_interests') String? hackathonModeInterests,
    @JsonKey(name: 'current_location') String? currentLocation,

    ///Preferred location of teammate
    @JsonKey(name: 'teammate_preferred_location')
    String? teamMemberPreferredLocation,

    ///Preferred  hackathon themes
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
    @JsonKey(
      name: 'matches',
    )
    List<String>? matches,
    @JsonKey(name: 'chat_rooms') List<String>? chatRooms,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

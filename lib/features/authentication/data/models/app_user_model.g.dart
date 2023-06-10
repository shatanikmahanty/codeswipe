// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      ghAccessToken: json['gh_access_token'] as String?,
      ghTokenExpiry: json['gh_token_expiry'] as String?,
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      hackathonModeInterests: json['hackathon_mode_interests'] as String?,
      currentLocation: json['current_location'] as String?,
      teamMemberPreferredLocation:
          json['teammate_preferred_location'] as String?,
      hackathonThemeInterests:
          (json['hackathon_theme_interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      bio: json['bio'] as String?,
      collegeName: json['college_name'] as String?,
      graduationYear: json['graduation_year'] as String?,
      course: json['course'] as String?,
      teamId: json['team_id'] as String?,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  val['gh_access_token'] = instance.ghAccessToken;
  val['gh_token_expiry'] = instance.ghTokenExpiry;
  writeNotNull('skills', instance.skills);
  val['hackathon_mode_interests'] = instance.hackathonModeInterests;
  val['current_location'] = instance.currentLocation;
  val['teammate_preferred_location'] = instance.teamMemberPreferredLocation;
  val['hackathon_theme_interests'] = instance.hackathonThemeInterests;
  val['bio'] = instance.bio;
  val['college_name'] = instance.collegeName;
  val['graduation_year'] = instance.graduationYear;
  val['course'] = instance.course;
  val['team_id'] = instance.teamId;
  return val;
}

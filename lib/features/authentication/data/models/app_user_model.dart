import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String name,
    @JsonKey(includeIfNull: false) String? email,
    @JsonKey(includeIfNull: false) String? phone,
    @JsonKey(includeIfNull: false, name: 'gh_access_token')
    String? ghAccessToken,
    @JsonKey(includeIfNull: false, name: 'gh_token_expiry')
    String? ghTokenExpiry,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

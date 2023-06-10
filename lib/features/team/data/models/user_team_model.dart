import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_team_model.freezed.dart';
part 'user_team_model.g.dart';

//ignore_for_file: invalid_annotation_target
@freezed
class UserTeam with _$UserTeam {
  const factory UserTeam({
    required String name,
    @JsonKey(name: '\$id') required String id,
    List<String>? member,
    @JsonKey(name: '\$member_roles') required String memberRoles,
    required String admin,
  }) = _UserTeam;

  factory UserTeam.fromJson(Map<String, dynamic> json) =>
      _$UserTeamFromJson(json);
}

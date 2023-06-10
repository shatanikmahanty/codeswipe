import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_team_model.freezed.dart';
part 'user_team_model.g.dart';

Map<String, dynamic>? _memberRolesFromJson(
  Map<dynamic, dynamic> values,
  String key,
) {
  if (values.containsKey(key)) {
    return jsonDecode(values[key].toString());
  }

  return null;
}

//ignore_for_file: invalid_annotation_target
@freezed
class UserTeam with _$UserTeam {
  const factory UserTeam({
    required String name,
    @JsonKey(name: '\$id') required String id,
    List<String>? members,
    @JsonKey(
      name: '\$member_roles',
      readValue: _memberRolesFromJson,
    )
    Map<String, dynamic>? memberRoles,
    required String admin,
  }) = _UserTeam;

  factory UserTeam.fromJson(Map<String, dynamic> json) =>
      _$UserTeamFromJson(json);
}

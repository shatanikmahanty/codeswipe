import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_vacancy_model.freezed.dart';
part 'team_vacancy_model.g.dart';

//ignore_for_file: invalid_annotation_target
@freezed
class TeamVacancy with _$TeamVacancy {
  const factory TeamVacancy({
    @JsonKey(name: '\$id') required String id,
    required String position,
    required String skills,
    required String expectations,
    @JsonKey(name: 'team_id') required String teamId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'join_requests') required List<String> joinRequests,
  }) = _TeamVacancy;

  factory TeamVacancy.fromJson(Map<String, dynamic> json) =>
      _$TeamVacancyFromJson(json);
}

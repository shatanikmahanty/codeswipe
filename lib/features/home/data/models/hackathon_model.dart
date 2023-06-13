import 'package:freezed_annotation/freezed_annotation.dart';

part 'hackathon_model.freezed.dart';
part 'hackathon_model.g.dart';

//ignore_for_file: invalid_annotation_target
@freezed
class HackathonModel with _$HackathonModel {
  const factory HackathonModel({
    @JsonKey(name: '\$id') required String id,
    required String name,
    required String mode,
    required String theme,
    @JsonKey(name: 'start_date') required DateTime startDate,
    String? onClick,
    required String banner,
  }) = _HackathonModel;

  factory HackathonModel.fromJson(Map<String, dynamic> json) =>
      _$HackathonModelFromJson(json);
}

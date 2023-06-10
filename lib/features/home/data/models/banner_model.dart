import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

//ignore_for_file: invalid_annotation_target
@freezed
class BannerModel with _$BannerModel {
  const factory BannerModel({
    @JsonKey(name: '\$id') required String id,
    required String heading,
    @JsonKey(name: 'subheading') required String subHeading,
    @JsonKey(name: 'image_url') required String imgUrl,
    @JsonKey(name: 'on_click') String? onClick,
    @JsonKey(name: 'button_text') required String buttonText,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

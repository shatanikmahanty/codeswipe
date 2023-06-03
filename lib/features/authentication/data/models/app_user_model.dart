import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required int id,
    required String name,
    required String email,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

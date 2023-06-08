import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_survey_cubit.freezed.dart';
part 'user_survey_cubit.g.dart';

@freezed
class UserSurveyState with _$UserSurveyState {
  const factory UserSurveyState({
    @Default([]) final List<String> selectedSkills,
    @Default([]) final List<String> selectedHackathonThemes,
    final String? selectedHackathonType,
    final String? teamMemberPreferredLocation,
  }) = _UserSurveyState;

  factory UserSurveyState.fromJson(Map<String, dynamic> json) =>
      _$UserSurveyStateFromJson(json);
}

class UserSurveyCubit extends Cubit<UserSurveyState> {
  UserSurveyCubit() : super(const UserSurveyState());

  void updateSelectedSkills(List<String> selectedItems) {
    emit(
      state.copyWith(selectedSkills: selectedItems),
    );
  }

  void updateSelectedHackathonThemes(List<String> selectedItems) {
    emit(
      state.copyWith(selectedHackathonThemes: selectedItems),
    );
  }

  void updateSelectedHackathonTypes(String? selectedItem) {
    emit(
      state.copyWith(
        selectedHackathonType: selectedItem,
      ),
    );
  }

  void updateTeamMemberPreferredLocation(String? selectedItem) {
    emit(
      state.copyWith(
        teamMemberPreferredLocation: selectedItem,
      ),
    );
  }

  void initialize({
    required List<String> skills,
    required List<String> hackathonThemes,
    required String? hackathonType,
  }) {
    emit(
      state.copyWith(
        selectedSkills: skills,
        selectedHackathonThemes: hackathonThemes,
        selectedHackathonType: hackathonType,
      ),
    );
  }
}

import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_base_wrapper.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserSurveySkillsPage extends StatelessWidget {
  const UserSurveySkillsPage({super.key});

  @override
  Widget build(BuildContext context) => UserSurveyBaseWrapper(
        body: Expanded(
          child: CodeSwipeMultiSelector<String>.grid(
            items: kSkillsList,
            initialSelections: const [],
            onSelectionChanged: (selectedItems) {},
          ),
        ),
        onConfirm: () async {},
        onSuccess: () {
          context.router.push(const UserSurveyPrefsRoute());
        },
        confirmButtonText: 'Continue',
      );
}

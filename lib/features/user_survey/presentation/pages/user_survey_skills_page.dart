import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:codeswipe/features/user_survey/data/blocs/user_survey_cubit.dart';
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_base_wrapper.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/authentication.dart';

@RoutePage()
class UserSurveySkillsPage extends StatelessWidget {
  const UserSurveySkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final user = authCubit.state.user;

    return UserSurveyBaseWrapper(
      body: Expanded(
        child: CodeSwipeMultiSelector<String>.grid(
          items: kSkillsList,
          initialSelections: user?.skills ?? <String>[],
          onSelectionChanged: (selectedItems) {
            final userSurveyCubit = context.read<UserSurveyCubit>();
            userSurveyCubit.updateSelectedSkills(selectedItems);
          },
        ),
      ),
      onConfirm: () async {
        final skills = context.read<UserSurveyCubit>().state.selectedSkills;
        await authCubit.updateUserSkills(skills);
      },
      onSuccess: () {
        DjangoflowAppSnackbar.showInfo('Skills updated successfully');
        context.router.push(const UserSurveyPrefsRoute());
      },
      onError: (e) => DjangoflowAppSnackbar.showError(
        e.toString(),
      ),
      confirmButtonText: 'Continue',
    );
  }
}

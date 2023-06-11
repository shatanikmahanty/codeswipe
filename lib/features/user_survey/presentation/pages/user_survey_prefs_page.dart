import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/presentation/codeswipe_segmented_button.dart';
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_base_wrapper.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../app/presentation/codeswipe_multi_selector.dart';
import '../../../authentication/data/blocs/auth_cubit.dart';
import '../../data/blocs/user_survey_cubit.dart';

@RoutePage()
class UserSurveyPrefsPage extends StatelessWidget {
  const UserSurveyPrefsPage({super.key});

  FormGroup _formBuilder() => fb.group({
        kLocationField: FormControl<String>(
          validators: [
            Validators.required,
          ],
          value: AuthCubit.instance.state.user?.name,
        ),
      });

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final user = authCubit.state.user;

    return UserSurveyBaseWrapper(
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SubsectionsHeading(text: 'Interested In'),
            CodeSwipeSegmentedButton<String>(
              initialSelection: <String>[
                user?.hackathonModeInterests ?? 'Offline'
              ],
              multiSelectEnabled: false,
              segments: const [
                'Offline',
                'Online',
                'Both',
              ],
              onSelectionChanged: (selectedItems) {
                final userSurveyCubit = context.read<UserSurveyCubit>();
                userSurveyCubit.updateSelectedHackathonTypes(
                  selectedItems.isEmpty ? null : selectedItems.first,
                );
              },
            ),
            const _SubsectionsHeading(text: 'Team Member Preferred Location'),
            CodeSwipeSegmentedButton<String>(
              initialSelection: <String>[
                user?.teamMemberPreferredLocation ?? 'Same'
              ],
              multiSelectEnabled: false,
              segments: const [
                'Same',
                'Different',
                'Both',
              ],
              onSelectionChanged: (selectedItems) {
                final userSurveyCubit = context.read<UserSurveyCubit>();
                userSurveyCubit.updateTeamMemberPreferredLocation(
                  selectedItems.isEmpty ? null : selectedItems.first,
                );
              },
            ),
            const _SubsectionsHeading(text: 'Theme'),
            CodeSwipeMultiSelector<String>.grid(
              items: kHackathonThemesList,
              initialSelections: user?.hackathonThemeInterests ?? <String>[],
              onSelectionChanged: (selectedItems) {
                final userSurveyCubit = context.read<UserSurveyCubit>();
                userSurveyCubit.updateSelectedHackathonThemes(selectedItems);
              },
            ),
          ],
        ),
      ),
      onConfirm: () async {
        final userSurveyCubit = context.read<UserSurveyCubit>();
        final preferredThemes = userSurveyCubit.state.selectedHackathonThemes;
        final preferredHackathonTypes =
            userSurveyCubit.state.selectedHackathonType;
        final teamMemberPreferredLocation =
            userSurveyCubit.state.teamMemberPreferredLocation;
        await context.read<AuthCubit>().updateUserPrefs(
              preferredThemes: preferredThemes,
              preferredHackathonMode: preferredHackathonTypes ?? 'Offline',
              teamMemberPreferredLocation:
                  teamMemberPreferredLocation ?? 'Same',
            );
      },
      onSuccess: () {
        DjangoflowAppSnackbar.showInfo('Preferences updated successfully');
        context.router.push(const UserSurveyTeamRoute());
      },
      onError: (e) => DjangoflowAppSnackbar.showError(
        e.toString(),
      ),
      confirmButtonText: 'Continue',
    );
  }
}

class _SubsectionsHeading extends StatelessWidget {
  const _SubsectionsHeading({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: kPadding * 2,
          bottom: kPadding * 2,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      );
}

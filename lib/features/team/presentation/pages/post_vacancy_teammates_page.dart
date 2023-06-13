import 'package:codeswipe/code_swipe_icons.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:codeswipe/features/team/data/blocs/team_cubit.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class PostVacancyTeammatesPage extends StatelessWidget {
  const PostVacancyTeammatesPage({super.key});

  FormGroup _formBuilder() => fb.group({
        kPositionsField: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        kSkillsField: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        kExpectationsField: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
      });

  @override
  Widget build(BuildContext context) => CodeSwipeScaffold(
        resizeToAvoidBottomInset: false,
        body: ReactiveFormBuilder(
          form: _formBuilder,
          builder: (context, form, child) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPadding * 4,
              vertical: kPadding * 2,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: kPadding * 2,
                    ),
                    ReactiveTextField<String>(
                      formControlName: kPositionsField,
                      decoration: const InputDecoration(
                        labelText: 'Position',
                      ),
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'Position must not be empty',
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: kPadding * 4,
                    ),
                    ReactiveTextField<String>(
                      formControlName: kSkillsField,
                      decoration: const InputDecoration(
                        labelText: 'Skills',
                        helperText: 'Separate skills with commas',
                      ),
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'Skills must not be empty',
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: kPadding * 4,
                    ),
                    ReactiveTextField<String>(
                      formControlName: kExpectationsField,
                      decoration: const InputDecoration(
                        labelText: 'Expectations',
                      ),
                      minLines: 3,
                      maxLines: 15,
                      maxLength: 1000,
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'Expectations must not be empty',
                      },
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
                const Spacer(),
                LinearProgressBuilder(
                  builder: (context, action, error) => Padding(
                    padding: const EdgeInsets.only(
                      top: kPadding * 1.5,
                    ),
                    child: ElevatedButton(
                      onPressed: (ReactiveForm.of(context)?.valid ?? false)
                          ? action
                          : null,
                      child: const Text('Post'),
                    ),
                  ),
                  action: (progress) async {
                    Map<String, dynamic> formValues = form.value;
                    final position = formValues[kPositionsField] as String;
                    final skills = formValues[kSkillsField] as String;
                    final expectations =
                        formValues[kExpectationsField] as String;
                    final teamCubit = context.read<TeamCubit>();
                    await teamCubit.postVacancy(position, skills, expectations);
                  },
                  onSuccess: () {
                    Map<String, dynamic> formValues = form.value;
                    DjangoflowAppSnackbar.showInfo(
                      'Team vacancy for ${formValues[kPositionsField]} created successfully',
                    );
                    context.router.pop();
                  },
                  onError: (error) {
                    DjangoflowAppSnackbar.showError(error.toString());
                  },
                ),
                const SizedBox(
                  height: kPadding * 2,
                ),
                LinearProgressBuilder(
                  builder: (context, action, error) => Padding(
                    padding: const EdgeInsets.only(
                      top: kPadding * 1.5,
                    ),
                    child: ElevatedButton.icon(
                      icon: const Icon(CodeSwipeIcons.linkedin),
                      onPressed: (ReactiveForm.of(context)?.valid ?? false)
                          ? action
                          : null,
                      label: const Text('Share on LinkedIn'),
                    ),
                  ),
                  action: (progress) async {
                    await Clipboard.setData(
                      ClipboardData(
                        text:
                            '''We are thrilled to announce that our hackathon team ${context.read<TeamCubit>().state.team!.name} is looking for new teammates.\n\nWe are looking for ${form.value[kPositionsField]} with ${form.value[kSkillsField]} skills.\n\nOur expectations are ${form.value[kExpectationsField]}.''',
                      ),
                    );
                    DjangoflowAppSnackbar.showInfo(
                      'Copied post data to clipboard. You can now paste it on LinkedIn 😊',
                    );
                  },
                ),
                const SizedBox(height: kPadding * 2),
              ],
            ),
          ),
        ),
        appBarTitleText: 'Post Vacancy',
      );
}

import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:codeswipe/features/app/presentation/codeswipe_image_picker.dart';
import 'package:codeswipe/features/team/data/blocs/team_cubit.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class CreateTeamPage extends StatelessWidget {
  const CreateTeamPage({super.key});

  FormGroup _formBuilder() => fb.group({
        kNameField: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
      });

  @override
  Widget build(BuildContext context) {
    final teamCubit = context.read<TeamCubit>();

    return CodeSwipeScaffold(
      body: ReactiveFormBuilder(
        form: _formBuilder,
        builder: (context, form, child) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPadding * 4,
            vertical: kPadding * 2,
          ),
          child: BlocBuilder<TeamCubit, TeamState>(
            builder: (context, state) => Column(
              children: [
                CodeSwipeImagePicker(
                  pickedImagePath: state.pickedImagePath,
                  onImagePicked: (image) => teamCubit.updatePickedPhoto(image),
                  clearImageCallback: () => teamCubit.clearPickedPhoto(),
                ),
                const SizedBox(
                  height: kPadding * 4,
                ),
                ReactiveTextField<String>(
                  formControlName: kNameField,
                  decoration: const InputDecoration(
                    labelText: 'Team Name',
                  ),
                  validationMessages: {
                    ValidationMessage.required: (_) =>
                        'Team name must not be empty',
                  },
                  textInputAction: TextInputAction.done,
                ),
                const Spacer(),
                LinearProgressBuilder(
                  builder: (context, action, error) => Padding(
                    padding: const EdgeInsets.only(
                      top: kPadding * 1.5,
                    ),
                    child: ElevatedButton(
                      onPressed: (ReactiveForm.of(context)?.valid ?? false) &&
                              state.pickedImagePath != null
                          ? action
                          : null,
                      child: const Text('Confirm'),
                    ),
                  ),
                  action: (progress) async {
                    Map<String, dynamic> formValues = form.value;
                    final name = formValues[kNameField] as String;
                    final teamCubit = context.read<TeamCubit>();
                    String teamID = await teamCubit.createTeam(name);
                    progress(50);
                    teamCubit.uploadTeamImage(teamID);
                    progress(100);
                  },
                  onSuccess: () {
                    DjangoflowAppSnackbar.showInfo(
                      'Team ${form.control(kNameField).value} created successfully',
                    );
                    context.router.parentAsStackRouter?.pop();
                  },
                  onError: (error) {
                    DjangoflowAppSnackbar.showError(error.toString());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      appBarTitleText: 'Create Team',
      centerAppBarTitle: false,
    );
  }
}

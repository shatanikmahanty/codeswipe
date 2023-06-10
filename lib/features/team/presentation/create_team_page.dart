import 'dart:io';

import 'package:codeswipe/code_swipe_icons.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:codeswipe/features/team/data/blocs/team_cubit.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      radius: kPadding * 10,
                      foregroundImage: state.pickedImagePath != null
                          ? FileImage(File(state.pickedImagePath!))
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: -kPadding,
                      child: GestureDetector(
                        onTap: () async {
                          if (state.pickedImagePath != null) {
                            teamCubit.clearPickedPhoto();
                            return;
                          }

                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (image == null) return;
                          teamCubit.updatePickedPhoto(image);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: kPadding * 4,
                          child: CircleAvatar(
                            radius: kPadding * 3,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: state.pickedImagePath == null
                                ? const Icon(
                                    CodeSwipeIcons.camera,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kPadding * 2,
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

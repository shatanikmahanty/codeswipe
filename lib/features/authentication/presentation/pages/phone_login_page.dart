import 'package:codeswipe/configurations/configurations.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/auth_cubit.dart';

@RoutePage()
class PhoneLoginPage extends StatelessWidget {
  const PhoneLoginPage({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kPadding * 2,
          horizontal: kPadding * 4,
        ),
        child: Column(
          children: [
            Text(
              'Please enter your valid phone number.'
              ' We will send you a 6-digit code to verify your account.',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const _PhoneLoginSheet(
              defaultCountryCode: kDefaultCountryCode,
            ),
          ],
        ),
      );
}

class _PhoneLoginSheet extends StatelessWidget {
  const _PhoneLoginSheet({
    required this.defaultCountryCode,
  });

  FormGroup _formBuilder() => fb.group({
        'phone': FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(10),
          ],
        ),
      });

  final String defaultCountryCode;
  final phoneFieldInputBorder = InputBorder.none;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return DefaultActionController(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isOtpAvailable) {
            context.router.push(
              const PhoneOtpVerifyRoute(),
            );
          }
        },
        listenWhen: (previous, current) =>
            previous.isOtpAvailable != current.isOtpAvailable,
        child: ReactiveFormBuilder(
          form: _formBuilder,
          builder: (context, form, child) => AutofillGroup(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: kPadding * 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: kPadding,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(kButtonRadius),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CountryCodePicker(
                          padding: EdgeInsets.zero,
                          onChanged: (c) => authCubit.updateCountryCode(c.code),
                          initialSelection: authCubit.countryCode,
                          favorite: const [
                            kDefaultCountryCode,
                          ],
                        ),
                      ),
                      Container(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                        height: kPadding * 2.5,
                      ),
                      Expanded(
                        flex: 2,
                        child: ReactiveTextField(
                          autofocus: true,
                          formControlName: 'phone',
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: 'Enter phone',
                            hintStyle: Theme.of(context).textTheme.bodySmall,
                            border: phoneFieldInputBorder,
                            errorBorder: phoneFieldInputBorder,
                            focusedBorder: phoneFieldInputBorder,
                            focusedErrorBorder: phoneFieldInputBorder,
                            enabledBorder: phoneFieldInputBorder,
                            disabledBorder: phoneFieldInputBorder,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: kPadding,
                            ),
                          ),
                          showErrors: (_) => false,
                          keyboardType: TextInputType.phone,
                          autofillHints: const [
                            AutofillHints.telephoneNumber,
                          ],
                          onSubmitted: (_) => form.valid
                              ? DefaultActionController.of(context)
                                  ?.add(ActionType.start)
                              : form.markAsTouched(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: kPadding * 2),
                Center(
                  child: CircularProgressBuilder(
                    action: (_) async {
                      final phoneControl = form.control('phone');
                      if (form.valid) {
                        final phone = phoneControl.value as String;

                        await context
                            .read<AuthCubit>()
                            .initiatePhoneLogin(authCubit.countryCode + phone);
                      } else {
                        if (phoneControl.errors.containsKey('required')) {
                          DjangoflowAppSnackbar.showError(
                            'Please enter phone number',
                          );
                        } else {
                          DjangoflowAppSnackbar.showError(
                            'Please enter 10 digit phone number',
                          );
                        }
                      }
                    },
                    builder: (context, action, error) => ElevatedButton(
                      onPressed: action,
                      child: const Text('Continue'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

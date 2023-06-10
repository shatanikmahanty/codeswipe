import 'dart:async';

import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:progress_builder/progress_builder.dart';

@RoutePage()
class PhoneOtpVerifyPage extends StatelessWidget {
  const PhoneOtpVerifyPage({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kPadding * 2,
          horizontal: kPadding * 4,
        ),
        child: Column(
          children: [
            Text(
              'Type the verification code we sent you',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const _PhoneLoginSheet(),
          ],
        ),
      );
}

class _PhoneLoginSheet extends StatefulWidget {
  const _PhoneLoginSheet();

  @override
  State<_PhoneLoginSheet> createState() => _PhoneLoginSheetState();
}

class _PhoneLoginSheetState extends State<_PhoneLoginSheet> {
  String countryCode = '+91';

  final _formKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  final otpCtrl = TextEditingController();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: kPadding * 4),
        Form(
          key: _formKey,
          child: Theme(
            data: ThemeData(
              inputDecorationTheme: const InputDecorationTheme(
                errorBorder: InputBorder.none,
              ),
            ),
            child: PinCodeTextField(
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: kOtpLength,
              validator: (v) {
                if (v!.length < kOtpLength) {
                  return 'Please enter OTP';
                } else {
                  return null;
                }
              },
              autovalidateMode: AutovalidateMode.disabled,
              // obscureText: true,
              // obscuringCharacter: '*',
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(kPadding),
                fieldHeight: kPadding * 6,
                fieldWidth: kPadding * 6,
                activeFillColor: primaryColor,
                inactiveColor: primaryColor,
                activeColor: Colors.transparent,
                errorBorderColor: Colors.red,
                selectedFillColor: primaryColor.withOpacity(0.3),
                selectedColor: primaryColor.withOpacity(0.3),
                inactiveFillColor: Colors.transparent,
              ),
              textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                  ),
              cursorColor: Colors.white,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              backgroundColor: Colors.transparent,
              errorAnimationController: errorController,
              controller: otpCtrl,
              keyboardType: TextInputType.number,
              beforeTextPaste: (text) {
                if (text != null && int.tryParse(text) != null) {
                  if (text.length > kOtpLength) {}
                  return true;
                }
                return false;
              },
              onChanged: (String value) {},
            ),
          ),
        ),
        const SizedBox(height: kPadding * 2),
        Center(
          child: CircularProgressBuilder(
            builder: (context, action, error) => ElevatedButton(
              onPressed: action,
              child: const Text('Continue'),
            ),
            action: (_) async {
              bool isValid = _formKey.currentState?.validate() ?? false;
              if (isValid) {
                await context.read<AuthCubit>().verifyOtp(otpCtrl.text);
              } else {
                startErrorAnimation();
              }
            },
            onError: (e) {
              startErrorAnimation();
              DjangoflowAppSnackbar.showError(e.toString());
            },
          ),
        )
      ],
    );
  }

  void startErrorAnimation() {
    errorController!.add(ErrorAnimationType.shake);
  }
}

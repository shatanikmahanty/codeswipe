import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:flutter/material.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef ErrorCallback = void Function(Object error);

class UserSurveyBaseWrapper extends StatelessWidget {
  const UserSurveyBaseWrapper({
    super.key,
    required this.body,
    required this.confirmButtonText,
    required this.onConfirm,
    this.onSuccess,
    this.onError,
    this.hasReactiveForm = false,
  });

  final Widget body;
  final String confirmButtonText;
  final Future<void> Function()? onConfirm;
  final VoidCallback? onSuccess;
  final ErrorCallback? onError;
  final bool hasReactiveForm;

  @override
  Widget build(BuildContext context) {
    onConfirmCall(progress) async {
      await onConfirm?.call();
    }

    return CodeSwipeScaffold(
      centerAppBarTitle: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding * 4,
          vertical: kPadding * 1.5,
        ),
        child: Column(
          children: [
            body,
            LinearProgressBuilder(
              builder: (context, action, error) => Padding(
                padding: const EdgeInsets.only(
                  top: kPadding * 1.5,
                ),
                child: ElevatedButton(
                  onPressed: action,
                  child: Text(confirmButtonText),
                ),
              ),
              action: hasReactiveForm
                  ? (ReactiveForm.of(context)?.valid ?? false)
                      ? onConfirmCall
                      : null
                  : onConfirm == null
                      ? null
                      : onConfirmCall,
              onSuccess: onSuccess,
              onError: onError,
            ),
          ],
        ),
      ),
      appBarTitleText: context.router.topRoute.meta['title'] ?? '',
    );
  }
}

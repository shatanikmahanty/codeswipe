import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

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
              ' We will send you a 4-digit code to verify your account.',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      );
}

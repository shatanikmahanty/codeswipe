import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/presentation/codeswipe_auto_leading_button.dart';
import 'package:flutter/material.dart';

@RoutePage(
  name: 'PhoneAuthRouter',
)
class PhoneAuthRouterPage extends StatelessWidget {
  const PhoneAuthRouterPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kPadding * 2),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CodeSwipeAutoLeadingButton(),
                    const Spacer(),
                    Assets.images.enterOtp.image(),
                    const Spacer(),
                  ],
                ),
                const Expanded(
                  child: AutoRouter(),
                ),
              ],
            ),
          ),
        ),
      );
}

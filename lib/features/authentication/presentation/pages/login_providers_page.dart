import 'package:codeswipe/code_swipe_icons.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginProvidersPage extends StatelessWidget {
  const LoginProvidersPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              StackedIllustration(
                illustration: Assets.images.login.image(),
              ),
              const DescriptionContent(
                tagline: 'Get ready to conquer the world of hackathons. '
                    'Swipe, match, and unleash your creativity today!',
                verticalPadding: kPadding * 2,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kPadding * 4),
                child: _LoginSheet(),
              )
            ],
          ),
        ),
      );
}

class _LoginSheet extends StatelessWidget {
  const _LoginSheet({Key? key}) : super(key: key);

  final dividerColor = Colors.black38;
  final dividerHeight = kPadding / 8;
  final buttonSpacingSizedBox = const SizedBox.square(
    dimension: kPadding * 2,
  );

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const AuthButton(
            icon: CodeSwipeIcons.google,
            provider: 'google',
            label: 'Continue with Google',
          ),
          buttonSpacingSizedBox,
          AuthButton(
            provider: 'phone',
            label: 'Use Phone Number',
            onPressed: () {
              context.router.push(
                const PhoneAuthRouter(
                  children: [
                    PhoneLoginRoute(),
                  ],
                ),
              );
            },
            authButtonType: AuthButtonType.outlined,
          ),
          buttonSpacingSizedBox,
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: dividerHeight,
                  color: dividerColor,
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Or continue with',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: dividerHeight,
                  color: dividerColor,
                ),
              ),
            ],
          ),
          buttonSpacingSizedBox,
          Container(
            height: kButtonHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(kButtonRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AuthButton(
                  icon: CodeSwipeIcons.github,
                  provider: 'github',
                  authButtonType: AuthButtonType.icon,
                ),
                buttonSpacingSizedBox,
                const AuthButton(
                  icon: CodeSwipeIcons.twitter,
                  provider: 'twitter',
                  authButtonType: AuthButtonType.icon,
                ),
                buttonSpacingSizedBox,
                const AuthButton(
                  icon: CodeSwipeIcons.linkedin,
                  provider: 'linkedin',
                  authButtonType: AuthButtonType.icon,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: kPadding * 4,
          ),
        ],
      );
}

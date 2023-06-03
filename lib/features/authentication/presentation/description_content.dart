import 'package:codeswipe/configurations/configurations.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';

class DescriptionContent extends StatelessWidget {
  const DescriptionContent(
      {super.key, required this.tagline, this.verticalPadding = kPadding * 4});

  final String tagline;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kPadding * 4,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          GestureDetector(
            onLongPress: () {
              AppCubit.instance.toggleEnvironment();
            },
            child: Text(
              kAppTitle,
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            height: kPadding * 1.5,
          ),
          Text(
            tagline,
            textAlign: TextAlign.center,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

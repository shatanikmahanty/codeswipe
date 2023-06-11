import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

class CodeSwipeDropdownSelectedItem extends StatelessWidget {
  const CodeSwipeDropdownSelectedItem(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          kButtonRadius,
        ),
        color: const Color(
          0xffF0E5FF,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding * 2,
          vertical: kPadding,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}

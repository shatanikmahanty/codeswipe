import 'package:flutter/material.dart';

import '../../../configurations/configurations.dart';

class CodeSwipeSectionHeader extends StatelessWidget {
  const CodeSwipeSectionHeader({
    super.key,
    required this.title,
    this.onActionClick,
    this.buttonText,
    required this.showActionButton,
    this.horizontalPadding = kPadding * 4,
  });

  final String title;
  final VoidCallback? onActionClick;
  final String? buttonText;
  final bool showActionButton;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          if (showActionButton)
            SizedBox(
              width: kPadding * 12,
              child: TextButton(
                onPressed: onActionClick,
                child: Text(
                  buttonText ?? '',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

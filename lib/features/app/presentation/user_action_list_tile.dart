import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

class UserActionListTile extends StatelessWidget {
  const UserActionListTile({
    super.key,
    required this.title,
    required this.trailing,
    required this.leading,
  });

  final Widget leading;
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          kButtonRadius,
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding,
        vertical: kPadding * 2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: leading,
          ),
          const SizedBox(
            width: kPadding * 2,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: kPadding * 2,
                ),
                trailing,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../configurations/configurations.dart';
import 'codeswipe_auto_leading_button.dart';

class CodeSwipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CodeSwipeAppBar({
    super.key,
    this.appBarTitleText,
    this.appBarTitleWidget,
    this.actions,
    required this.centerTitle,
  });

  final String? appBarTitleText;
  final Widget? appBarTitleWidget;

  final List<Widget>? actions;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(kPadding),
        child: AppBar(
          leadingWidth: kPadding * 6,
          leading: const CodeSwipeAutoLeadingButton(),
          centerTitle: centerTitle,
          title: appBarTitleText != null
              ? Text(
                  appBarTitleText!,
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              : appBarTitleWidget,
          actions: actions,
        ),
      );

  @override
  Size get preferredSize => const Size(0, kPadding * 8);
}

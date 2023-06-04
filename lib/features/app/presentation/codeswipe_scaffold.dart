import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/presentation/codeswipe_auto_leading_button.dart';
import 'package:flutter/material.dart';

class CodeSwipeScaffold extends StatelessWidget {
  const CodeSwipeScaffold({
    super.key,
    this.showAppBar = true,
    required this.body,
    this.appBarTitleText,
    this.appBarTitleWidget,
    this.hasBottomNavigationBar = false,
    this.actions,
    this.centerAppBarTitle = true,
  }) : assert(
          showAppBar && (appBarTitleText != null || appBarTitleWidget != null),
          'appBarTitleText or appBarTitleWidget must be provided',
        );

  final bool showAppBar;
  final String? appBarTitleText;
  final Widget? appBarTitleWidget;

  final Widget body;
  final List<Widget>? actions;
  final bool hasBottomNavigationBar;
  final bool centerAppBarTitle;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: body,
        appBar: showAppBar
            ? PreferredSize(
                preferredSize: const Size(0, kPadding * 12),
                child: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: AppBar(
                    leading: const CodeSwipeAutoLeadingButton(),
                    centerTitle: centerAppBarTitle,
                    title: appBarTitleText != null
                        ? Text(
                            appBarTitleText!,
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        : appBarTitleWidget,
                    actions: actions,
                  ),
                ),
              )
            : null,
      );
}

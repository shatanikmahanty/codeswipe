import 'package:codeswipe/features/app/presentation/codeswipe_app_bar.dart';
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
          !showAppBar || (appBarTitleText != null || appBarTitleWidget != null),
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
            ? CodeSwipeAppBar(
                appBarTitleText: appBarTitleText,
                appBarTitleWidget: appBarTitleWidget,
                actions: actions,
                centerTitle: centerAppBarTitle,
              )
            : null,
      );
}

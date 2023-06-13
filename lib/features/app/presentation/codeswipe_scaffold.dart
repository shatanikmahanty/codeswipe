import 'package:codeswipe/features/app/presentation/codeswipe_app_bar.dart';
import 'package:flutter/material.dart';

class CodeSwipeScaffold extends StatelessWidget {
  const CodeSwipeScaffold({
    super.key,
    this.showAppBar = true,
    required this.body,
    this.appBarTitleText,
    this.appBarTitleWidget,
    this.actions,
    this.centerAppBarTitle = true,
    this.resizeToAvoidBottomInset,
    this.appBarElevation,
  }) : assert(
          !showAppBar || (appBarTitleText != null || appBarTitleWidget != null),
          'appBarTitleText or appBarTitleWidget must be provided',
        );

  final bool showAppBar;
  final String? appBarTitleText;
  final Widget? appBarTitleWidget;
  final double? appBarElevation;

  final Widget body;
  final List<Widget>? actions;
  final bool centerAppBarTitle;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: body,
        appBar: showAppBar
            ? CodeSwipeAppBar(
                appBarTitleText: appBarTitleText,
                appBarTitleWidget: appBarTitleWidget,
                actions: actions,
                centerTitle: centerAppBarTitle,
                elevation: appBarElevation,
              )
            : null,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      );
}

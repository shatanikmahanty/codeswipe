import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppResponsiveLayoutBuilder extends StatelessWidget {
  const AppResponsiveLayoutBuilder({
    super.key,
    required this.child,
    this.breakpoints = const [
      Breakpoint(start: 0, end: 480, name: MOBILE),
      Breakpoint(start: 480.1, end: 800, name: TABLET),
      Breakpoint(start: 800.1, end: 1920, name: DESKTOP),
      Breakpoint(start: 1920.1, end: double.infinity, name: '4K'),
    ],
  });

  final Widget child;
  final List<Breakpoint> breakpoints;

  @override
  Widget build(BuildContext context) => ResponsiveBreakpoints.builder(
        child: ResponsiveScaledBox(
          width: MediaQuery.of(context).size.width,
          child: child,
        ),
        breakpoints: breakpoints,
      );
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage(
  name: 'TeamRouter',
)
class TeamRouterPage extends StatelessWidget implements AutoRouteWrapper {
  const TeamRouterPage({super.key});

  @override
  Widget build(BuildContext context) => const AutoRouter();

  @override
  Widget wrappedRoute(BuildContext context) => this;
}

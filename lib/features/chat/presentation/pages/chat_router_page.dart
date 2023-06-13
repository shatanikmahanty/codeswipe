import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage(name: 'ChatRouter')
class ChatRouterPage extends StatelessWidget implements AutoRouteWrapper {
  const ChatRouterPage({super.key});

  @override
  Widget build(BuildContext context) => const AutoRouter();

  @override
  Widget wrappedRoute(BuildContext context) => this;
}

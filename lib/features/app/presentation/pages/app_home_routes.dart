import 'package:codeswipe/configurations/configurations.dart';

final appHomeRoutes = [
  AutoRoute(
    initial: true,
    path: 'home',
    page: HomeRoute.page,
  ),
  AutoRoute(
    path: 'discover',
    page: UnknownRoute.page,
  ),
  AutoRoute(
    path: 'chat',
    page: UnknownRoute.page,
  ),
  AutoRoute(
    path: 'profile',
    page: UnknownRoute.page,
  ),
];

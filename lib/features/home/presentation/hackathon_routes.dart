import 'package:codeswipe/configurations/configurations.dart';

final hackathonRoutes = [
  AutoRoute(
    path: ':categoryName',
    page: CategoryHackathonRoute.page,
  ),
  AutoRoute(
    initial: true,
    path: 'upcoming',
    page: UpcomingHackathonsRoute.page,
  )
];

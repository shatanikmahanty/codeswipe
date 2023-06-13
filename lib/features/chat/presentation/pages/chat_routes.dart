import 'package:codeswipe/configurations/configurations.dart';

final chatRoutes = [
  AutoRoute(
    path: 'chatList',
    page: ChatListRoute.page,
    initial: true,
  ),
  // AutoRoute(
  //   path: ':roomID',
  //   page: CreateTeamRoute.page,
  // ),
];

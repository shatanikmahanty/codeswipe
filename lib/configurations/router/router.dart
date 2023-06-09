import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/features/home/presentation/pages/hackathon_routes.dart';
import 'package:codeswipe/features/team/presentation/pages/team_routes.dart';
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_routes.dart';
import 'package:flutter/material.dart';

export 'package:auto_route/auto_route.dart';

export 'auth_guard.dart';
export 'route_parser.dart';
export 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
  deferredLoading: true,
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '*', page: UnknownRoute.page),
    AutoRoute(
      path: '/login',
      page: LoginRouter.page,
      children: loginRoutes,
    ),
    AutoRoute(
      path: '/onboarding',
      page: OnboardingRoute.page,
    ),
    AutoRoute(
      path: '/user-survey',
      page: UserSurveyRouter.page,
      guards: [
        AuthGuard(),
      ],
      children: userSurveyRoutes,
    ),
    AutoRoute(
      path: '/team',
      page: TeamRouter.page,
      guards: [
        AuthGuard(),
      ],
      children: teamRoutes,
    ),
    AutoRoute(
      path: '/app-home',
      page: AppHomeRoute.page,
      guards: [
        AuthGuard(),
      ],
      children: appHomeRoutes,
    ),
    CustomRoute(
      path: '/matched',
      page: MatchedDialogRoute.page,
      customRouteBuilder: dialogRouteBuilder,
    ),
    AutoRoute(
      path: '/hackathons',
      page: HackathonRouter.page,
      children: hackathonRoutes,
    ),
    AutoRoute(
      path: '/chat/:roomID',
      page: ChatRoomRoute.page,
    ),
  ];
}

Route<T> modalSheetBuilder<T>(
        BuildContext context, Widget child, AutoRoutePage<T> page) =>
    ModalBottomSheetRoute(
      settings: page,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: (MediaQuery.of(context).size.height / 10) * 7,
      ),
      builder: (context) => child,
    );

Route<T> dialogRouteBuilder<T>(
        BuildContext context, Widget child, AutoRoutePage<T> page) =>
    DialogRoute(
      settings: page,
      barrierDismissible: true,
      builder: (context) => child,
      context: context,
      useSafeArea: true,
      barrierColor: AppColors.surfaceVariantDark.withOpacity(.1),
    );

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:codeswipe/features/app/presentation/pages/app_home_page.dart'
    deferred as _i1;
import 'package:codeswipe/features/app/presentation/pages/unknown_page.dart'
    deferred as _i2;
import 'package:codeswipe/features/authentication/presentation/pages/login_options_router_page.dart'
    deferred as _i3;
import 'package:codeswipe/features/authentication/presentation/pages/login_providers_page.dart'
    deferred as _i4;
import 'package:codeswipe/features/authentication/presentation/pages/login_router_page.dart'
    deferred as _i5;
import 'package:codeswipe/features/authentication/presentation/pages/onboarding_page.dart'
    deferred as _i6;
import 'package:codeswipe/features/authentication/presentation/pages/phone_auth_router_page.dart'
    deferred as _i7;
import 'package:codeswipe/features/authentication/presentation/pages/phone_login_page.dart'
    deferred as _i8;
import 'package:codeswipe/features/authentication/presentation/pages/phone_otp_verify_page.dart'
    deferred as _i9;
import 'package:codeswipe/features/discover/presentation/pages/discover_page.dart'
    deferred as _i18;
import 'package:codeswipe/features/home/presentation/pages/home_page.dart'
    deferred as _i10;
import 'package:codeswipe/features/team/presentation/create_team_page.dart'
    deferred as _i11;
import 'package:codeswipe/features/team/presentation/team_router.dart'
    deferred as _i12;
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_prefs_page.dart'
    deferred as _i13;
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_profile_page.dart'
    deferred as _i14;
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_router_page.dart'
    deferred as _i15;
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_skills_page.dart'
    deferred as _i16;
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_team_page.dart'
    deferred as _i17;
import 'package:flutter/material.dart' as _i20;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AppHomeRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i1.loadLibrary,
          () => _i19.WrappedRoute(child: _i1.AppHomePage()),
        ),
      );
    },
    UnknownRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.UnknownPage(),
        ),
      );
    },
    LoginOptionsRouter.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.LoginOptionsRouterPage(),
        ),
      );
    },
    LoginProvidersRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.LoginProvidersPage(),
        ),
      );
    },
    LoginRouter.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.LoginRouterPage(),
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>(
          orElse: () => const OnboardingRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.OnboardingPage(key: args.key),
        ),
      );
    },
    PhoneAuthRouter.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.PhoneAuthRouterPage(),
        ),
      );
    },
    PhoneLoginRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i8.loadLibrary,
          () => _i8.PhoneLoginPage(),
        ),
      );
    },
    PhoneOtpVerifyRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i9.loadLibrary,
          () => _i9.PhoneOtpVerifyPage(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i10.loadLibrary,
          () => _i10.HomePage(),
        ),
      );
    },
    CreateTeamRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i11.loadLibrary,
          () => _i11.CreateTeamPage(),
        ),
      );
    },
    TeamRouter.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i12.loadLibrary,
          () => _i19.WrappedRoute(child: _i12.TeamRouterPage()),
        ),
      );
    },
    UserSurveyPrefsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i13.loadLibrary,
          () => _i13.UserSurveyPrefsPage(),
        ),
      );
    },
    UserSurveyProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i14.loadLibrary,
          () => _i14.UserSurveyProfilePage(),
        ),
      );
    },
    UserSurveyRouter.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i15.loadLibrary,
          () => _i19.WrappedRoute(child: _i15.UserSurveyRouterPage()),
        ),
      );
    },
    UserSurveySkillsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i16.loadLibrary,
          () => _i16.UserSurveySkillsPage(),
        ),
      );
    },
    UserSurveyTeamRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i17.loadLibrary,
          () => _i17.UserSurveyTeamPage(),
        ),
      );
    },
    DiscoverRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.DeferredWidget(
          _i18.loadLibrary,
          () => _i18.DiscoverPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AppHomePage]
class AppHomeRoute extends _i19.PageRouteInfo<void> {
  const AppHomeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AppHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppHomeRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.UnknownPage]
class UnknownRoute extends _i19.PageRouteInfo<void> {
  const UnknownRoute({List<_i19.PageRouteInfo>? children})
      : super(
          UnknownRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnknownRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginOptionsRouterPage]
class LoginOptionsRouter extends _i19.PageRouteInfo<void> {
  const LoginOptionsRouter({List<_i19.PageRouteInfo>? children})
      : super(
          LoginOptionsRouter.name,
          initialChildren: children,
        );

  static const String name = 'LoginOptionsRouter';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginProvidersPage]
class LoginProvidersRoute extends _i19.PageRouteInfo<void> {
  const LoginProvidersRoute({List<_i19.PageRouteInfo>? children})
      : super(
          LoginProvidersRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginProvidersRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginRouterPage]
class LoginRouter extends _i19.PageRouteInfo<void> {
  const LoginRouter({List<_i19.PageRouteInfo>? children})
      : super(
          LoginRouter.name,
          initialChildren: children,
        );

  static const String name = 'LoginRouter';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnboardingPage]
class OnboardingRoute extends _i19.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          OnboardingRoute.name,
          args: OnboardingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i19.PageInfo<OnboardingRouteArgs> page =
      _i19.PageInfo<OnboardingRouteArgs>(name);
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.PhoneAuthRouterPage]
class PhoneAuthRouter extends _i19.PageRouteInfo<void> {
  const PhoneAuthRouter({List<_i19.PageRouteInfo>? children})
      : super(
          PhoneAuthRouter.name,
          initialChildren: children,
        );

  static const String name = 'PhoneAuthRouter';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PhoneLoginPage]
class PhoneLoginRoute extends _i19.PageRouteInfo<void> {
  const PhoneLoginRoute({List<_i19.PageRouteInfo>? children})
      : super(
          PhoneLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneLoginRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PhoneOtpVerifyPage]
class PhoneOtpVerifyRoute extends _i19.PageRouteInfo<void> {
  const PhoneOtpVerifyRoute({List<_i19.PageRouteInfo>? children})
      : super(
          PhoneOtpVerifyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneOtpVerifyRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.CreateTeamPage]
class CreateTeamRoute extends _i19.PageRouteInfo<void> {
  const CreateTeamRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CreateTeamRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTeamRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.TeamRouterPage]
class TeamRouter extends _i19.PageRouteInfo<void> {
  const TeamRouter({List<_i19.PageRouteInfo>? children})
      : super(
          TeamRouter.name,
          initialChildren: children,
        );

  static const String name = 'TeamRouter';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.UserSurveyPrefsPage]
class UserSurveyPrefsRoute extends _i19.PageRouteInfo<void> {
  const UserSurveyPrefsRoute({List<_i19.PageRouteInfo>? children})
      : super(
          UserSurveyPrefsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSurveyPrefsRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.UserSurveyProfilePage]
class UserSurveyProfileRoute extends _i19.PageRouteInfo<void> {
  const UserSurveyProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          UserSurveyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSurveyProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.UserSurveyRouterPage]
class UserSurveyRouter extends _i19.PageRouteInfo<void> {
  const UserSurveyRouter({List<_i19.PageRouteInfo>? children})
      : super(
          UserSurveyRouter.name,
          initialChildren: children,
        );

  static const String name = 'UserSurveyRouter';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.UserSurveySkillsPage]
class UserSurveySkillsRoute extends _i19.PageRouteInfo<void> {
  const UserSurveySkillsRoute({List<_i19.PageRouteInfo>? children})
      : super(
          UserSurveySkillsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSurveySkillsRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.UserSurveyTeamPage]
class UserSurveyTeamRoute extends _i19.PageRouteInfo<void> {
  const UserSurveyTeamRoute({List<_i19.PageRouteInfo>? children})
      : super(
          UserSurveyTeamRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSurveyTeamRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.DiscoverPage]
class DiscoverRoute extends _i19.PageRouteInfo<void> {
  const DiscoverRoute({List<_i19.PageRouteInfo>? children})
      : super(
          DiscoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

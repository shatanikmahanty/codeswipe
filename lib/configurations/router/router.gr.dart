// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:codeswipe/features/app/presentation/pages/home_page.dart'
    deferred as _i1;
import 'package:codeswipe/features/app/presentation/pages/unknown_page.dart'
    deferred as _i2;
import 'package:codeswipe/features/authentication/presentation/pages/login_options_router_page.dart'
    deferred as _i6;
import 'package:codeswipe/features/authentication/presentation/pages/login_providers_page.dart'
    deferred as _i3;
import 'package:codeswipe/features/authentication/presentation/pages/login_router_page.dart'
    deferred as _i4;
import 'package:codeswipe/features/authentication/presentation/pages/onboarding_page.dart'
    deferred as _i5;
import 'package:codeswipe/features/authentication/presentation/pages/phone_auth_router_page.dart'
    deferred as _i7;
import 'package:codeswipe/features/authentication/presentation/pages/phone_login_page.dart'
    deferred as _i8;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.HomePage(),
        ),
      );
    },
    UnknownRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.UnknownPage(),
        ),
      );
    },
    LoginProvidersRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.LoginProvidersPage(),
        ),
      );
    },
    LoginRouter.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.LoginRouterPage(),
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>(
          orElse: () => const OnboardingRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.OnboardingPage(key: args.key),
        ),
      );
    },
    LoginOptionsRouter.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.LoginOptionsRouterPage(),
        ),
      );
    },
    PhoneAuthRouter.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.PhoneAuthRouterPage(),
        ),
      );
    },
    PhoneLoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i8.loadLibrary,
          () => _i8.PhoneLoginPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.UnknownPage]
class UnknownRoute extends _i9.PageRouteInfo<void> {
  const UnknownRoute({List<_i9.PageRouteInfo>? children})
      : super(
          UnknownRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnknownRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginProvidersPage]
class LoginProvidersRoute extends _i9.PageRouteInfo<void> {
  const LoginProvidersRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginProvidersRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginProvidersRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginRouterPage]
class LoginRouter extends _i9.PageRouteInfo<void> {
  const LoginRouter({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRouter.name,
          initialChildren: children,
        );

  static const String name = 'LoginRouter';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnboardingPage]
class OnboardingRoute extends _i9.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          OnboardingRoute.name,
          args: OnboardingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i9.PageInfo<OnboardingRouteArgs> page =
      _i9.PageInfo<OnboardingRouteArgs>(name);
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.LoginOptionsRouterPage]
class LoginOptionsRouter extends _i9.PageRouteInfo<void> {
  const LoginOptionsRouter({List<_i9.PageRouteInfo>? children})
      : super(
          LoginOptionsRouter.name,
          initialChildren: children,
        );

  static const String name = 'LoginOptionsRouter';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PhoneAuthRouterPage]
class PhoneAuthRouter extends _i9.PageRouteInfo<void> {
  const PhoneAuthRouter({List<_i9.PageRouteInfo>? children})
      : super(
          PhoneAuthRouter.name,
          initialChildren: children,
        );

  static const String name = 'PhoneAuthRouter';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PhoneLoginPage]
class PhoneLoginRoute extends _i9.PageRouteInfo<void> {
  const PhoneLoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PhoneLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneLoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

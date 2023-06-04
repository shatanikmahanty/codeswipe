import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

final loginRoutes = [
  RedirectRoute(path: '', redirectTo: 'options'),
  AutoRoute(
    path: 'options',
    page: LoginOptionsRouter.page,
    children: [
      AutoRoute(
        initial: true,
        path: '',
        page: LoginProvidersRoute.page,
      ),
      AutoRoute(
        path: 'phone',
        page: PhoneAuthRouter.page,
        children: [
          AutoRoute(
            initial: true,
            path: '',
            page: PhoneLoginRoute.page,
          ),
          CustomRoute(
            path: 'verify',
            page: PhoneOtpVerifyRoute.page,
            barrierDismissible: false,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                ScaleTransition(
              scale: animation,
              child: child,
            ),
          ),
        ],
      ),
    ],
  ),
];

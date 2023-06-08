import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/utils/custom_tranisitions_route.dart';

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
          scaleTransitionCustomRoute(
            path: 'verify',
            page: PhoneOtpVerifyRoute.page,
          ),
        ],
      ),
    ],
  ),
];

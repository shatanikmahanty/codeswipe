import 'package:codeswipe/configurations/configurations.dart';

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
        path: 'phone', // maybe 'submit' instead of login?
        page: PhoneAuthRouter.page,
        children: [
          AutoRoute(
            initial: true,
            path: '',
            page: PhoneLoginRoute.page,
          ),
          // AutoRoute(
          //   path: 'verify',
          //   page: PhoneAuthVerifyRoute.page,
          // ),
        ],
      ),
    ],
  ),
];

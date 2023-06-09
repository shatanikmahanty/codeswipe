import 'dart:async';

import '../../features/authentication/authentication.dart';
import '../configurations.dart';

bool get isAuthenticated => AuthCubit.instance.state.user != null;

class AuthGuard extends AutoRedirectGuard {
  late StreamSubscription<AuthState> _subscription;

  AuthGuard() {
    _subscription = AuthCubit.instance.stream.listen(
      (state) {
        if (state.user != null) {
          reevaluate(
            strategy: const ReevaluationStrategy.removeAllAndPush(
              AppHomeRoute(),
            ),
          );
        } else if (state.user == null) {
          reevaluate(
            strategy: const ReevaluationStrategy.removeAllAndPush(
              LoginRouter(),
            ),
          );
        }
      },
    );
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await canNavigate(resolver.route)) {
      resolver.next();
    } else {
      redirect(OnboardingRoute(), resolver: resolver);
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Future<bool> canNavigate(RouteMatch route) async => isAuthenticated;
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../configurations/configurations.dart';

class AppGestureRecognizer {
  static TapGestureRecognizer getNavigableOnTapGestureRecognizer({
    required BuildContext context,
    required PageRouteInfo<dynamic> route,
  }) =>
      TapGestureRecognizer()..onTap = () => context.router.navigate(route);
}

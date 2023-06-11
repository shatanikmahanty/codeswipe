import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:codeswipe/utils/exception_formatter.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:djangoflow_app_links/djangoflow_app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'codeswipe_app_builder.dart';
import 'configurations/configurations.dart';

Future<void> main() async {
  // Runs the runApp method
  DjangoflowAppRunner.run(
    onException: (exception, stackTrace) {
      debugPrint('Exception Caught -- $exception');
      // Dispatch exception to error reporters
      // ExeptionFilter.filter(exception); returns: true -> show exception to user or false -> do not show
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        DjangoflowAppSnackbar.showError(
          exception is AppwriteException
              ? exception.type ?? 'Unknown error'
              : ExceptionFormatter.format(exception),
        );
      });
    },
    rootWidgetBuilder: (appBuilder) async {
      String? initialDeepLink;
      final appLinksRepository = AppLinksRepository();
      if (!kIsWeb) {
        initialDeepLink = (await appLinksRepository.getInitialLink())?.path;
      }

      // initialize router
      final router = AppRouter();

      return appBuilder(
        CodeSwipeAppBuilder(
          appRouter: router,
          initialDeepLink: initialDeepLink,
          appLinksRepository: appLinksRepository,
        ),
      );
    },
  );
}

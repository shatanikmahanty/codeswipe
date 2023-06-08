import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/presentation/codeswipe_scaffold.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CodeSwipeScaffold(
        body: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  AuthCubit.instance.markUserSurveyAttempted();
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
        appBarTitleText: 'Home',
      );
}

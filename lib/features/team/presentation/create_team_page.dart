import 'package:auto_route/annotations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateTeamPage extends StatelessWidget {
  const CreateTeamPage({super.key});

  @override
  Widget build(BuildContext context) => const CodeSwipeScaffold(
        body: Column(
          children: [],
        ),
        appBarTitleText: 'Create Team',
        centerAppBarTitle: false,
      );
}

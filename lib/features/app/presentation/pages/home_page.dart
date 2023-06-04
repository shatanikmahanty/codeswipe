import 'package:auto_route/auto_route.dart';
import 'package:codeswipe/features/app/presentation/codeswipe_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const CodeSwipeScaffold(
        body: Column(
          children: [],
        ),
        appBarTitleText: 'Home',
      );
}

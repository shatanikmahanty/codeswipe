import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:codeswipe/features/home/presentation/upcoming_hackathons_list.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UpcomingHackathonsPage extends StatelessWidget {
  const UpcomingHackathonsPage({super.key});

  @override
  Widget build(BuildContext context) => const CodeSwipeScaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: kPadding * 3,
          ),
          child: UpcomingHackathonsList(),
        ),
        appBarTitleText: 'Upcoming Hackathons',
        centerAppBarTitle: false,
      );
}

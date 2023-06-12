import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/presentation/no_items.dart';
import 'package:codeswipe/features/home/data/blocs/hackathon_cubit.dart';
import 'package:codeswipe/features/home/presentation/hackathons_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingHackathonsList extends StatelessWidget {
  const UpcomingHackathonsList({
    super.key,
    this.isLargeList = true,
  });

  final bool isLargeList;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HackathonCubit, HackathonState>(
        builder: (context, state) {
          final upcomingHackathons = state.hackathons
              .where((hackathon) => hackathon.startDate.isAfter(DateTime.now()))
              .toList();

          final upcomingHackathonsCount = upcomingHackathons.length;

          if (state.isLoading) {
            return const Padding(
              padding: EdgeInsets.all(
                kPadding,
              ),
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state.hackathons.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                vertical: kPadding * 2,
              ),
              child: NoItems(
                message: 'No Upcoming hackathons',
                imageSize: kPadding * 12.5,
              ),
            );
          } else {
            return HackathonsList(
              heroTag: 'upcoming',
              hackathons: state.hackathons,
              shrinkWrap: true,
              itemCount: isLargeList
                  ? upcomingHackathonsCount
                  : upcomingHackathonsCount > 3
                      ? 3
                      : upcomingHackathonsCount,
            );
          }
        },
      );
}

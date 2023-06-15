import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:codeswipe/features/app/presentation/no_items.dart';
import 'package:codeswipe/features/home/data/blocs/hackathon_cubit.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../hackathons_list.dart';

@RoutePage()
class CategoryHackathonPage extends StatelessWidget {
  const CategoryHackathonPage({
    super.key,
    @pathParam required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) => CodeSwipeScaffold(
        appBarTitleText: '$categoryName Hackathons',
        centerAppBarTitle: false,
        body: BlocBuilder<HackathonCubit, HackathonState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final hackathons = state.hackathons
                .where((hackathon) => hackathon.theme == categoryName)
                .toList();
            if (hackathons.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kPadding * 6,
                ),
                child: Center(
                  child: NoItems(
                    message: 'No $categoryName hackathons found',
                    imageSize: kPadding * 12.5,
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kPadding * 3,
                ),
                child: HackathonsList(
                  hackathons: hackathons,
                  shrinkWrap: false,
                  onJoinButtonPressed: (index) {
                    final onButtonPressed = hackathons[index].onClick;

                    if ((onButtonPressed ?? '').isEmpty) {
                      DjangoflowAppSnackbar.showInfo('Coming Soon');
                      return;
                    } else if (onButtonPressed!.contains('launch')) {
                      launchUrlString(
                        onButtonPressed.replaceFirst('launch:', ''),
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                ),
              );
            }
          },
        ),
      );
}

import 'package:codeswipe/features/home/presentation/hackathon_themes_grid.dart';
import 'package:codeswipe/features/home/presentation/join_team_list.dart';
import 'package:codeswipe/features/team/data/blocs/team_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/configurations.dart';
import '../../../app/presentation/codeswipe_section_header.dart';
import '../presentation.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const sectionSeparator = SizedBox(
      height: kPadding * 2,
    );
    return ListView(
      shrinkWrap: true,
      children: [
        const BannerCarousel(),
        BlocBuilder<TeamCubit, TeamState>(
          builder: (context, state) => state.isLoading
              ? const Padding(
                  padding: EdgeInsets.all(
                    kPadding,
                  ),
                  child: Center(child: CircularProgressIndicator()),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kPadding * 4,
                        vertical: kPadding * 2,
                      ),
                      child: _TeamActionButton(
                        hasTeam: state.team != null,
                      ),
                    ),
                    if (state.team == null) ...[
                      sectionSeparator,
                      CodeSwipeSectionHeader(
                        title: 'Join Existing Team',
                        onActionClick: () {},
                        buttonText: 'See All',
                        showActionButton: state.teams.length > 3,
                      ),
                      sectionSeparator,
                      const JoinTeamList(),
                    ],
                  ],
                ),
        ),
        sectionSeparator,
        CodeSwipeSectionHeader(
          title: 'Upcoming Hackathons',
          onActionClick: () {},
          buttonText: 'See All',
          showActionButton: true,
        ),
        sectionSeparator,
        CodeSwipeSectionHeader(
          title: 'Hackathon Themes',
          onActionClick: () {},
          buttonText: '',
          showActionButton: false,
        ),
        const HackathonThemesGrid(),
      ],
    );
  }
}

class _TeamActionButton extends StatelessWidget {
  const _TeamActionButton({required this.hasTeam});

  final bool hasTeam;

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        icon: hasTeam ? const Icon(Icons.people) : const Icon(Icons.add),
        onPressed: () {
          if (hasTeam) {
            context.router.push(const UserTeamRoute());
          } else {
            context.router.push(const CreateTeamRoute());
          }
        },
        label: Text(hasTeam ? 'Your Team' : 'Create Team'),
      );
}

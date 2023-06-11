import 'package:codeswipe/features/home/presentation/hackathon_themes_grid.dart';
import 'package:codeswipe/features/home/presentation/join_team_list.dart';
import 'package:codeswipe/features/team/data/blocs/team_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/configurations.dart';
import '../presentation.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<TeamCubit, TeamState>(
        builder: (context, state) {
          const sectionSeparator = SizedBox(
            height: kPadding * 2,
          );

          return ListView(
            shrinkWrap: true,
            children: [
              const BannerCarousel(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding * 4,
                  vertical: kPadding * 2,
                ),
                child: _TeamActionButton(
                  hasTeam: state.team != null,
                ),
              ),
              sectionSeparator,
              if (state.team == null) ...[
                _SectionHeader(
                  title: 'Join Existing Team',
                  onActionClick: () {},
                  buttonText: 'See All',
                  showActionButton: state.teams.length > 3,
                ),
                sectionSeparator,
                const JoinTeamList(),
              ],
              sectionSeparator,
              _SectionHeader(
                title: 'Upcoming Hackathons',
                onActionClick: () {},
                buttonText: 'See All',
                showActionButton: true,
              ),
              sectionSeparator,
              _SectionHeader(
                title: 'Hackathon Themes',
                onActionClick: () {},
                buttonText: '',
                showActionButton: false,
              ),
              const HackathonThemesGrid(),
            ],
          );
        },
      );
}

class _TeamActionButton extends StatelessWidget {
  const _TeamActionButton({required this.hasTeam});

  final bool hasTeam;

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        icon: hasTeam ? const Icon(Icons.people) : const Icon(Icons.add),
        onPressed: () {
          if (hasTeam) return; //TODO show team page
          context.router.push(const CreateTeamRoute());
        },
        label: Text(hasTeam ? 'Your Team' : 'Create Team'),
      );
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.onActionClick,
    required this.buttonText,
    required this.showActionButton,
  });

  final String title;
  final VoidCallback onActionClick;
  final String buttonText;
  final bool showActionButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding * 4,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          if (showActionButton)
            SizedBox(
              width: kPadding * 12,
              child: TextButton(
                onPressed: onActionClick,
                child: Text(
                  buttonText,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

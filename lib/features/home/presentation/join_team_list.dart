import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/team/data/blocs/team_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/appwrite_storage_image_url_helper.dart';

class JoinTeamList extends StatelessWidget {
  const JoinTeamList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return BlocBuilder<TeamCubit, TeamState>(
      builder: (context, state) {
        if (state.isLoading) {
          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              _TeamListContainer(
                horizontalPadding: kPadding * 2,
                child: _PlaceholderTeam(),
              ),
              _TeamListContainer(
                horizontalPadding: kPadding * 2,
                child: _PlaceholderTeam(),
              ),
            ],
          );
        } else if (state.teams.isEmpty) {
          return Column(
            children: [
              Assets.images.emptyBox.image(
                width: size.width / 2,
              ),
              const SizedBox(height: kPadding * 2),
              Text(
                'No teams found',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
            ],
          );
        }

        final teams = state.teams;
        final teamCount = teams.length;
        const maxShowTeams = 3;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final team = teams[index];

            return _TeamListContainer(
              child: Column(
                children: [
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: getStorageFileUrl(team.id),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: kPadding * 4.5,
                          backgroundImage: imageProvider,
                        ),
                        fadeInCurve: Curves.easeIn,
                        httpHeaders: const {
                          'X-Appwrite-Project': kProjectId,
                        },
                        errorWidget: (context, url, error) =>
                            const CircleAvatar(
                          radius: kPadding * 4.5,
                          child: Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: kPadding * 2,
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              team.name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: kPadding),
                            Text(
                              'Size: ${(team.members ?? []).length.toString()} Members',
                              style: theme.textTheme.bodyMedium?.copyWith(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kPadding * 2),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: kPadding * 16,
                      height: kPadding * 5,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          textStyle: theme.textTheme.titleMedium?.copyWith(
                            color: theme.primaryColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kButtonRadius),
                          ),
                          side: BorderSide(
                            width: kPadding / 2,
                            color: theme.primaryColor,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Request'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: teamCount > maxShowTeams ? maxShowTeams : teamCount,
        );
      },
    );
  }
}

class _TeamListContainer extends StatelessWidget {
  const _TeamListContainer(
      {required this.child, this.horizontalPadding = kPadding * 3});

  final Widget child;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).colorScheme.surface,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: kPadding * 2,
        ),
        child: child,
      );
}

class _PlaceholderTeam extends StatelessWidget {
  const _PlaceholderTeam();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _TeamListContainer(
      child: Shimmer.fromColors(
        baseColor: theme.primaryColor.withOpacity(0.4),
        highlightColor: theme.primaryColor,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: kPadding * 4.5,
                  backgroundColor: theme.primaryColor,
                ),
                const SizedBox(
                  width: kPadding * 2,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: kPadding,
                      ),
                      Container(
                        height: kPadding * 2,
                        color: theme.primaryColor,
                      ),
                      const SizedBox(height: kPadding * 2),
                      Container(
                        height: kPadding * 1.5,
                        color: theme.primaryColor,
                      ),
                      const SizedBox(height: kPadding * 2),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          color: theme.primaryColor,
                          height: kPadding * 3,
                          width: kPadding * 12,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: kPadding * 2),
          ],
        ),
      ),
    );
  }
}

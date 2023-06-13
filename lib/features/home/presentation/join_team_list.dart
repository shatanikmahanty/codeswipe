import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/team/data/blocs/team_cubit.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/appwrite_storage_image_url_helper.dart';
import '../../app/presentation/no_items.dart';

class JoinTeamList extends StatelessWidget {
  const JoinTeamList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
        } else if (state.vacancies.isEmpty) {
          return const NoItems(
            message: 'No team vacancies found',
          );
        }

        final vacancies = state.vacancies;
        const maxShowTeams = 3;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final team =
                context.read<TeamCubit>().getTeam(vacancies[index].teamId);

            return _TeamListContainer(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    errorWidget: (context, url, error) => const CircleAvatar(
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                '${vacancies[index].position} @ ${team.name}',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Chip(
                              avatar: const Icon(
                                Icons.people,
                                size: 16,
                              ),
                              side: const BorderSide(
                                color: Colors.white,
                                width: kPadding / 4,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  kPadding * 2,
                                ),
                              ),
                              label: Text(
                                (team.memberIDs ?? []).length.toString(),
                                style: theme.textTheme.bodyMedium?.copyWith(),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: kPadding * 2,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              vacancies[index].skills.split(',').length,
                              (skillIndex) => Container(
                                margin: const EdgeInsets.only(
                                  right: kPadding,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: kPadding * 2,
                                  vertical: kPadding,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    kButtonRadius,
                                  ),
                                  color: const Color(0xffEDE3FF),
                                ),
                                child: Text(
                                  '#${(vacancies[index].skills.split(',')[skillIndex]).trim().capitalize}',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: kPadding * 2),
                        SizedBox(
                          width: kPadding * 16,
                          height: kPadding * 6,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(kButtonRadius),
                              ),
                              side: BorderSide(
                                width: kPadding / 4,
                                color: theme.primaryColor,
                              ),
                            ),
                            onPressed: () {
                              DjangoflowAppSnackbar.showInfo('Request sent');
                            },
                            child: const Text('Request'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount:
              vacancies.length > maxShowTeams ? maxShowTeams : vacancies.length,
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

    return Shimmer.fromColors(
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
    );
  }
}

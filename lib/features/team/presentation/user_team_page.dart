import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/code_swipe_icons.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:codeswipe/features/app/presentation/codeswipe_dropdown_selected_item.dart';
import 'package:codeswipe/features/team/data/blocs/team_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/presentation/user_action_list_tile.dart';

@RoutePage()
class UserTeamPage extends StatelessWidget {
  const UserTeamPage({super.key});

  @override
  Widget build(BuildContext context) => CodeSwipeScaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(kPadding * 4),
          child: Column(
            children: [
              const Row(
                children: [
                  Text('Member Info'),
                  Spacer(),
                  Text('Role'),
                ],
              ),
              const SizedBox(height: kPadding * 4),
              BlocBuilder<TeamCubit, TeamState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    final team = state.team!;
                    final members = team.members!;
                    final memberRoles = team.memberRoles;

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final member = members[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: kPadding * 2,
                          ),
                          child: UserActionListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (member.id == team.admin)
                                    const Icon(
                                      CodeSwipeIcons.star,
                                      color: Colors.yellow,
                                    ),
                                  CircleAvatar(
                                    radius: kPadding * 2.5,
                                    foregroundImage: CachedNetworkImageProvider(
                                      member.avatar!,
                                    ),
                                  ),
                                ],
                              ),
                              title: member.name,
                              trailing: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  underline: const Offstage(),
                                  value: memberRoles?.containsKey(member.id) ??
                                          false
                                      ? memberRoles![member.id]
                                      : null,
                                  dropdownColor: Colors.white,
                                  onChanged: (value) async {
                                    await context
                                        .read<TeamCubit>()
                                        .updateMemberRole(
                                          teamId: team.id,
                                          memberId: member.id,
                                          role: value as String,
                                        );
                                  },
                                  isExpanded: false,
                                  hint: const Text('Select'),
                                  selectedItemBuilder: (context) => [
                                    const CodeSwipeDropdownSelectedItem(
                                      'Backend',
                                    ),
                                    const CodeSwipeDropdownSelectedItem(
                                      'Frontend',
                                    ),
                                    const CodeSwipeDropdownSelectedItem(
                                      'UI/UX Designer',
                                    ),
                                    const CodeSwipeDropdownSelectedItem(
                                      'Debugger',
                                    ),
                                    const CodeSwipeDropdownSelectedItem(
                                      'Pitcher',
                                    ),
                                  ],
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'backend',
                                      child: Text('Backend'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'frontend',
                                      child: Text('Frontend'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'designer',
                                      child: Text('UI/UX Designer'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'debugger',
                                      child: Text('Debugger'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'pitcher',
                                      child: Text('Pitcher'),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      },
                      itemCount: members.length,
                    );
                  }
                },
              ),
            ],
          ),
        ),
        appBarTitleText: 'My Team',
      );
}

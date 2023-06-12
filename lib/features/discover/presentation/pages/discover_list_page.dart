import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/features/app/presentation/no_items.dart';
import 'package:codeswipe/features/app/presentation/user_action_list_tile.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/features/discover/data/blocs/discover_cubit.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/configurations.dart';
import '../../../app/presentation/codeswipe_section_header.dart';

@RoutePage()
class DiscoverListPage extends StatelessWidget {
  const DiscoverListPage({super.key});

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.all(
          kPadding * 2.5,
        ),
        child: const Column(
          children: [
            _UsersList(),
            SizedBox(height: kPadding * 2),
            _UsersList(isRequests: true),
            SizedBox(height: kPadding * 2),
          ],
        ),
      );
}

class _UsersList extends StatelessWidget {
  const _UsersList({this.isRequests = false});

  final bool isRequests;

  @override
  Widget build(BuildContext context) {
    final message = isRequests ? 'requests' : 'matches';

    return Expanded(
      child: Column(
        children: [
          CodeSwipeSectionHeader(
            title: 'Your ${message.capitalize}',
            showActionButton: false,
            horizontalPadding: kPadding * 2,
          ),
          const SizedBox(
            height: kPadding * 2,
          ),
          BlocBuilder<DiscoverCubit, DiscoverState>(
            builder: (context, state) {
              final users = isRequests ? state.requests : state.matches;

              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (users.isEmpty) {
                return isRequests
                    ? const _DiscoverListNoItem(
                        message: 'No requests yet!',
                      )
                    : const _DiscoverListNoItem(
                        message: 'No matches yet!',
                      );
              }
              return _DiscoverListContent(
                buttonText: isRequests ? 'Accept' : 'Chat',
                users: users,
                onButtonPressed: () {}, //TODO update logic
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DiscoverListContent extends StatelessWidget {
  const _DiscoverListContent({
    required this.buttonText,
    required this.users,
    required this.onButtonPressed,
  });

  final String buttonText;
  final VoidCallback onButtonPressed;
  final List<AppUser> users;

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 1,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final user = users[index];
            return Padding(
              padding: const EdgeInsets.only(
                bottom: kPadding * 2,
              ),
              child: UserActionListTile(
                leading: Container(
                  width: kPadding * 7,
                  height: kPadding * 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        user.avatar!,
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                title: user.name,
                trailing: SizedBox(
                  width: kPadding * 15,
                  height: kPadding * 6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF0E5FF),
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: onButtonPressed,
                    child: Text(buttonText),
                  ),
                ),
              ),
            );
          },
          itemCount: users.length,
        ),
      );
}

class _DiscoverListNoItem extends NoItems {
  const _DiscoverListNoItem({
    required super.message,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kPadding * 4,
        ),
        child: NoItems(
          message: message,
          imageSize: kPadding * 15,
        ),
      );
}

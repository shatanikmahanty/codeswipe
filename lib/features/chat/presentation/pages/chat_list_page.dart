import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/chat/data/blocs/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/presentation/no_items.dart';

@RoutePage()
class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.rooms.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPadding * 4,
              vertical: kPadding * 8,
            ),
            child: NoItems(
              message: 'Match with someone or join a team to start chatting!',
              action: Padding(
                padding: const EdgeInsets.all(kPadding * 5),
                child: OutlinedButton(
                  onPressed: () {
                    context.router.push(const DiscoverRoute());
                  },
                  child: const Text('Go to Discover Page'),
                ),
              ),
            ),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(
              kPadding * 2.5,
            ),
            itemCount: state.rooms.length,
            itemBuilder: (context, index) {
              final room = state.rooms[index];
              final senderImage = state.rooms[index].senderImage;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: kPadding * 6,
                      height: kPadding * 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            senderImage,
                            headers: senderImage.startsWith(kApiEndpoint)
                                ? const {
                                    'X-Appwrite-Project': kProjectId,
                                  }
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      room.senderName,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Offstage(),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}

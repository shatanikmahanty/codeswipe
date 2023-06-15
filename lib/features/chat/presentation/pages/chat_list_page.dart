import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/chat/data/blocs/chat_cubit.dart';
import 'package:codeswipe/features/chat/data/model/chat_message_model.dart';
import 'package:codeswipe/features/team/data/blocs/team_cubit.dart';
import 'package:codeswipe/utils/appwrite_storage_image_url_helper.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
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
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kPadding * 4,
              vertical: kPadding * 8,
            ),
            child: NoItems(
              message: 'Match with someone or join a team to start chatting!',
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding * 2.5,
                ),
                child: Text(
                  'Groups',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                height: kPadding * 20,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    if (context.read<TeamCubit>().state.team != null)
                      _GroupChatBubble(
                        name: 'My Team',
                        avatar: getStorageFileUrl(
                          context.read<TeamCubit>().state.team!.id,
                        ),
                      ),
                    const _GroupChatBubble(
                      name: 'Flipkart Grid',
                      avatar:
                          'https://assets.entrepreneur.com/content/3x2/2000/20180511063849-flipkart-logo-detail-icon.jpeg',
                    ),
                    const _GroupChatBubble(
                      name: 'Appwrite',
                      avatar:
                          'https://pbs.twimg.com/profile_images/1569586501335359494/4rq0Hb99_400x400.jpg',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding * 2.5,
                ),
                child: Text(
                  'Messages',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(
                    kPadding * 2.5,
                  ),
                  itemCount: state.rooms.length,
                  itemBuilder: (context, index) {
                    final room = state.rooms[index];
                    final senderImage = state.rooms[index].senderImage;
                    ChatMessage? lastMessageObject;
                    if ((state.messages[room.chatRoomId] ?? []).isNotEmpty) {
                      lastMessageObject = state.messages[room.chatRoomId]?.last;
                    }
                    final lastMessage = lastMessageObject?.message;
                    return GestureDetector(
                      onTap: () {
                        context.router.push(
                          ChatRoomRoute(roomId: room.chatRoomId),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: kPadding * 2,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Hero(
                                tag: room.senderImage,
                                child: Container(
                                  width: kPadding * 8,
                                  height: kPadding * 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        senderImage,
                                        headers:
                                            senderImage.startsWith(kApiEndpoint)
                                                ? const {
                                                    'X-Appwrite-Project':
                                                        kProjectId,
                                                  }
                                                : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: kPadding * 2,
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    room.senderName,
                                    style: theme.textTheme.labelLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: kPadding,
                                  ),
                                  Text(
                                    lastMessage ?? 'Start Chatting now!',
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class _GroupChatBubble extends StatelessWidget {
  const _GroupChatBubble({required this.name, required this.avatar});

  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(kPadding * 2),
        child: GestureDetector(
          onTap: () {
            DjangoflowAppSnackbar.showInfo(
              'Group chats coming soon!',
            );
          },
          child: Column(
            children: [
              CircleAvatar(
                radius: kPadding * 5,
                backgroundImage: CachedNetworkImageProvider(
                  avatar,
                  headers: avatar.startsWith(kApiEndpoint)
                      ? const {
                          'X-Appwrite-Project': kProjectId,
                        }
                      : null,
                ),
              ),
              const SizedBox(
                height: kPadding * 2,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
}

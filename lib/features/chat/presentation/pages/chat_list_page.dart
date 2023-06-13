import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Chat 1'),
          onTap: () {
            // context.router.push(const ChatRouter(chatId: '1'));
          },
        ),
        ListTile(
          title: const Text('Chat 2'),
          onTap: () {
            // context.router.push(const ChatRouter(chatId: '2'));
          },
        ),
        ListTile(
          title: const Text('Chat 3'),
          onTap: () {
            // context.router.push(const ChatRouter(chatId: '3'));
          },
        ),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:codeswipe/features/chat/data/blocs/chat_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: 'ChatRouter')
class ChatRouterPage extends StatelessWidget implements AutoRouteWrapper {
  const ChatRouterPage({super.key});

  @override
  Widget build(BuildContext context) => const AutoRouter();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<ChatCubit>(
        create: (context) => ChatCubit()
          ..initialize(
            apiClient: context.read(),
          )
          ..loadChatRooms()
          ..getMessagesForChatRooms(),
        child: this,
      );
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:codeswipe/features/chat/data/blocs/chat_cubit.dart';
import 'package:codeswipe/features/chat/data/model/chat_message_model.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class ChatRoomPage extends StatelessWidget {
  ChatRoomPage({
    super.key,
    @PathParam('roomId') required this.roomId,
  });

  final String roomId;

  final leftFirstMessageRadius = const BorderRadius.only(
    topLeft: kCircularRadius,
    bottomLeft: Radius.zero,
    bottomRight: kCircularRadius,
    topRight: kCircularRadius,
  );

  final middleMessageRadius = BorderRadius.circular(kButtonRadius);

  final rightFirstMessageRadius = const BorderRadius.only(
    topLeft: kCircularRadius,
    bottomLeft: kCircularRadius,
    bottomRight: Radius.zero,
    topRight: kCircularRadius,
  );

  FormGroup _formBuilder() => fb.group(
        {
          kMessageField: FormControl<String>(),
        },
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userId = context.read<AuthCubit>().state.user?.id;
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final room = state.rooms.firstWhere(
          (element) => element.chatRoomId == roomId,
        );
        final senderImage = room.senderImage;
        final senderName = room.senderName;
        final messages = state.messages[room.chatRoomId]!.reversed.toList();

        return CodeSwipeScaffold(
          appBarElevation: kPadding / 4,
          appBarTitleWidget: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: room.senderImage,
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
              const SizedBox(
                width: kPadding * 2,
              ),
              Text(
                senderName.split(' ').first,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(
                      vertical: kPadding,
                    ),
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final previousMessage =
                          index > 0 ? messages[index - 1] : null;
                      final isLeftAligned = message.senderID == userId;
                      return Align(
                        alignment: isLeftAligned
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                            bottom: kPadding,
                          ),
                          child: Card(
                            elevation: kPadding / 8,
                            color: message.senderID != userId
                                ? theme.cardColor
                                : const Color(0xffF3F3F3),
                            shape: RoundedRectangleBorder(
                              borderRadius: !isLeftAligned
                                  ? previousMessage?.senderID != userId
                                      ? middleMessageRadius
                                      : leftFirstMessageRadius
                                  : previousMessage?.senderID == userId
                                      ? rightFirstMessageRadius
                                      : middleMessageRadius,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                kPadding * 2,
                              ),
                              child: Text(message.message),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: messages.length,
                  ),
                ),
                ReactiveFormBuilder(
                  form: _formBuilder,
                  builder: (context, form, child) => Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: ReactiveTextField<String>(
                            formControlName: kMessageField,
                            decoration: const InputDecoration(
                              labelText: 'Type a message',
                            ),
                            textInputAction: TextInputAction.send,
                          ),
                        ),
                        const SizedBox(
                          width: kPadding * 2,
                        ),
                        CircularProgressBuilder(
                          builder: (context, action, error) => IconButton(
                            style: IconButton.styleFrom(
                              side: BorderSide(
                                color: theme.primaryColor,
                                width: kPadding / 4,
                              ),
                            ),
                            onPressed: action,
                            icon: Icon(
                              CupertinoIcons.arrow_up_circle_fill,
                              color: theme.primaryColor,
                              size: kPadding * 4,
                            ),
                          ),
                          action: (progress) async {
                            final message = form.value[kMessageField] as String;
                            if (message.isEmpty) {
                              DjangoflowAppSnackbar.showInfo(
                                'Please enter a message',
                              );
                              return;
                            }
                            final currentUser =
                                context.read<AuthCubit>().state.user!;
                            await context.read<ChatCubit>().sendMessage(
                                  roomId: roomId,
                                  chatMessageModel: ChatMessage(
                                    message: message,
                                    senderID: currentUser.id,
                                    senderName: currentUser.name,
                                    messageId: '',
                                    time: DateTime.now(),
                                  ),
                                );
                            form.reset();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

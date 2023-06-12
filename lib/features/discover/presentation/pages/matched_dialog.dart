import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/app.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MatchedDialogPage extends StatelessWidget {
  const MatchedDialogPage({
    super.key,
    required this.avatar1,
    required this.avatar2,
    required this.matchName,
  });

  final String avatar1;
  final String avatar2;
  final String matchName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CodeSwipeScaffold(
      body: Padding(
        padding: const EdgeInsets.all(kPadding * 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'It\'s a match!',
              style: theme.textTheme.displaySmall?.copyWith(
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: kPadding * 4),
            Text(
              'You and $matchName have liked each other.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: kPadding * 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: kPadding * 5,
                  backgroundImage: CachedNetworkImageProvider(
                    avatar1,
                  ),
                ),
                const SizedBox(width: kPadding * 2),
                CircleAvatar(
                  radius: kPadding * 5,
                  backgroundImage: CachedNetworkImageProvider(
                    avatar2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: kPadding * 4),
            Text(
              'Send a message to start a conversation.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: kPadding * 4),
            ElevatedButton(
              child: const Text('Send a message'),
              onPressed: () {},
            ),
            const SizedBox(height: kPadding * 4),
          ],
        ),
      ),
      showAppBar: false,
    );
  }
}

import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  const NoItems({
    super.key,
    required this.message,
    this.imageSize,
    this.action,
  });

  final String message;
  final double? imageSize;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Assets.images.emptyBox.image(
          width: imageSize ?? size.width / 2,
        ),
        const SizedBox(height: kPadding * 2),
        Text(
          message,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        action ?? const Offstage(),
      ],
    );
  }
}

import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

class CodeSwipeIconButton extends StatelessWidget {
  const CodeSwipeIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(
              kButtonRadius,
            ),
          ),
          width: kPadding * 6,
          height: kPadding * 6,
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
}

import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/presentation/codeswipe_icon_button.dart';
import 'package:flutter/material.dart';

class CodeSwipeAutoLeadingButton extends StatelessWidget {
  const CodeSwipeAutoLeadingButton({super.key, this.onPressed, this.icon});

  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => AutoLeadingButton(
        builder: (context, type, function) {
          if (type == LeadingType.noLeading) return const Offstage();
          return CodeSwipeIconButton(
            onPressed: onPressed ?? function,
            icon: icon ??
                (type == LeadingType.back
                    ? Icons.chevron_left
                    : type == LeadingType.close
                        ? Icons.close
                        : Icons.menu),
          );
        },
      );
}

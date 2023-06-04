import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

class CodeSwipeAutoLeadingButton extends StatelessWidget {
  const CodeSwipeAutoLeadingButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => AutoLeadingButton(
        builder: (context, type, function) {
          if (type == LeadingType.noLeading) return const Offstage();
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(
                kButtonRadius,
              ),
            ),
            child: GestureDetector(
              onTap: onPressed ?? function,
              child: Icon(
                type == LeadingType.back
                    ? Icons.chevron_left
                    : type == LeadingType.close
                        ? Icons.close
                        : Icons.menu,
                color: Theme.of(context).primaryColor,
                size: kPadding * 3,
              ),
            ),
          );
        },
      );
}

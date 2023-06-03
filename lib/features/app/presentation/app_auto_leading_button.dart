import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

class AppAutoLeadingButton extends StatelessWidget {
  const AppAutoLeadingButton({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE8E6EA)),
          borderRadius: BorderRadius.circular(
            kButtonRadius,
          ),
        ),
        child: AutoLeadingButton(
          builder: (context, type, function) => IconButton(
            icon: Icon(
              type == LeadingType.back
                  ? Icons.chevron_left
                  : type == LeadingType.close
                      ? Icons.close
                      : Icons.menu,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: function,
          ),
        ),
      );
}

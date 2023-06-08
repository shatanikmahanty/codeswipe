import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_builder/progress_builder.dart';

import '../../../configurations/configurations.dart';
import '../data/blocs/auth_cubit.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    this.authButtonType = AuthButtonType.filled,
    this.icon,
    this.label,
    required this.provider,
    this.onPressed,
  }) : super(key: key);

  final AuthButtonType authButtonType;
  final IconData? icon;
  final String? label;
  final String provider;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => CircularProgressBuilder.adaptive(
        builder: (context, action, error) =>
            authButtonType == AuthButtonType.filled
                ? ElevatedButton(
                    onPressed: action,
                    child: Padding(
                      padding: const EdgeInsets.all(kPadding * 2),
                      child: Row(
                        children: [
                          Icon(
                            icon,
                            size: kPadding * 4,
                          ),
                          const SizedBox(
                            width: kPadding * 2,
                          ),
                          Text(label!),
                        ],
                      ),
                    ),
                  )
                : authButtonType == AuthButtonType.outlined
                    ? OutlinedButton(
                        onPressed: action,
                        child: Padding(
                          padding: const EdgeInsets.all(kPadding * 2),
                          child: Text(label!),
                        ),
                      )
                    : IconButton(
                        onPressed: action,
                        icon: Icon(
                          icon,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
        action: (_) async {
          if (onPressed != null) {
            onPressed?.call();
          } else {
            await context.read<AuthCubit>().loginWithProvider(provider);
          }
        },
      );
}

enum AuthButtonType {
  filled,
  outlined,
  icon,
}

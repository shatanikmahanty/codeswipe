import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:flutter/material.dart';

/// Checks for intialUser, if available then triggers onLogin callback,
/// as `BlocListener` doesn't listen to intial state
class LoginListenerWrapper extends StatefulWidget {
  const LoginListenerWrapper({
    super.key,
    this.onLogin,
    this.onLogout,
    required this.child,
    required this.initialUser,
  });

  final AppUser? initialUser;
  final void Function(BuildContext context, AppUser user)? onLogin;
  final void Function(BuildContext context)? onLogout;
  final Widget child;

  @override
  State<LoginListenerWrapper> createState() => _LoginListenerWrapperState();
}

class _LoginListenerWrapperState extends State<LoginListenerWrapper> {
  @override
  void initState() {
    super.initState();
    if (widget.initialUser != null) {
      widget.onLogin?.call(context, widget.initialUser!);
    }
  }

  @override
  Widget build(BuildContext context) => LoginListener(
        onLogin: widget.onLogin,
        onLogout: widget.onLogout,
        child: widget.child,
      );
}

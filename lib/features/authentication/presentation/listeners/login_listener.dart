import 'package:codeswipe/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginListener extends BlocListener<AuthCubit, AuthState> {
  LoginListener({
    Key? key,
    void Function(BuildContext context, AppUser user)? onLogin,
    void Function(BuildContext context)? onLogout,
    Widget? child,
  }) : super(
            key: key,
            listener: (context, authState) => authState.user != null
                ? onLogin?.call(context, authState.user!)
                : onLogout?.call(context),
            child: child,
            // Since AutoLogin will trigger a state change for isLoading
            // we need to listen to it as well as
            // And user state is preserverd in HydratedBloc
            // and only it will not trigger listener when autologin used
            listenWhen: (prev, next) => (next.user?.id != prev.user?.id));
}

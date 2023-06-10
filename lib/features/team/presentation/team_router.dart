import 'package:auto_route/auto_route.dart';
import 'package:codeswipe/features/team/data/blocs/team_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/data/api_client.dart';

@RoutePage(
  name: 'TeamRouter',
)
class TeamRouterPage extends StatelessWidget implements AutoRouteWrapper {
  const TeamRouterPage({super.key});

  @override
  Widget build(BuildContext context) => const AutoRouter();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<TeamCubit>(
        create: (_) => TeamCubit()
          ..initialize(
            apiClient: context.read<ApiClient>(),
          ),
        child: this,
      );
}

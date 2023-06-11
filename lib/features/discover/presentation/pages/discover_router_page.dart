import 'package:auto_route/auto_route.dart';
import 'package:codeswipe/features/discover/data/blocs/discover_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/data/api_client.dart';

@RoutePage(
  name: 'discoverRouter',
)
class DiscoverRouterPage extends StatelessWidget implements AutoRouteWrapper {
  const DiscoverRouterPage({super.key});

  @override
  Widget build(BuildContext context) => const AutoRouter();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<DiscoverCubit>(
        create: (context) => DiscoverCubit()
          ..initialize(
            context.read<ApiClient>(),
          )
          ..loadProfiles(),
        child: this,
      );
}

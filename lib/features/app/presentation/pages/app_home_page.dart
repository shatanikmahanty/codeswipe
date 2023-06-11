import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/data/api_client.dart';
import 'package:codeswipe/features/app/presentation/codeswipe_app_bar.dart';
import 'package:codeswipe/features/app/presentation/codeswipe_icon_button.dart';
import 'package:codeswipe/features/home/data/blocs/banner_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../code_swipe_icons.dart';
import '../../../authentication/data/blocs/auth_cubit.dart';

@RoutePage()
class AppHomePage extends StatelessWidget with AutoRouteWrapper {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          DiscoverRoute(),
          UnknownRoute(),
          UnknownRoute(),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        animationCurve: Curves.easeInOut,
        resizeToAvoidBottomInset: false,
        appBarBuilder: (context, tabsRouter) {
          final action = tabsRouter.activeIndex == 1
              ? CodeSwipeIconButton(
                  onPressed: () {},
                  icon: CupertinoIcons.hand_draw_fill,
                )
              : CodeSwipeIconButton(
                  onPressed: () => AuthCubit.instance.logout(),
                  icon: Icons.logout,
                );

          return CodeSwipeAppBar(
            centerTitle: true,
            appBarTitleText: getAppBarTextFromIndex(tabsRouter.activeIndex),
            actions: [
              action,
              const SizedBox(
                width: kPadding * 2,
              ),
            ],
          );
        },
        bottomNavigationBuilder: (context, tabsRouter) => SafeArea(
          bottom: true,
          child: SizedBox(
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (value) => tabsRouter.setActiveIndex(value),
              currentIndex: tabsRouter.activeIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(CodeSwipeIcons.home),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(CodeSwipeIcons.swipe),
                  label: 'Discover',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(CodeSwipeIcons.chat),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: CachedNetworkImage(
                    height: kPadding * 4,
                    width: kPadding * 4,
                    imageUrl: AuthCubit.instance.state.user?.avatar ?? '',
                    errorWidget: (context, url, error) => const Icon(
                      Icons.person,
                    ),
                    placeholder: (context, url) => const Icon(
                      Icons.person,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      );

  String getAppBarTextFromIndex(int index) {
    switch (index) {
      case 0:
        return 'Home';

      case 1:
        return 'Discover';
      case 2:
        return 'Chat';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<BannerCubit>(
            create: (context) => BannerCubit()
              ..initialize(
                context.read<ApiClient>(),
              )
              ..loadBanners(),
          ),
        ],
        child: this,
      );
}

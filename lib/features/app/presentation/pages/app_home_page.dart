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
          DiscoverRouter(),
          ChatRouter(),
          ProfileRoute(),
        ],
        transitionBuilder: (context, child, animation) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.fastOutSlowIn;

          if ((context.tabsRouter.previousIndex ?? 0) <
              context.tabsRouter.activeIndex) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: begin, end: end).chain(
                  CurveTween(
                    curve: curve,
                  ),
                ),
              ),
              child: child,
            );
          } else {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: -begin, end: -end).chain(
                  CurveTween(curve: curve),
                ),
              ),
              child: child,
            );
          }
        },
        animationCurve: Curves.easeInOut,
        resizeToAvoidBottomInset: false,
        appBarBuilder: (context, tabsRouter) {
          Widget action = tabsRouter.activeIndex == 1
              ? tabsRouter.current.topMatch.name == 'list'
                  ? const Offstage()
                  : CodeSwipeIconButton(
                      onPressed: () {
                        context.router.push(const DiscoverListRoute());
                      },
                      icon: CupertinoIcons.hand_draw_fill,
                    )
              : CodeSwipeIconButton(
                  onPressed: () => AuthCubit.instance.logout(),
                  icon: Icons.logout,
                );

          if (tabsRouter.activeIndex == 2 || tabsRouter.activeIndex == 3) {
            action = const Offstage();
          }

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
        bottomNavigationBuilder: (context, tabsRouter) {
          final avatar = AuthCubit.instance.state.user?.avatar;

          return SafeArea(
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
                    icon: avatar == null
                        ? const Icon(
                            Icons.person,
                          )
                        : CircleAvatar(
                            radius: kPadding * 2,
                            foregroundImage: CachedNetworkImageProvider(
                              avatar,
                              headers: avatar.startsWith(kApiEndpoint)
                                  ? const {
                                      'X-Appwrite-Project': kProjectId,
                                    }
                                  : null,
                            ),
                          ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          );
        },
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

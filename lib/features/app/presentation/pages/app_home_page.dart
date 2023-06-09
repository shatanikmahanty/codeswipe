import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/features/app/presentation/codeswipe_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../code_swipe_icons.dart';
import '../../../authentication/data/blocs/auth_cubit.dart';

@RoutePage()
class AppHomePage extends StatelessWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
        routes: const [
          UnknownRoute(),
          UnknownRoute(),
          UnknownRoute(),
          UnknownRoute(),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        animationCurve: Curves.easeInOut,
        resizeToAvoidBottomInset: false,
        appBarBuilder: (context, tabsRouter) => CodeSwipeAppBar(
          centerTitle: true,
          appBarTitleText: getAppBarTextFromIndex(tabsRouter.activeIndex),
          actions: [
            IconButton(
              onPressed: () {
                AuthCubit.instance.logout();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        bottomNavigationBuilder: (context, tabsRouter) => SafeArea(
          bottom: true,
          child: SizedBox(
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (value) => tabsRouter.setActiveIndex(value),
              currentIndex: tabsRouter.activeIndex,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CodeSwipeIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CodeSwipeIcons.swipe),
                  label: 'Discover',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CodeSwipeIcons.chat),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
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
}

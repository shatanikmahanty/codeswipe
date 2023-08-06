// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i31;
import 'package:codeswipe/features/app/presentation/pages/app_home_page.dart'
    deferred as _i1;
import 'package:codeswipe/features/app/presentation/pages/unknown_page.dart'
    deferred as _i2;
import 'package:codeswipe/features/authentication/presentation/pages/login_options_router_page.dart'
    deferred as _i3;
import 'package:codeswipe/features/authentication/presentation/pages/login_providers_page.dart'
    deferred as _i4;
import 'package:codeswipe/features/authentication/presentation/pages/login_router_page.dart'
    deferred as _i5;
import 'package:codeswipe/features/authentication/presentation/pages/onboarding_page.dart'
    deferred as _i6;
import 'package:codeswipe/features/authentication/presentation/pages/phone_auth_router_page.dart'
    deferred as _i7;
import 'package:codeswipe/features/authentication/presentation/pages/phone_login_page.dart'
    deferred as _i8;
import 'package:codeswipe/features/authentication/presentation/pages/phone_otp_verify_page.dart'
    deferred as _i9;
import 'package:codeswipe/features/chat/presentation/pages/chat_list_page.dart'
    deferred as _i10;
import 'package:codeswipe/features/chat/presentation/pages/chat_room_page.dart'
    deferred as _i11;
import 'package:codeswipe/features/chat/presentation/pages/chat_router_page.dart'
    deferred as _i12;
import 'package:codeswipe/features/discover/presentation/pages/discover_list_page.dart'
    deferred as _i13;
import 'package:codeswipe/features/discover/presentation/pages/discover_page.dart'
    deferred as _i14;
import 'package:codeswipe/features/discover/presentation/pages/discover_router_page.dart'
    deferred as _i15;
import 'package:codeswipe/features/discover/presentation/pages/matched_dialog.dart'
    deferred as _i16;
import 'package:codeswipe/features/home/presentation/pages/category_hackathon_page.dart'
    deferred as _i17;
import 'package:codeswipe/features/home/presentation/pages/hackathon_router_page.dart'
    deferred as _i18;
import 'package:codeswipe/features/home/presentation/pages/home_page.dart'
    deferred as _i19;
import 'package:codeswipe/features/home/presentation/pages/upcoming_hackathons_page.dart'
    deferred as _i20;
import 'package:codeswipe/features/profile/presentation/pages/profile_page.dart'
    deferred as _i21;
import 'package:codeswipe/features/team/presentation/pages/create_team_page.dart'
    deferred as _i22;
import 'package:codeswipe/features/team/presentation/pages/post_vacancy_teammates_page.dart'
    deferred as _i23;
import 'package:codeswipe/features/team/presentation/pages/team_router.dart'
    deferred as _i24;
import 'package:codeswipe/features/team/presentation/pages/user_team_page.dart'
    deferred as _i25;
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_prefs_page.dart'
    deferred as _i26;
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_profile_page.dart'
    deferred as _i27;
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_router_page.dart'
    deferred as _i28;
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_skills_page.dart'
    deferred as _i29;
import 'package:codeswipe/features/user_survey/presentation/pages/user_survey_team_page.dart'
    deferred as _i30;
import 'package:flutter/cupertino.dart' as _i33;
import 'package:flutter/material.dart' as _i32;

abstract class $AppRouter extends _i31.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i31.PageFactory> pagesMap = {
    AppHomeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i1.loadLibrary,
          () => _i31.WrappedRoute(child: _i1.AppHomePage()),
        ),
      );
    },
    UnknownRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.UnknownPage(),
        ),
      );
    },
    LoginOptionsRouter.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.LoginOptionsRouterPage(),
        ),
      );
    },
    LoginProvidersRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.LoginProvidersPage(),
        ),
      );
    },
    LoginRouter.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.LoginRouterPage(),
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>(
          orElse: () => const OnboardingRouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.OnboardingPage(key: args.key),
        ),
      );
    },
    PhoneAuthRouter.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.PhoneAuthRouterPage(),
        ),
      );
    },
    PhoneLoginRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i8.loadLibrary,
          () => _i8.PhoneLoginPage(),
        ),
      );
    },
    PhoneOtpVerifyRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i9.loadLibrary,
          () => _i9.PhoneOtpVerifyPage(),
        ),
      );
    },
    ChatListRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i10.loadLibrary,
          () => _i10.ChatListPage(),
        ),
      );
    },
    ChatRoomRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ChatRoomRouteArgs>(
          orElse: () =>
              ChatRoomRouteArgs(roomId: pathParams.getString('roomId')));
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i11.loadLibrary,
          () => _i11.ChatRoomPage(
            key: args.key,
            roomId: args.roomId,
          ),
        ),
      );
    },
    ChatRouter.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i12.loadLibrary,
          () => _i31.WrappedRoute(child: _i12.ChatRouterPage()),
        ),
      );
    },
    DiscoverListRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i13.loadLibrary,
          () => _i13.DiscoverListPage(),
        ),
      );
    },
    DiscoverRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i14.loadLibrary,
          () => _i14.DiscoverPage(),
        ),
      );
    },
    DiscoverRouter.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i15.loadLibrary,
          () => _i31.WrappedRoute(child: _i15.DiscoverRouterPage()),
        ),
      );
    },
    MatchedDialogRoute.name: (routeData) {
      final args = routeData.argsAs<MatchedDialogRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i16.loadLibrary,
          () => _i16.MatchedDialogPage(
            key: args.key,
            avatar1: args.avatar1,
            avatar2: args.avatar2,
            matchName: args.matchName,
          ),
        ),
      );
    },
    CategoryHackathonRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CategoryHackathonRouteArgs>(
          orElse: () => CategoryHackathonRouteArgs(
              categoryName: pathParams.getString('categoryName')));
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i17.loadLibrary,
          () => _i17.CategoryHackathonPage(
            key: args.key,
            categoryName: args.categoryName,
          ),
        ),
      );
    },
    HackathonRouter.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i18.loadLibrary,
          () => _i18.HackathonRouterPage(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i19.loadLibrary,
          () => _i19.HomePage(),
        ),
      );
    },
    UpcomingHackathonsRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i20.loadLibrary,
          () => _i20.UpcomingHackathonsPage(),
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i21.loadLibrary,
          () => _i21.ProfilePage(),
        ),
      );
    },
    CreateTeamRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i22.loadLibrary,
          () => _i22.CreateTeamPage(),
        ),
      );
    },
    PostVacancyTeammatesRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i23.loadLibrary,
          () => _i23.PostVacancyTeammatesPage(),
        ),
      );
    },
    TeamRouter.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i24.loadLibrary,
          () => _i31.WrappedRoute(child: _i24.TeamRouterPage()),
        ),
      );
    },
    UserTeamRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i25.loadLibrary,
          () => _i25.UserTeamPage(),
        ),
      );
    },
    UserSurveyPrefsRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i26.loadLibrary,
          () => _i26.UserSurveyPrefsPage(),
        ),
      );
    },
    UserSurveyProfileRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i27.loadLibrary,
          () => _i27.UserSurveyProfilePage(),
        ),
      );
    },
    UserSurveyRouter.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i28.loadLibrary,
          () => _i31.WrappedRoute(child: _i28.UserSurveyRouterPage()),
        ),
      );
    },
    UserSurveySkillsRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i29.loadLibrary,
          () => _i29.UserSurveySkillsPage(),
        ),
      );
    },
    UserSurveyTeamRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.DeferredWidget(
          _i30.loadLibrary,
          () => _i30.UserSurveyTeamPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AppHomePage]
class AppHomeRoute extends _i31.PageRouteInfo<void> {
  const AppHomeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AppHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppHomeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i2.UnknownPage]
class UnknownRoute extends _i31.PageRouteInfo<void> {
  const UnknownRoute({List<_i31.PageRouteInfo>? children})
      : super(
          UnknownRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnknownRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginOptionsRouterPage]
class LoginOptionsRouter extends _i31.PageRouteInfo<void> {
  const LoginOptionsRouter({List<_i31.PageRouteInfo>? children})
      : super(
          LoginOptionsRouter.name,
          initialChildren: children,
        );

  static const String name = 'LoginOptionsRouter';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginProvidersPage]
class LoginProvidersRoute extends _i31.PageRouteInfo<void> {
  const LoginProvidersRoute({List<_i31.PageRouteInfo>? children})
      : super(
          LoginProvidersRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginProvidersRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginRouterPage]
class LoginRouter extends _i31.PageRouteInfo<void> {
  const LoginRouter({List<_i31.PageRouteInfo>? children})
      : super(
          LoginRouter.name,
          initialChildren: children,
        );

  static const String name = 'LoginRouter';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnboardingPage]
class OnboardingRoute extends _i31.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i32.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          OnboardingRoute.name,
          args: OnboardingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i31.PageInfo<OnboardingRouteArgs> page =
      _i31.PageInfo<OnboardingRouteArgs>(name);
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key});

  final _i32.Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.PhoneAuthRouterPage]
class PhoneAuthRouter extends _i31.PageRouteInfo<void> {
  const PhoneAuthRouter({List<_i31.PageRouteInfo>? children})
      : super(
          PhoneAuthRouter.name,
          initialChildren: children,
        );

  static const String name = 'PhoneAuthRouter';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PhoneLoginPage]
class PhoneLoginRoute extends _i31.PageRouteInfo<void> {
  const PhoneLoginRoute({List<_i31.PageRouteInfo>? children})
      : super(
          PhoneLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneLoginRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PhoneOtpVerifyPage]
class PhoneOtpVerifyRoute extends _i31.PageRouteInfo<void> {
  const PhoneOtpVerifyRoute({List<_i31.PageRouteInfo>? children})
      : super(
          PhoneOtpVerifyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneOtpVerifyRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ChatListPage]
class ChatListRoute extends _i31.PageRouteInfo<void> {
  const ChatListRoute({List<_i31.PageRouteInfo>? children})
      : super(
          ChatListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatListRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ChatRoomPage]
class ChatRoomRoute extends _i31.PageRouteInfo<ChatRoomRouteArgs> {
  ChatRoomRoute({
    _i33.Key? key,
    required String roomId,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ChatRoomRoute.name,
          args: ChatRoomRouteArgs(
            key: key,
            roomId: roomId,
          ),
          rawPathParams: {'roomId': roomId},
          initialChildren: children,
        );

  static const String name = 'ChatRoomRoute';

  static const _i31.PageInfo<ChatRoomRouteArgs> page =
      _i31.PageInfo<ChatRoomRouteArgs>(name);
}

class ChatRoomRouteArgs {
  const ChatRoomRouteArgs({
    this.key,
    required this.roomId,
  });

  final _i33.Key? key;

  final String roomId;

  @override
  String toString() {
    return 'ChatRoomRouteArgs{key: $key, roomId: $roomId}';
  }
}

/// generated route for
/// [_i12.ChatRouterPage]
class ChatRouter extends _i31.PageRouteInfo<void> {
  const ChatRouter({List<_i31.PageRouteInfo>? children})
      : super(
          ChatRouter.name,
          initialChildren: children,
        );

  static const String name = 'ChatRouter';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i13.DiscoverListPage]
class DiscoverListRoute extends _i31.PageRouteInfo<void> {
  const DiscoverListRoute({List<_i31.PageRouteInfo>? children})
      : super(
          DiscoverListRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverListRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i14.DiscoverPage]
class DiscoverRoute extends _i31.PageRouteInfo<void> {
  const DiscoverRoute({List<_i31.PageRouteInfo>? children})
      : super(
          DiscoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i15.DiscoverRouterPage]
class DiscoverRouter extends _i31.PageRouteInfo<void> {
  const DiscoverRouter({List<_i31.PageRouteInfo>? children})
      : super(
          DiscoverRouter.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRouter';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i16.MatchedDialogPage]
class MatchedDialogRoute extends _i31.PageRouteInfo<MatchedDialogRouteArgs> {
  MatchedDialogRoute({
    _i32.Key? key,
    required String avatar1,
    required String avatar2,
    required String matchName,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          MatchedDialogRoute.name,
          args: MatchedDialogRouteArgs(
            key: key,
            avatar1: avatar1,
            avatar2: avatar2,
            matchName: matchName,
          ),
          initialChildren: children,
        );

  static const String name = 'MatchedDialogRoute';

  static const _i31.PageInfo<MatchedDialogRouteArgs> page =
      _i31.PageInfo<MatchedDialogRouteArgs>(name);
}

class MatchedDialogRouteArgs {
  const MatchedDialogRouteArgs({
    this.key,
    required this.avatar1,
    required this.avatar2,
    required this.matchName,
  });

  final _i32.Key? key;

  final String avatar1;

  final String avatar2;

  final String matchName;

  @override
  String toString() {
    return 'MatchedDialogRouteArgs{key: $key, avatar1: $avatar1, avatar2: $avatar2, matchName: $matchName}';
  }
}

/// generated route for
/// [_i17.CategoryHackathonPage]
class CategoryHackathonRoute
    extends _i31.PageRouteInfo<CategoryHackathonRouteArgs> {
  CategoryHackathonRoute({
    _i32.Key? key,
    required String categoryName,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          CategoryHackathonRoute.name,
          args: CategoryHackathonRouteArgs(
            key: key,
            categoryName: categoryName,
          ),
          rawPathParams: {'categoryName': categoryName},
          initialChildren: children,
        );

  static const String name = 'CategoryHackathonRoute';

  static const _i31.PageInfo<CategoryHackathonRouteArgs> page =
      _i31.PageInfo<CategoryHackathonRouteArgs>(name);
}

class CategoryHackathonRouteArgs {
  const CategoryHackathonRouteArgs({
    this.key,
    required this.categoryName,
  });

  final _i32.Key? key;

  final String categoryName;

  @override
  String toString() {
    return 'CategoryHackathonRouteArgs{key: $key, categoryName: $categoryName}';
  }
}

/// generated route for
/// [_i18.HackathonRouterPage]
class HackathonRouter extends _i31.PageRouteInfo<void> {
  const HackathonRouter({List<_i31.PageRouteInfo>? children})
      : super(
          HackathonRouter.name,
          initialChildren: children,
        );

  static const String name = 'HackathonRouter';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i19.HomePage]
class HomeRoute extends _i31.PageRouteInfo<void> {
  const HomeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i20.UpcomingHackathonsPage]
class UpcomingHackathonsRoute extends _i31.PageRouteInfo<void> {
  const UpcomingHackathonsRoute({List<_i31.PageRouteInfo>? children})
      : super(
          UpcomingHackathonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpcomingHackathonsRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ProfilePage]
class ProfileRoute extends _i31.PageRouteInfo<void> {
  const ProfileRoute({List<_i31.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i22.CreateTeamPage]
class CreateTeamRoute extends _i31.PageRouteInfo<void> {
  const CreateTeamRoute({List<_i31.PageRouteInfo>? children})
      : super(
          CreateTeamRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTeamRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i23.PostVacancyTeammatesPage]
class PostVacancyTeammatesRoute extends _i31.PageRouteInfo<void> {
  const PostVacancyTeammatesRoute({List<_i31.PageRouteInfo>? children})
      : super(
          PostVacancyTeammatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostVacancyTeammatesRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i24.TeamRouterPage]
class TeamRouter extends _i31.PageRouteInfo<void> {
  const TeamRouter({List<_i31.PageRouteInfo>? children})
      : super(
          TeamRouter.name,
          initialChildren: children,
        );

  static const String name = 'TeamRouter';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i25.UserTeamPage]
class UserTeamRoute extends _i31.PageRouteInfo<void> {
  const UserTeamRoute({List<_i31.PageRouteInfo>? children})
      : super(
          UserTeamRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTeamRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i26.UserSurveyPrefsPage]
class UserSurveyPrefsRoute extends _i31.PageRouteInfo<void> {
  const UserSurveyPrefsRoute({List<_i31.PageRouteInfo>? children})
      : super(
          UserSurveyPrefsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSurveyPrefsRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i27.UserSurveyProfilePage]
class UserSurveyProfileRoute extends _i31.PageRouteInfo<void> {
  const UserSurveyProfileRoute({List<_i31.PageRouteInfo>? children})
      : super(
          UserSurveyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSurveyProfileRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i28.UserSurveyRouterPage]
class UserSurveyRouter extends _i31.PageRouteInfo<void> {
  const UserSurveyRouter({List<_i31.PageRouteInfo>? children})
      : super(
          UserSurveyRouter.name,
          initialChildren: children,
        );

  static const String name = 'UserSurveyRouter';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i29.UserSurveySkillsPage]
class UserSurveySkillsRoute extends _i31.PageRouteInfo<void> {
  const UserSurveySkillsRoute({List<_i31.PageRouteInfo>? children})
      : super(
          UserSurveySkillsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSurveySkillsRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i30.UserSurveyTeamPage]
class UserSurveyTeamRoute extends _i31.PageRouteInfo<void> {
  const UserSurveyTeamRoute({List<_i31.PageRouteInfo>? children})
      : super(
          UserSurveyTeamRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSurveyTeamRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

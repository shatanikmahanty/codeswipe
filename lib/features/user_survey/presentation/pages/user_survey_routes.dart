import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/utils/custom_tranisitions_route.dart';

final userSurveyRoutes = [
  scaleTransitionCustomRoute(
    path: 'profile',
    initial: true,
    page: UserSurveyProfileRoute.page,
    meta: const {
      'title': 'Set up Your Profile',
    },
  ),
  scaleTransitionCustomRoute(
    path: 'skills',
    page: UserSurveySkillsRoute.page,
    meta: const {
      'title': 'Your Skills',
    },
  ),
  scaleTransitionCustomRoute(
    path: 'preferences',
    page: UserSurveyPrefsRoute.page,
    meta: const {
      'title': 'Preferences',
    },
  ),
  scaleTransitionCustomRoute(
    path: 'team',
    page: UserSurveyTeamRoute.page,
    meta: const {
      'title': 'Select one option',
    },
  ),
];

// Global APP - specific constants

import 'package:codeswipe/configurations/constants/fonts.gen.dart';

///Generate by running ```fluttergen``` in the terminal
export 'assets.gen.dart';
export 'fonts.gen.dart';

const kAppTitle = 'CodeSwipe';
const kMontserratFontFamily = FontFamily.montserrat;

const kApiEndpoint = 'https://cloud.appwrite.io/v1';
const kProjectId = '64744a4bdf0086c42753';

const kAppIdentifier = 'codeswipe';

const databaseIdDev = '$kAppIdentifier-dev';
const databaseIdProd = '$kAppIdentifier-prod';

const kDefaultCountryCode = '+91';

/// Collections

const kUsersCollection = 'users';
const kOtpLength = 6;

const kSkillsList = [
  'UI/UX Design',
  'C#',
  'C',
  'C++',
  'Data Science',
  'ML',
  'Flask',
  'HTML',
  'Django',
  'CSS',
  'React',
  'Angular',
  'Vue',
  'Node',
  'SQL',
  'JAVA',
  'Python',
  'Flutter',
  'Kotlin',
  'Swift',
  'Tailwind',
  'Solidity',
];

///Form control names
const kPhoneField = 'phone';
const kOtpField = 'otp';
const kNameField = 'name';
const kEmailField = 'email';
const kCourseField = 'course';
const kCollegeNameField = 'collegeName';
const kGradYearField = 'gradYear';
const kBioField = 'bio';

///User prefs
const userSurveyAttemptedPref = 'user_survey_attempted';

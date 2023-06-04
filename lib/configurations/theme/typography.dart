import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTextStyle {
  static TextStyle get displayLarge => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 57,
        height: 1.12,
        letterSpacing: -.2,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get displayMedium => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 45,
        height: 1.16,
        letterSpacing: -.2,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get displaySmall => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 36,
        height: 1.22,
        letterSpacing: -.2,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get headlineLarge => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 34,
        height: 1.25,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get headlineMedium => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        height: 1.29,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get headlineSmall => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        height: 1.33,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get titleLarge => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
        height: 1.27,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get titleMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.5,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get titleSmall => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.43,
        letterSpacing: .1,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get labelLarge => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.43,
        letterSpacing: 0.1,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get labelMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1.33,
        letterSpacing: 0.5,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get labelSmall => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 11,
        height: 1.45,
        letterSpacing: 0.5,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get bodyLarge => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.5,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.33,
        letterSpacing: 0.25,
        fontFamily: kMontserratFontFamily,
      );

  static TextStyle get bodySmall => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.45,
        letterSpacing: 0.4,
        fontFamily: kMontserratFontFamily,
      );

  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
      );
}

import 'package:flutter/material.dart';

class AppColors {
  static ColorScheme get lightColorScheme => const ColorScheme(
        primary: primary,
        primaryContainer: primaryContainer,
        onPrimary: onPrimary,
        onPrimaryContainer: onPrimaryContainer,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        surface: surface,
        onSurface: onSurface,
        surfaceVariant: surfaceVariant,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        background: background,
        onBackground: onBackground,
        brightness: Brightness.light,
      );

  static ColorScheme get darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: primaryDark,
        primaryContainer: primaryContainerDark,
        onPrimary: onPrimaryDark,
        onPrimaryContainer: onPrimaryContainerDark,
        secondary: secondaryDark,
        onSecondary: onSecondaryDark,
        secondaryContainer: secondaryContainerDark,
        onSecondaryContainer: onSecondaryContainerDark,
        tertiary: tertiaryDark,
        onTertiary: onTertiaryDark,
        tertiaryContainer: tertiaryContainerDark,
        onTertiaryContainer: onTertiaryContainerDark,
        error: errorDark,
        onError: onErrorDark,
        errorContainer: errorContainerDark,
        onErrorContainer: onErrorContainerDark,
        surface: surfaceDark,
        onSurface: onSurfaceDark,
        surfaceVariant: surfaceVariantDark,
        onSurfaceVariant: onSurfaceVariantDark,
        outline: outlineDark,
        outlineVariant: outlineVariantDark,
        background: backgroundDark,
        onBackground: onBackgroundDark,
      );

  // Light theme colors
  static const Color primary = Color(0xff7E57C2);
  static const Color onPrimary = Colors.white;
  static const Color primaryContainer = Color(0xffE5DEFF);
  static const Color onPrimaryContainer = Color(0xff1A0063);
  static const Color secondary = Color(0xff684FA4);
  static const Color onSecondary = Colors.white;
  static const Color secondaryContainer = Color(0xffE9DDFF);
  static const Color onSecondaryContainer = Color(0xff23005C);
  static const Color tertiary = Color(0xff006D37);
  static const Color onTertiary = Colors.white;
  static const Color tertiaryContainer = Color(0xff8CF9AA);
  static const Color onTertiaryContainer = Color(0xff00210C);
  static const Color error = Color(0xffB81749);
  static const Color onError = Colors.white;
  static const Color errorContainer = Color(0xffFFD9DD);
  static const Color onErrorContainer = Color(0xff400013);
  static const Color background = Color(0xffFEFBFF);
  static const Color onBackground = Color(0xff1B1B1F);
  static const Color surface = Color(0xffFEFBFF);
  static const Color onSurface = Color(0xff1B1B1F);
  static const Color surfaceVariant = Color(0xffE1E2EC);
  static const Color onSurfaceVariant = Color(0xff44474F);
  static const Color outline = Color(0xff74777F);
  static const Color outlineVariant = Color(0xffC4C6D0);

  // Dark theme colors
  static const Color primaryDark = Color(0xff7E57C2);
  static const Color onPrimaryDark = Color(0xffE5DEFF);
  static const Color primaryContainerDark = Color(0xff441CC8);
  static const Color onPrimaryContainerDark = Color(0xffE5DEFF);
  static const Color secondaryDark = Color(0xffF1C048);
  static const Color onSecondaryDark = Color(0xff3F2E00);
  static const Color secondaryContainerDark = Color(0xff5B4300);
  static const Color onSecondaryContainerDark = Color(0xffFFDF9B);
  static const Color tertiaryDark = Color(0xff70DC90);
  static const Color onTertiaryDark = Color(0xff00391A);
  static const Color tertiaryContainerDark = Color(0xff005228);
  static const Color onTertiaryContainerDark = Color(0xff8CF9AA);
  static const Color errorDark = Color(0xffFFB2BC);
  static const Color onErrorDark = Color(0xff670023);
  static const Color errorContainerDark = Color(0xff910035);
  static const Color onErrorContainerDark = Color(0xffFFD9DD);
  static const Color backgroundDark = Color(0xff1B1B1F);
  static const Color onBackgroundDark = Color(0xffE3E2E6);
  static const Color surfaceDark = Color(0xff1B1B1F);
  static const Color onSurfaceDark = Color(0xffC7C6CA);
  static const Color surfaceVariantDark = Color(0xff23262F);
  static const Color onSurfaceVariantDark = Color(0xffC4C6D0);
  static const Color outlineDark = Color(0xff8E9099);
  static const Color outlineVariantDark = Color(0xff44474F);

  // Extra
  static const neutralVariant20 = Color(0xFF2D3038);
}

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'size_constants.dart';
import 'typography.dart';

export 'colors.dart';
export 'size_constants.dart';
export 'typography.dart';

class AppTheme {
  static final buttonTextStyle = MaterialStatePropertyAll(
    AppTextStyle.bodyLarge.copyWith(
      fontWeight: FontWeight.bold,
    ),
  );

  // Shared sub theme data for light, darktheme.
  static FlexSubThemesData get _commonSubThemeData => FlexSubThemesData(
        buttonPadding: const EdgeInsets.symmetric(
          horizontal: kPadding * 2,
          vertical: 0,
        ),
        outlinedButtonBorderWidth: 1,
        elevatedButtonRadius: kButtonRadius,
        textButtonRadius: kButtonRadius,
        outlinedButtonRadius: kButtonRadius,
        inputDecoratorRadius: kButtonRadius,
        buttonMinSize: const Size(double.infinity, kButtonHeight),
        textButtonTextStyle: buttonTextStyle,
        outlinedButtonTextStyle: buttonTextStyle,
        textButtonSchemeColor: SchemeColor.primary,
        elevatedButtonTextStyle: buttonTextStyle,
        elevatedButtonSchemeColor: SchemeColor.onPrimary,
        elevatedButtonSecondarySchemeColor: SchemeColor.primary,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        outlinedButtonSchemeColor: SchemeColor.primary,
        checkboxSchemeColor: SchemeColor.primary,
        // inputDecoratorSchemeColor: SchemeColor.primary,
        inputDecoratorIsFilled: false,
        fabSchemeColor: SchemeColor.primary,
        chipSchemeColor: SchemeColor.primary,
        blendOnLevel: 0,
        blendOnColors: false,
        blendTextTheme: false,
        dialogRadius: kPadding * 1.25,
        bottomNavigationBarSelectedIconSize: kPadding * 3,
        bottomNavigationBarUnselectedIconSize: kPadding * 3,
      );

  static ThemeData get light {
    final theme = FlexThemeData.light(
      colorScheme: AppColors.lightColorScheme,
      textTheme: AppTextStyle.textTheme,
      primaryTextTheme: AppTextStyle.textTheme.apply(
        bodyColor: AppColors.onPrimary,
        displayColor: AppColors.onPrimary,
        decorationColor: AppColors.onPrimary,
      ),
      usedColors: 2,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 9,
      appBarStyle: FlexAppBarStyle.scaffoldBackground,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      subThemesData: _commonSubThemeData,
      scaffoldBackground: AppColors.surface,
    );

    return theme;
  }

  static ThemeData get dark {
    final colorScheme = AppColors.darkColorScheme;
    final theme = FlexThemeData.dark(
      colorScheme: colorScheme,
      applyElevationOverlayColor: true,
      textTheme: AppTextStyle.textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
        decorationColor: colorScheme.onSurface,
      ),
      primaryTextTheme: AppTextStyle.textTheme.apply(
        bodyColor: AppColors.onPrimaryDark,
        displayColor: AppColors.onPrimaryDark,
        decorationColor: AppColors.onPrimaryDark,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      surfaceMode: FlexSurfaceMode.level,
      subThemesData: _commonSubThemeData,
      scaffoldBackground: AppColors.surfaceDark,
      appBarStyle: FlexAppBarStyle.background,
    );
    return theme.copyWith(
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: theme.outlinedButtonTheme.style?.copyWith(
          side: MaterialStateProperty.all(
            BorderSide(
              color: colorScheme.outline,
              width: 1,
            ),
          ),
        ),
      ),
      focusColor: Colors.transparent,
      cardTheme: theme.cardTheme.copyWith(
        color: colorScheme.surfaceVariant,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kPadding * 1.25),
          side: BorderSide(
            color: colorScheme.outlineVariant,
            width: 1,
          ),
        ),
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: kPadding * 2,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kButtonRadius),
          borderSide: BorderSide(
            color: colorScheme.outlineVariant,
            width: 1,
          ),
        ),
        fillColor: colorScheme.surfaceVariant,
        floatingLabelStyle: TextStyle(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(
            kPadding * 5,
            kPadding * 5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kPadding * .75),
          ),
          side: BorderSide(
            color: colorScheme.outline,
            width: 1,
          ),
          foregroundColor: colorScheme.onSurfaceVariant,
        ),
      ),
      iconTheme: theme.iconTheme.copyWith(
        color: colorScheme.onSurface,
        size: kPadding * 2.25,
      ),
      chipTheme: theme.chipTheme.copyWith(
        labelStyle: theme.textTheme.titleSmall,
        side: BorderSide.none,
        backgroundColor: colorScheme.primaryContainer,
      ),
      colorScheme: theme.colorScheme.copyWith(
        surfaceVariant: colorScheme.surfaceVariant,
        onSurfaceVariant: colorScheme.onSurfaceVariant,
        surface: colorScheme.surface,
      ),
      switchTheme: theme.switchTheme.copyWith(
        trackColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.primary;
            } else {
              return colorScheme.surfaceVariant;
            }
          },
        ),
        thumbColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.onPrimary;
            } else {
              return colorScheme.outline;
            }
          },
        ),
      ),
    );
  }
}

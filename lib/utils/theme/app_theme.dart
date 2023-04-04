import 'package:flutter/material.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';
import 'package:super_sushi/utils/constants/colors_palette.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';

/// Theme of the application
class AppTheme {
  /// App light theme
  static ThemeData getTheme({bool isDark = false}) {
    return ThemeData(
      scaffoldBackgroundColor: ColorsPalette.white,
      splashColor: ColorsPalette.transparent,
      highlightColor: ColorsPalette.transparent,
      brightness: isDark ? Brightness.dark : Brightness.light,
      shadowColor: ColorsPalette.shadowColor,
      primaryColor: ColorsPalette.primaryColor,
      cardColor: ColorsPalette.cardColor,
      backgroundColor: ColorsPalette.backgroundColor,
      colorScheme: const ColorScheme.light(
        primary: ColorsPalette.secondPrimaryColor,
        secondary: ColorsPalette.secondaryColor,
      ),
      fontFamily: AppConstants.fontFamily,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: ColorsPalette.shadowColor,
        ),
        headlineMedium: TextStyle(
          color: ColorsPalette.white,
        ),
        headlineSmall: TextStyle(
          color: ColorsPalette.primaryColor,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          fontSize: MagicNumbers.FONT_SIZE_SMALL,
          fontWeight: FontWeight.w400,
          color: ColorsPalette.hint,
        ),
      ),
    );
  }
}
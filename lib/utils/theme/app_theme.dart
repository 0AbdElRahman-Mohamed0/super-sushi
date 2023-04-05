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
        displaySmall: TextStyle(
          color: ColorsPalette.hint,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:
              BorderRadius.circular(MagicNumbers.extraSmallBorderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:
              BorderRadius.circular(MagicNumbers.extraSmallBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:
              BorderRadius.circular(MagicNumbers.extraSmallBorderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:
              BorderRadius.circular(MagicNumbers.extraSmallBorderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:
              BorderRadius.circular(MagicNumbers.extraSmallBorderRadius),
        ),
        filled: true,
        fillColor: ColorsPalette.backgroundColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:
              BorderRadius.circular(MagicNumbers.extraSmallBorderRadius),
        ),
        hintStyle: TextStyle(
          fontSize: MagicNumbers.FONT_SIZE_SMALL,
          fontWeight: FontWeight.w400,
          color: ColorsPalette.hint,
        ),
      ),
    );
  }
}

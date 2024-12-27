// base/base_theme.dart
import 'package:flutter/material.dart';

class BaseTheme {
  static ThemeData baseTheme({
    required Color primaryColor,
    required Color backgroundColor,
    required Color backgroundSecondary,
    required bool isDarkMode,
  }) {
    return ThemeData(
      useMaterial3: false,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      dialogBackgroundColor: backgroundColor,
      highlightColor: primaryColor.withOpacity(0.5),
      dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: primaryColor,
          ),
          menuStyle: MenuStyle(
              backgroundColor: WidgetStateProperty.all(backgroundColor))),
      timePickerTheme: _timePickerTheme(
          primaryColor: primaryColor,
          backgroundColor: backgroundSecondary,
          backgroundSecondary: backgroundColor),
      dialogTheme: DialogTheme(
          backgroundColor: backgroundSecondary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      datePickerTheme: _datePickerTheme(
          primaryColor: primaryColor, backgroundColor: backgroundSecondary),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
      extensions: const [],
    );
  }

  static TimePickerThemeData _timePickerTheme(
      {required Color primaryColor,
      required Color backgroundColor,
      required Color backgroundSecondary}) {
    return TimePickerThemeData(
      backgroundColor: backgroundColor,
      dialHandColor: primaryColor,
      dayPeriodColor: primaryColor.withOpacity(0.4),
      hourMinuteColor: backgroundSecondary,
      dialBackgroundColor: backgroundSecondary,
      hourMinuteTextColor: primaryColor,
      dayPeriodTextColor: primaryColor,
      cancelButtonStyle: _buildButtonStyle(Colors.red),
      confirmButtonStyle: _buildButtonStyle(primaryColor),
      timeSelectorSeparatorColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.red;
        }
        return backgroundSecondary;
      }),
    );
  }

  static ButtonStyle _buildButtonStyle(Color color) {
    return ButtonStyle(foregroundColor: WidgetStatePropertyAll(color));
  }

  static DatePickerThemeData _datePickerTheme(
      {required Color primaryColor, required Color backgroundColor}) {
    return DatePickerThemeData(
        headerBackgroundColor: primaryColor,
        backgroundColor: backgroundColor,
        cancelButtonStyle: _buildButtonStyle(Colors.red),
        confirmButtonStyle: _buildButtonStyle(primaryColor),
        dayBackgroundColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return Colors.transparent;
        }),
        todayBackgroundColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return Colors.transparent;
        }),
        todayForegroundColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return primaryColor;
        }));
  }
}

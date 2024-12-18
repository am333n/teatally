import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color primary;
  final Color dynamicPrimary;
  final Color fontPrimary;
  final Color fontSecondary;
  final Color fontTertiary;
  final Color cardBackground;
  final Color success;
  final Color danger;
  final Color dividerColor;
  final Color formBorder;
  final Color cardHeading;
  final Color formBackground;

  const AppColorExtension(
      {required this.backgroundPrimary,
      required this.backgroundSecondary,
      required this.primary,
      required this.dynamicPrimary,
      required this.fontPrimary,
      required this.fontSecondary,
      required this.fontTertiary,
      required this.cardBackground,
      required this.success,
      required this.danger,
      required this.dividerColor,
      required this.formBorder,
      required this.cardHeading,
      required this.formBackground});

  @override
  AppColorExtension copyWith(
      {Color? backgroundPrimary,
      Color? backgroundSecondary,
      Color? primary,
      Color? fontPrimary,
      Color? fontSecondary,
      Color? cardBackground,
      Color? success,
      Color? danger,
      Color? formBorder,
      Color? dividerColor,
      Color? fontTertiary,
      Color? cardHeading,
      Color? dynamicPrimary,
      Color? formBackground}) {
    return AppColorExtension(
        backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
        backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
        primary: primary ?? this.primary,
        fontPrimary: fontPrimary ?? this.fontPrimary,
        fontSecondary: fontSecondary ?? this.fontSecondary,
        fontTertiary: fontTertiary ?? this.fontTertiary,
        cardBackground: cardBackground ?? this.cardBackground,
        dividerColor: dividerColor ?? this.dividerColor,
        formBorder: formBorder ?? this.formBorder,
        success: success ?? this.success,
        danger: danger ?? this.danger,
        dynamicPrimary: dynamicPrimary ?? this.dynamicPrimary,
        cardHeading: cardHeading ?? this.cardHeading,
        formBackground: formBackground ?? this.formBackground);
  }

  @override
  AppColorExtension lerp(ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) return this;
    return AppColorExtension(
      backgroundPrimary:
          Color.lerp(backgroundPrimary, other.backgroundPrimary, t)!,
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      fontPrimary: Color.lerp(fontPrimary, other.fontPrimary, t)!,
      fontSecondary: Color.lerp(fontSecondary, other.fontSecondary, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      success: Color.lerp(success, other.success, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      fontTertiary: Color.lerp(fontTertiary, other.fontTertiary, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      formBorder: Color.lerp(formBorder, other.formBorder, t)!,
      dynamicPrimary: Color.lerp(dynamicPrimary, other.dynamicPrimary, t)!,
      cardHeading: Color.lerp(cardHeading, other.cardHeading, t)!,
      formBackground: Color.lerp(formBackground, other.formBackground, t)!,
    );
  }
}

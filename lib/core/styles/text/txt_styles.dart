import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';

// class TxtStyles extends ThemeExtension<TxtStyles> {
//   final TextStyle bodyLRegular;
//   final TextStyle bodyLSemiBold;
//   final TextStyle bodyLBold;
//   final TextStyle bodyMRegular;
//   final TextStyle bodyMSemiBold;
//   final TextStyle bodyMBold;
//   final TextStyle bodySRegular;
//   final TextStyle bodySSemiBold;
//   final TextStyle bodySBold;
//   // Headers
//   final TextStyle headerXSRegular;
//   final TextStyle headerXSSemiBold;
//   final TextStyle headerXSBold;
//   final TextStyle headerSRegular;
//   final TextStyle headerSSemiBold;
//   final TextStyle headerSBold;
//   final TextStyle headerMRegular;
//   final TextStyle headerMSemiBold;
//   final TextStyle headerMBold;
//   final TextStyle headerLRegular;
//   final TextStyle headerLSemiBold;
//   final TextStyle headerLBold;
//   // Labels
//   final TextStyle labelLRegular;
//   final TextStyle labelLSemiBold;
//   final TextStyle labelLBold;
//   final TextStyle labelSRegular;
//   final TextStyle labelSSemiBold;
//   final TextStyle labelSBold;

//   const TxtStyles({
//     required this.bodyLRegular,
//     required this.bodyLSemiBold,
//     required this.bodyLBold,
//     required this.bodyMRegular,
//     required this.bodyMSemiBold,
//     required this.bodyMBold,
//     required this.bodySRegular,
//     required this.bodySSemiBold,
//     required this.bodySBold,
//     required this.headerXSRegular,
//     required this.headerXSSemiBold,
//     required this.headerXSBold,
//     required this.headerSRegular,
//     required this.headerSSemiBold,
//     required this.headerSBold,
//     required this.headerMRegular,
//     required this.headerMSemiBold,
//     required this.headerMBold,
//     required this.headerLRegular,
//     required this.headerLSemiBold,
//     required this.headerLBold,
//     required this.labelLRegular,
//     required this.labelLSemiBold,
//     required this.labelLBold,
//     required this.labelSRegular,
//     required this.labelSSemiBold,
//     required this.labelSBold,
//   });

//   // CopyWith implementation
//   @override
//   TxtStyles copyWith({
//     TextStyle? bodyLRegular,
//     TextStyle? bodyLSemiBold,
//     TextStyle? bodyLBold,
//     TextStyle? bodyMRegular,
//     TextStyle? bodyMSemiBold,
//     TextStyle? bodyMBold,
//     TextStyle? bodySRegular,
//     TextStyle? bodySSemiBold,
//     TextStyle? bodySBold,
//     TextStyle? headerXSRegular,
//     TextStyle? headerXSSemiBold,
//     TextStyle? headerXSBold,
//     TextStyle? headerSRegular,
//     TextStyle? headerSSemiBold,
//     TextStyle? headerSBold,
//     TextStyle? headerMRegular,
//     TextStyle? headerMSemiBold,
//     TextStyle? headerMBold,
//     TextStyle? headerLRegular,
//     TextStyle? headerLSemiBold,
//     TextStyle? headerLBold,
//     TextStyle? labelLRegular,
//     TextStyle? labelLSemiBold,
//     TextStyle? labelLBold,
//     TextStyle? labelSRegular,
//     TextStyle? labelSSemiBold,
//     TextStyle? labelSBold,
//   }) {
//     return TxtStyles(
//       bodyLRegular: bodyLRegular ?? this.bodyLRegular,
//       bodyLSemiBold: bodyLSemiBold ?? this.bodyLSemiBold,
//       bodyLBold: bodyLBold ?? this.bodyLBold,
//       bodyMRegular: bodyMRegular ?? this.bodyMRegular,
//       bodyMSemiBold: bodyMSemiBold ?? this.bodyMSemiBold,
//       bodyMBold: bodyMBold ?? this.bodyMBold,
//       bodySRegular: bodySRegular ?? this.bodySRegular,
//       bodySSemiBold: bodySSemiBold ?? this.bodySSemiBold,
//       bodySBold: bodySBold ?? this.bodySBold,
//       headerXSRegular: headerXSRegular ?? this.headerXSRegular,
//       headerXSSemiBold: headerXSSemiBold ?? this.headerXSSemiBold,
//       headerXSBold: headerXSBold ?? this.headerXSBold,
//       headerSRegular: headerSRegular ?? this.headerSRegular,
//       headerSSemiBold: headerSSemiBold ?? this.headerSSemiBold,
//       headerSBold: headerSBold ?? this.headerSBold,
//       headerMRegular: headerMRegular ?? this.headerMRegular,
//       headerMSemiBold: headerMSemiBold ?? this.headerMSemiBold,
//       headerMBold: headerMBold ?? this.headerMBold,
//       headerLRegular: headerLRegular ?? this.headerLRegular,
//       headerLSemiBold: headerLSemiBold ?? this.headerLSemiBold,
//       headerLBold: headerLBold ?? this.headerLBold,
//       labelLRegular: labelLRegular ?? this.labelLRegular,
//       labelLSemiBold: labelLSemiBold ?? this.labelLSemiBold,
//       labelLBold: labelLBold ?? this.labelLBold,
//       labelSRegular: labelSRegular ?? this.labelSRegular,
//       labelSSemiBold: labelSSemiBold ?? this.labelSSemiBold,
//       labelSBold: labelSBold ?? this.labelSBold,
//     );
//   }

//   // Lerp implementation
//   @override
//   TxtStyles lerp(ThemeExtension<TxtStyles>? other, double t) {
//     if (other is! TxtStyles) return this;

//     return TxtStyles(
//       bodyLRegular: TextStyle.lerp(bodyLRegular, other.bodyLRegular, t)!,
//       bodyLSemiBold: TextStyle.lerp(bodyLSemiBold, other.bodyLSemiBold, t)!,
//       bodyLBold: TextStyle.lerp(bodyLBold, other.bodyLBold, t)!,
//       bodyMRegular: TextStyle.lerp(bodyMRegular, other.bodyMRegular, t)!,
//       bodyMSemiBold: TextStyle.lerp(bodyMSemiBold, other.bodyMSemiBold, t)!,
//       bodyMBold: TextStyle.lerp(bodyMBold, other.bodyMBold, t)!,
//       bodySRegular: TextStyle.lerp(bodySRegular, other.bodySRegular, t)!,
//       bodySSemiBold: TextStyle.lerp(bodySSemiBold, other.bodySSemiBold, t)!,
//       bodySBold: TextStyle.lerp(bodySBold, other.bodySBold, t)!,
//       headerXSRegular:
//           TextStyle.lerp(headerXSRegular, other.headerXSRegular, t)!,
//       headerXSSemiBold:
//           TextStyle.lerp(headerXSSemiBold, other.headerXSSemiBold, t)!,
//       headerXSBold: TextStyle.lerp(headerXSBold, other.headerXSBold, t)!,
//       headerSRegular: TextStyle.lerp(headerSRegular, other.headerSRegular, t)!,
//       headerSSemiBold:
//           TextStyle.lerp(headerSSemiBold, other.headerSSemiBold, t)!,
//       headerSBold: TextStyle.lerp(headerSBold, other.headerSBold, t)!,
//       headerMRegular: TextStyle.lerp(headerMRegular, other.headerMRegular, t)!,
//       headerMSemiBold:
//           TextStyle.lerp(headerMSemiBold, other.headerMSemiBold, t)!,
//       headerMBold: TextStyle.lerp(headerMBold, other.headerMBold, t)!,
//       headerLRegular: TextStyle.lerp(headerLRegular, other.headerLRegular, t)!,
//       headerLSemiBold:
//           TextStyle.lerp(headerLSemiBold, other.headerLSemiBold, t)!,
//       headerLBold: TextStyle.lerp(headerLBold, other.headerLBold, t)!,
//       labelLRegular: TextStyle.lerp(labelLRegular, other.labelLRegular, t)!,
//       labelLSemiBold: TextStyle.lerp(labelLSemiBold, other.labelLSemiBold, t)!,
//       labelLBold: TextStyle.lerp(labelLBold, other.labelLBold, t)!,
//       labelSRegular: TextStyle.lerp(labelSRegular, other.labelSRegular, t)!,
//       labelSSemiBold: TextStyle.lerp(labelSSemiBold, other.labelSSemiBold, t)!,
//       labelSBold: TextStyle.lerp(labelSBold, other.labelSBold, t)!,
//     );
//   }
// }

// extension TxtStylesExtension on ThemeData {
//   TxtStyles get txtStyles {
//     // Ensure the TxtStyles is available in your theme
//     final txtStyles = extension<TxtStyles>();
//     if (txtStyles == null) {
//       throw Exception('TxtStyles not found in the current theme');
//     }
//     return txtStyles;
//   }
// }

// class CustomTextStyles {
//   final Color primaryColor;
//   final FontSize fontSize;

//   CustomTextStyles(this.primaryColor, this.fontSize);

//   // Modify this to be static so it can be used in the static getTextStyles
//   static TextStyle getBaseTextStyle(Color primaryColor, FontSize fontSize,
//       double size, FontWeight fontWeight) {
//     return TextStyle(
//         color: primaryColor,
//         fontSize: size * _getFontScale(fontSize),
//         fontWeight: fontWeight,
//         fontFamily: 'opensans');
//   }

//   // This helper method should also be static
//   static double _getFontScale(FontSize fontSize) {
//     switch (fontSize) {
//       case FontSize.small:
//         return 0.8;
//       case FontSize.regular:
//         return 1;
//       case FontSize.large:
//         return 1.2;
//       default:
//         return 1;
//     }
//   }

//   // Now you can pass primaryColor and fontSize as arguments
//   static TxtStyles getTextStyles(Color primaryColor, FontSize fontSize) {
//     return TxtStyles(
//       bodyLRegular:
//           getBaseTextStyle(primaryColor, fontSize, 12.0, FontWeight.normal),
//       bodyLSemiBold:
//           getBaseTextStyle(primaryColor, fontSize, 12.0, FontWeight.w600),
//       bodyLBold:
//           getBaseTextStyle(primaryColor, fontSize, 12.0, FontWeight.bold),
//       bodyMRegular:
//           getBaseTextStyle(primaryColor, fontSize, 16.0, FontWeight.normal),
//       bodyMSemiBold:
//           getBaseTextStyle(primaryColor, fontSize, 16.0, FontWeight.w600),
//       bodyMBold:
//           getBaseTextStyle(primaryColor, fontSize, 16.0, FontWeight.bold),
//       bodySRegular:
//           getBaseTextStyle(primaryColor, fontSize, 10.0, FontWeight.normal),
//       bodySSemiBold:
//           getBaseTextStyle(primaryColor, fontSize, 10.0, FontWeight.w600),
//       bodySBold:
//           getBaseTextStyle(primaryColor, fontSize, 10.0, FontWeight.bold),
//       headerXSRegular:
//           getBaseTextStyle(primaryColor, fontSize, 8.0, FontWeight.normal),
//       headerXSSemiBold:
//           getBaseTextStyle(primaryColor, fontSize, 8.0, FontWeight.w600),
//       headerXSBold:
//           getBaseTextStyle(primaryColor, fontSize, 8.0, FontWeight.bold),
//       headerSRegular:
//           getBaseTextStyle(primaryColor, fontSize, 14.0, FontWeight.normal),
//       headerSSemiBold:
//           getBaseTextStyle(primaryColor, fontSize, 14.0, FontWeight.w600),
//       headerSBold:
//           getBaseTextStyle(primaryColor, fontSize, 14.0, FontWeight.bold),
//       headerMRegular:
//           getBaseTextStyle(primaryColor, fontSize, 18.0, FontWeight.normal),
//       headerMSemiBold:
//           getBaseTextStyle(primaryColor, fontSize, 18.0, FontWeight.w600),
//       headerMBold:
//           getBaseTextStyle(primaryColor, fontSize, 18.0, FontWeight.bold),
//       headerLRegular:
//           getBaseTextStyle(primaryColor, fontSize, 22.0, FontWeight.normal),
//       headerLSemiBold:
//           getBaseTextStyle(primaryColor, fontSize, 22.0, FontWeight.w600),
//       headerLBold:
//           getBaseTextStyle(primaryColor, fontSize, 22.0, FontWeight.bold),
//       labelLRegular:
//           getBaseTextStyle(primaryColor, fontSize, 12.0, FontWeight.normal),
//       labelLSemiBold:
//           getBaseTextStyle(primaryColor, fontSize, 12.0, FontWeight.w600),
//       labelLBold:
//           getBaseTextStyle(primaryColor, fontSize, 12.0, FontWeight.bold),
//       labelSRegular:
//           getBaseTextStyle(primaryColor, fontSize, 10.0, FontWeight.normal),
//       labelSSemiBold:
//           getBaseTextStyle(primaryColor, fontSize, 10.0, FontWeight.w600),
//       labelSBold:
//           getBaseTextStyle(primaryColor, fontSize, 10.0, FontWeight.bold),
//     );
//   }
// }

enum FontSize { regular, small, large }

class FontSpecifications {
  final double sizeNormal;
  final double sizeLarge;
  final double sizeSmall;
  final FontWeight fontWeight;

  FontSpecifications(
    this.sizeNormal,
    this.sizeLarge,
    this.sizeSmall,
    this.fontWeight,
  );
}

class TextStyles {
  //fontWeights
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight regular = FontWeight.w400;

  static final Map<TxtStyle, FontSpecifications> _fonts = {
    TxtStyle.bodyLRegular: FontSpecifications(14, 16, 12, regular),
    TxtStyle.bodyLSemiBold: FontSpecifications(14, 16, 12, semiBold),
    TxtStyle.bodyLBold: FontSpecifications(14, 16, 12, bold),
    TxtStyle.bodyMRegular: FontSpecifications(12, 14, 10, regular),
    TxtStyle.bodyMSemiBold: FontSpecifications(12, 14, 10, semiBold),
    TxtStyle.bodyMBold: FontSpecifications(12, 14, 10, bold),
    TxtStyle.bodySRegular: FontSpecifications(10, 12, 8, regular),
    TxtStyle.bodySSemiBold: FontSpecifications(10, 12, 8, semiBold),
    TxtStyle.bodySBold: FontSpecifications(10, 12, 8, bold),
    TxtStyle.headerXSRegular: FontSpecifications(16, 18, 14, regular),
    TxtStyle.headerXSSemiBold: FontSpecifications(16, 18, 14, semiBold),
    TxtStyle.headerXSBold: FontSpecifications(16, 18, 14, bold),
    TxtStyle.headerSRegular: FontSpecifications(20, 22, 18, regular),
    TxtStyle.headerSSemiBold: FontSpecifications(20, 22, 18, semiBold),
    TxtStyle.headerSBold: FontSpecifications(20, 22, 18, bold),
    TxtStyle.headerMRegular: FontSpecifications(22, 24, 20, regular),
    TxtStyle.headerMSemiBold: FontSpecifications(22, 24, 20, semiBold),
    TxtStyle.headerMBold: FontSpecifications(22, 24, 20, bold),
    TxtStyle.headerLRegular: FontSpecifications(34, 36, 32, regular),
    TxtStyle.headerLSemiBold: FontSpecifications(34, 36, 32, semiBold),
    TxtStyle.headerLBold: FontSpecifications(34, 36, 32, bold),
    TxtStyle.labelLRegular: FontSpecifications(10, 12, 8, regular),
    TxtStyle.labelLSemiBold: FontSpecifications(10, 12, 8, semiBold),
    TxtStyle.labelLBold: FontSpecifications(10, 12, 8, bold),
    TxtStyle.labelSRegular: FontSpecifications(8, 10, 6, regular),
    TxtStyle.labelSSemiBold: FontSpecifications(8, 10, 6, semiBold),
    TxtStyle.labelSBold: FontSpecifications(8, 10, 6, bold),
  };

  static TextStyle getTextStyle(BuildContext context, TxtStyle style,
      {double? letterSpacing,
      Color? color,
      TextOverflow? overflow,
      FontStyle? fontStyle}) {
    FontSize currentFontSize = FontSize.regular;
    FontSpecifications fontSpec = _fonts[style]!;

    double adjustedFontSize = getFontSize(currentFontSize, fontSpec);

    return customTextStyle(
      fontSize: adjustedFontSize,
      fontWeight: fontSpec.fontWeight,
      letterSpacing: letterSpacing,
      color: color ?? getFontColor(fontStyle, context),
      overflow: overflow,
    );
  }

  static double getFontSize(
      FontSize currentFontSize, FontSpecifications fontSpec) {
    switch (currentFontSize) {
      case FontSize.regular:
        return fontSpec.sizeNormal;
      case FontSize.large:
        return fontSpec.sizeLarge;
      case FontSize.small:
        return fontSpec.sizeNormal;
      default:
        return fontSpec.sizeNormal;
    }
  }

  static Color? getFontColor(FontStyle? fontStyle, BuildContext context) {
    switch (fontStyle) {
      case FontStyle.primary:
        return context.theme.appColors.fontPrimary;
      case FontStyle.secondary:
        return context.theme.appColors.fontSecondary;
      case FontStyle.territiary:
        return context.theme.appColors.fontSecondary;
      default:
        return context.theme.appColors.fontPrimary;
    }
  }

  static TextStyle customTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    TextOverflow? overflow,
  }) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'opensans',
        letterSpacing: letterSpacing);
  }
}

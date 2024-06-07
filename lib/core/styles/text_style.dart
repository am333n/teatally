// Project imports:

import 'package:flutter/material.dart';

import 'package:teatally/core/styles/text_widget.dart';

class TextStyles {
  static const Map<TxtStyle, double> _fontSizeMap = {
    TxtStyle.bodyHeadingBold: 23.0,
    TxtStyle.bodyHeadingNormal: 23.0,
    TxtStyle.bodyHeadingThin: 23.0,
    TxtStyle.bodyMainHeading: 26.0,
    TxtStyle.appHeading: 32.0,
    TxtStyle.appHeadingSemiBold: 32.0,
    TxtStyle.appHeadingBold: 32.0,
    TxtStyle.appSubHeading: 18.0,
    TxtStyle.alertTitle: 35.0,
    TxtStyle.alertSubtitle: 16.0,
    TxtStyle.alertLabel: 8.0,
    TxtStyle.bodyNormal: 14.0,
    TxtStyle.bodyBold: 14.0,
    TxtStyle.bodySemiBold: 14.0,
    TxtStyle.bodyThin: 14.0,
    TxtStyle.bodySubTextSemiThin: 12.0,
    TxtStyle.bodySubText: 12.0,
    TxtStyle.bodySubTextBold: 12.0,
    TxtStyle.bodySubTextThin: 12.0,
    TxtStyle.labelNormal: 9.0,
    TxtStyle.labelThin: 10.0,
    TxtStyle.labelBold: 10.0,
    TxtStyle.statusLabel: 11.0,
    TxtStyle.statusLabelSemiBold: 11.0,
    TxtStyle.btnTextNormal: 14.0,
    TxtStyle.btnTextBold: 15.0,
  };

  static const Map<TxtStyle, FontWeight> _fontWeightMap = {
    TxtStyle.bodyHeadingBold: FontWeight.w700,
    TxtStyle.bodyHeadingNormal: FontWeight.w500,
    TxtStyle.bodyMainHeading: FontWeight.w500,
    TxtStyle.bodyHeadingThin: FontWeight.w300,
    TxtStyle.appHeading: FontWeight.w300,
    TxtStyle.appHeadingSemiBold: FontWeight.w400,
    TxtStyle.appHeadingBold: FontWeight.w500,
    TxtStyle.appSubHeading: FontWeight.w500,
    TxtStyle.alertTitle: FontWeight.w700,
    TxtStyle.alertSubtitle: FontWeight.w500,
    TxtStyle.alertLabel: FontWeight.w400,
    TxtStyle.bodyThin: FontWeight.w300,
    TxtStyle.bodyNormal: FontWeight.w400,
    TxtStyle.bodySemiBold: FontWeight.w500,
    TxtStyle.bodyBold: FontWeight.w600,
    TxtStyle.bodySubText: FontWeight.w500,
    TxtStyle.bodySubTextBold: FontWeight.w600,
    TxtStyle.bodySubTextThin: FontWeight.w300,
    TxtStyle.bodySubTextSemiThin: FontWeight.w400,
    TxtStyle.labelThin: FontWeight.w300,
    TxtStyle.labelNormal: FontWeight.w400,
    TxtStyle.labelBold: FontWeight.w500,
    TxtStyle.statusLabel: FontWeight.w400,
    TxtStyle.statusLabelSemiBold: FontWeight.w500,
    TxtStyle.btnTextNormal: FontWeight.w600,
    TxtStyle.btnTextBold: FontWeight.w700,
  };

  static TextStyle getTextStyle(BuildContext context, TxtStyle style,
      {double? letterSpacing, Color? color, TextOverflow? overflow}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double divisor =
        MediaQuery.of(context).orientation == Orientation.landscape ? 620 : 340;
    double fontSizeMultiplier = screenWidth / divisor;

    double adjustedFontSize =
        _fontSizeMap[style]! * fontSizeMultiplier; // Non-null assertion used

    return customTextStyle(
      fontSize: adjustedFontSize,
      fontWeight: _fontWeightMap[style]!,
      letterSpacing: letterSpacing,
      color: color ?? Colors.black87,
      overflow: overflow,
    );
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
        letterSpacing: letterSpacing);
  }
}

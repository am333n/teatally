// Flutter imports:

import 'package:flutter/material.dart';
import 'package:teatally/core/styles/text_style.dart';

// Package imports:

enum TxtStyle {
  bodyHeadingBold,
  bodyHeadingNormal,
  bodyMainHeading,
  bodyHeadingThin,
  appHeading,
  appHeadingSemiBold,
  appHeadingBold,
  appSubHeading,
  alertTitle,
  alertSubtitle,
  alertLabel,
  bodyBold,
  bodyNormal,
  bodyThin,
  bodySubText,
  bodySubTextThin,
  bodySubTextBold,
  bodySubTextSemiThin,
  bodySemiBold,
  labelThin,
  labelNormal,
  labelBold,
  statusLabel,
  statusLabelSemiBold,
  btnTextNormal,
  btnTextBold,
}

class Txt extends StatelessWidget {
  final double? width;
  final double? height;
  final double? letterSpacing;
  final String text;
  final TxtStyle style;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;
  final TextOverflow overflow;

  const Txt(
    this.text, {
    super.key,
    this.style = TxtStyle.bodyNormal,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.width,
    this.height,
    this.maxLines,
    this.letterSpacing = 0,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyles.getTextStyle(context, style,
        letterSpacing: letterSpacing, color: color, overflow: overflow);

    return SizedBox(
      width: width,
      height: height,
      child: Text(
        text,
        textAlign: textAlign,
        softWrap: true,
        maxLines: maxLines,
        style: textStyle,
        overflow: overflow,
      ),
    );
  }
}

TextSpan txtSpan(BuildContext context,
    {String? text, TxtStyle style = TxtStyle.bodyNormal, Color? color}) {
  return TextSpan(
    text: text,
    style: TextStyles.getTextStyle(context, style, color: color),
  );
}

class FontFamily {
  static String defaultFont = "opensans";
}

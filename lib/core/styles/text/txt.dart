import 'package:flutter/material.dart';
import 'package:teatally/core/styles/text/txt_styles.dart';

class Txt extends StatelessWidget {
  final double? width;
  final double? height;
  final FontStyle fontStyle;
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
    this.style = TxtStyle.bodyLRegular,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.width,
    this.height,
    this.maxLines,
    this.letterSpacing = 0,
    this.textAlign,
    this.fontStyle = FontStyle.primary,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyles.getTextStyle(context, style,
        letterSpacing: letterSpacing,
        color: color,
        overflow: overflow,
        fontStyle: fontStyle);

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

enum FontStyle { primary, secondary, territiary }

TextSpan txtSpan(BuildContext context,
    {String? text, TxtStyle style = TxtStyle.bodyLRegular}) {
  return TextSpan(
    text: text,
    style: TextStyles.getTextStyle(
      context,
      style,
    ),
  );
}

class FontFamily {
  static String defaultFont = "opensans";
}

enum TxtStyle {
  bodyLRegular,
  bodyLSemiBold,
  bodyLBold,
  bodyMRegular,
  bodyMSemiBold,
  bodyMBold,
  bodySRegular,
  bodySSemiBold,
  bodySBold,
  headerXSRegular,
  headerXSSemiBold,
  headerXSBold,
  headerSRegular,
  headerSSemiBold,
  headerSBold,
  headerMRegular,
  headerMSemiBold,
  headerMBold,
  headerLRegular,
  headerLSemiBold,
  headerLBold,
  labelLRegular,
  labelLSemiBold,
  labelLBold,
  labelSRegular,
  labelSSemiBold,
  labelSBold,
}

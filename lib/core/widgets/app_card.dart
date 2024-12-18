// Flutter imports:
import 'package:flutter/material.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';

class AppCardWithTitle extends StatelessWidget {
  const AppCardWithTitle({
    super.key,
    required this.title,
    required this.children,
    this.action,
    this.padding = const EdgeInsets.all(15),
    this.margin,
    this.infoWidget,
    this.visible = true,
    this.borderRadius = 15,
    this.foregroundColor,
  });
  final String title;
  final Widget? action;
  final Widget? infoWidget;
  final EdgeInsets padding;
  final double borderRadius;
  final Color? foregroundColor;
  final EdgeInsets? margin;
  final bool visible;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.doShowChildWidget(
      condition: visible,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
            color: context.theme.appColors.cardBackground),
        child: Column(
          children: [
            CommonWidgets.titleBar(
              context,
              action: action,
              color: foregroundColor,
              title: title,
              infoWidget: infoWidget,
              borderRadius: borderRadius,
              visible: title.isNotEmpty,
            ),
            Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            )
          ],
        ),
      ),
    );
  }
}

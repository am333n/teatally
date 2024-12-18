// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/styles/text/txt_styles.dart';
import 'package:teatally/core/theme/application/cubit/theme_cubit.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/theme/presentation/theme_builder.dart';

class CommonWidgets {
  static SizedBox verticalSpacing(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Txt headerSSemiBoldText(text) {
    return Txt(text, style: TxtStyle.headerSSemiBold);
  }

  static Widget coloredTextButton(
    BuildContext context, {
    required String text,
    double? width,
    double? height,
    Widget? leading,
    bool isLoading = false,
    Color? backgroundColor,
    double buttonPadding = 15,
    required Function() onPressed,
  }) {
    final color = backgroundColor ?? context.theme.appColors.primary;
    final splash = context.theme.appColors.backgroundPrimary;

    return AnimatedContainer(
      duration:
          const Duration(milliseconds: 300), // Duration for color animation
      curve: Curves.easeInOut, // Smooth curve for animation
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: color, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: splash.withOpacity(0.4),
          highlightColor: splash.withOpacity(0.2),
          borderRadius:
              BorderRadius.circular(5), // Match borderRadius of the decoration
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.all(buttonPadding),
            height: height,
            width: width,
            child: AnimatedSwitcher(
              duration:
                  const Duration(milliseconds: 250), // Animation for content
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Center(
                key: ValueKey(
                    isLoading ? "loading" : text), // Unique key for animation
                child: isLoading
                    ? const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (leading != null) leading,
                          Txt(
                            text,
                            key: ValueKey(text), // Unique key for text changes
                            textAlign: TextAlign.center,
                            style: TxtStyle.bodyLSemiBold,
                            color: Colors.white,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget borderColoredTextButton(BuildContext context,
      {required String text,
      Color? borderColor, //border and text have same color
      required Function() onPressed}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          splashColor: borderColor?.withOpacity(0.4) ??
              context.theme.appColors.danger.withOpacity(0.4),
          highlightColor: borderColor?.withOpacity(0.2) ??
              context.theme.appColors.danger.withOpacity(0.2),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(
                    color: borderColor ?? activeTheme().appColors.danger,
                    width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Txt(
              text,
              style: TxtStyle.bodyLSemiBold,
              color: borderColor ?? activeTheme().appColors.danger,
            )),
          )),
    );
  }

  static Future<dynamic> showModalBottomSheetWidget(
      {required BuildContext context, required Widget child}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: FractionallySizedBox(
            child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    decoration: BoxDecoration(
                      color: context.theme.appColors.backgroundSecondary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                    child: child)),
          ),
        );
      },
    );
  }

  static Visibility titleBar(BuildContext context,
      {bool visible = true,
      double borderRadius = 15,
      String? title,
      Color? color,
      Widget? infoWidget,
      Widget? action}) {
    return Visibility(
      visible: visible,
      child: Container(
        decoration: BoxDecoration(
            color: color ?? context.theme.appColors.cardHeading,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                child: Txt(title ?? "", style: TxtStyle.headerXSSemiBold),
              ),
              if (infoWidget != null) infoWidget,
            ]),
            action ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  static Row formActionButton(
    BuildContext context, {
    required Size size,
    required String button1Name,
    required Function() button1Action,
    required String button2Name,
    required Function() button2Action,
  }) {
    return Row(
      children: [
        Expanded(
          child: CommonWidgets.borderColoredTextButton(
            context,
            text: button1Name,
            onPressed: button1Action,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: CommonWidgets.coloredTextButton(context,
              text: button2Name,
              width: size.width / 2.5,
              onPressed: button2Action),
        ),
      ],
    );
  }

  static Widget iconHeadedText(BuildContext context,
      {required Widget icon,
      required String? text,
      bool isTextTappable = false,
      bool multiLine = false,
      bool isVisible = true,
      EdgeInsetsGeometry? padding,
      Function()? onTextClicked}) {
    return Visibility(
      visible: isVisible && text != null && text.isNotEmpty,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: InkWell(
          onTap: onTextClicked,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: multiLine
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 16,
                child: icon,
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: Text(text ?? "",
                    style: TextStyles.getTextStyle(
                            context, TxtStyle.bodyMSemiBold,
                            color: isTextTappable
                                ? context.theme.appColors.primary
                                : context.theme.appColors.fontPrimary)
                        .copyWith(
                            decoration: isTextTappable
                                ? TextDecoration.underline
                                : TextDecoration.none)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static SizedBox scrollBarContainer(BuildContext context,
      {required List<String> filterList,
      required Widget child,
      double? height}) {
    return SizedBox(
      height: height,
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(context.theme.appColors.primary),
        ),
        child: Scrollbar(radius: const Radius.circular(12), child: child),
      ),
    );
  }

  static Future<dynamic> showIOSAlertBox(
    BuildContext context, {
    required String title,
    required String subTitle,
    String? cancelCaseButtonTitle = "Cancel",
    String? confirmCaseButtonTitle = "Confirm",
    bool singleButton = false,
    Function(BuildContext ctxt)? cancelCaseButtonOnPressed,
    Function(BuildContext ctxt)? confirmCaseButtonOnPressed,
  }) {
    return showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Txt(
              title,
              style: TxtStyle.headerXSSemiBold,
            ),
            content: Text(subTitle),
            actions: <Widget>[
              if (!singleButton)
                CupertinoDialogAction(
                  onPressed: () {
                    if (cancelCaseButtonOnPressed == null) return;
                    cancelCaseButtonOnPressed(context);
                  },
                  child: Txt(cancelCaseButtonTitle?.toUpperCase() ?? "",
                      style: TxtStyle.bodyLBold,
                      color: context.theme.appColors.danger),
                ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  if (confirmCaseButtonOnPressed == null) return;
                  confirmCaseButtonOnPressed(context);
                },
                child: Txt(confirmCaseButtonTitle?.toUpperCase() ?? "",
                    style: TxtStyle.bodyLBold,
                    color: context.theme.appColors.primary),
              ),
            ],
          );
        });
  }

  static Align errorWidget(BuildContext context,
      {required String message, Function()? onPressed}) {
    return Align(
      heightFactor: 1.5,
      child: Column(
        children: [
          Image.asset("assets/images/no_network.png"),
          CommonWidgets.verticalSpacing(30),
          const Txt("Something Went Wrong", style: TxtStyle.headerMBold),
          CommonWidgets.verticalSpacing(5),
          Txt(
            message,
            style: TxtStyle.bodyLSemiBold,
            fontStyle: FontStyle.secondary,
          ),
          CommonWidgets.verticalSpacing(15),
          CommonWidgets.doShowChildWidget(
            condition: onPressed != null,
            child: SizedBox(
              width: 180,
              child: CommonWidgets.borderColoredTextButton(context,
                  text: "TRY AGAIN",
                  onPressed: onPressed ?? () {},
                  borderColor: context.theme.appColors.primary),
            ),
          )
        ],
      ),
    );
  }

  static Widget noScheduleWidget() {
    return Align(
      heightFactor: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ThemeBuilder(
              defaultTheme: (context) => Image.asset(
                "assets/images/no_schedules.png",
              ),
              greenTheme: (context) => Image.asset(
                "assets/images/noschedule_green.png",
              ),
              blueTheme: (context) => Image.asset(
                "assets/images/noschedule_blue.png",
              ),
              purpleTheme: (context) => Image.asset(
                "assets/images/noschedule_violet.png",
              ),
            ),
            CommonWidgets.verticalSpacing(30),
            const Txt("No Schedules For You", style: TxtStyle.headerMBold),
            CommonWidgets.verticalSpacing(5),
          ],
        ),
      ),
    );
  }

  static Widget iconButton({
    required void Function()? onPressed,
    required Widget icon,
    String? tooltip,
    Color? color,
  }) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: IconButton(
        splashColor: color?.withOpacity(0.5),
        highlightColor: color?.withOpacity(0.2),
        onPressed: onPressed,
        tooltip: tooltip,
        icon: icon,
      ),
    );
  }

  static Align showCircularProgressIndicator() {
    return const Align(
      heightFactor: 15,
      child: CircularProgressIndicator.adaptive(),
    );
  }

  static Widget borderIconButton(BuildContext context,
      {required VoidCallback onPressed,
      required Widget icon,
      double? borderWidth,
      Color? color,
      String? tooltip}) {
    final primaryColor = context.theme.appColors.primary;
    return Material(
      color: Colors.transparent,
      child: Tooltip(
        message: tooltip ?? '',
        child: InkWell(
          splashColor: color?.withOpacity(0.5) ?? primaryColor.withOpacity(0.5),
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: color ?? primaryColor, width: borderWidth ?? 2),
                borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(3),
            child: icon,
          ),
        ),
      ),
    );
  }

  static Widget statusBadge(
    BuildContext context, {
    required String status,
    bool rightAligned = true,
    BorderRadius borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(4),
      bottomLeft: Radius.circular(4),
    ),
  }) {
    bool isCompletedOrCancelled =
        status == "COMPLETED" || status == "CANCELLED";
    bool isCancelled = status.isEmpty;

    return CommonWidgets.doShowChildWidget(
      condition: !isCancelled,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceInOut,
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        decoration: BoxDecoration(
          color: isCompletedOrCancelled
              ? context.theme.appColors.danger.withOpacity(0.2)
              : context.theme.appColors.success.withOpacity(0.2),
          borderRadius: rightAligned
              ? borderRadius
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Txt(
            status.toUpperCase(),
            key: ValueKey<String>(status), // Use status as the key for switcher
            style: TxtStyle.bodySSemiBold,
            color: isCompletedOrCancelled
                ? context.theme.appColors.danger
                : context.theme.appColors.success,
          ),
        ),
      ),
    );
  }

  static Widget warningBox(String errorMessage,
      {bool visible = true, EdgeInsets? margin}) {
    return doShowChildWidget(
      condition: visible,
      child: Container(
        margin: margin,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.amber),
            borderRadius: BorderRadius.circular(15),
            color: Colors.amber.withOpacity(0.1)),
        child: Row(
          children: [
            const Icon(
              Icons.warning_rounded,
              color: Colors.amber,
              size: 40,
            ),
            const HorizontalSpacing(15),
            Expanded(
              child: Txt(
                errorMessage,
                maxLines: null,
                style: TxtStyle.bodyLRegular,
                color: Colors.amber.shade600,
              ),
            )
          ],
        ),
      ),
    );
  }

  static String concatenateLocation(List<String?> locationParts) {
    List<String> formattedParts = [];

    for (String? part in locationParts) {
      if (part != null && part.isNotEmpty) {
        formattedParts.add(part);
      }
    }

    return formattedParts.join(', ');
  }

  static Widget dottedDivider({double height = 1, Color? color}) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 1.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (3.5 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: color ?? context.theme.appColors.dividerColor),
              ),
            );
          }),
        );
      },
    );
  }

  static Widget modelProgressIndicator(
      {required bool inAsyncCall, required Widget child}) {
    return ModalProgressHUD(
        progressIndicator: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: const CircularProgressIndicator(),
        ),
        inAsyncCall: inAsyncCall,
        child: child);
  }

  static Widget doShowChildWidget(
      {required bool condition,
      required Widget child,
      Widget onElseWidget =
          const SizedBox.shrink() // to show custom widget on else case
      }) {
    if (condition) {
      return child;
    } else {
      return onElseWidget;
    }
  }

  static Widget defaultLoader(BuildContext context) {
    return CircularProgressIndicator(
      color: context.theme.appColors.primary,
    );
  }
}

enum WidgetAlignment { right, left, top, bottom }

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing(this.height, {super.key});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing(this.width, {super.key});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

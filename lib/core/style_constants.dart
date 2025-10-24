import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/application/cubit/theme_cubit.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';

class Spacing {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;
  static const EdgeInsets all = EdgeInsets.all(medium);
  static const EdgeInsets allSmall = EdgeInsets.all(small);
  static const EdgeInsets allLarge = EdgeInsets.all(large);
  static const EdgeInsets horizontal = EdgeInsets.symmetric(horizontal: medium);
  static const EdgeInsets horizontalSmall = EdgeInsets.symmetric(
    horizontal: small,
  );
  static const EdgeInsets vertical = EdgeInsets.symmetric(vertical: medium);
  static const EdgeInsets verticalListItem = EdgeInsets.symmetric(
    vertical: small / 2,
  );
  static const EdgeInsets symmetric = EdgeInsets.symmetric(
    horizontal: medium,
    vertical: medium,
  );

  static const EdgeInsets top = EdgeInsets.only(top: medium);
  static const EdgeInsets bottom = EdgeInsets.only(bottom: medium);
  static const EdgeInsets left = EdgeInsets.only(left: medium);
  static const EdgeInsets right = EdgeInsets.only(right: medium);

  static EdgeInsets custom({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
  }

  static EdgeInsets getSmallPaddingAtEnds(int index, int totalItems) {
    return EdgeInsets.only(
      left: index == 0 ? Spacing.small : 0,
      right: index == totalItems - 1 ? Spacing.small : 0,
    );
  }
}

class Gap {
  static SizedBox get verticalSmall => SizedBox(height: Spacing.small);
  static SizedBox get verticalMedium => SizedBox(height: Spacing.medium);
  static SizedBox get verticalLarge => SizedBox(height: Spacing.large);
  static SizedBox get verticalExtraLarge =>
      SizedBox(height: Spacing.extraLarge);
  static SliverToBoxAdapter get sliverVerticalMedium =>
      SliverToBoxAdapter(child: SizedBox(height: Spacing.medium));

  static SizedBox get horizontalSmall => SizedBox(width: Spacing.small);
  static SizedBox get horizontalMedium => SizedBox(width: Spacing.medium);
  static SizedBox get horizontalLarge => SizedBox(width: Spacing.large);
  static SizedBox get horizontalExtraLarge =>
      SizedBox(width: Spacing.extraLarge);

  static SizedBox get scrollEnd =>
      SizedBox(height: kToolbarHeight + Spacing.medium);

  static SizedBox custom({double? width, double? height}) {
    return SizedBox(width: width, height: height);
  }
}

class RoundedCorner {
  static const double smallRadius = 4;
  static const double mediumRadius = 8;
  static const double largeRadius = 16;
  static const double verticalRadius = 12;
  static const double horizontalRadius = 12;

  static BorderRadius get small =>
      BorderRadius.all(Radius.circular(smallRadius));
  static BorderRadius get medium =>
      BorderRadius.all(Radius.circular(mediumRadius));
  static BorderRadius get large =>
      BorderRadius.all(Radius.circular(largeRadius));

  static BorderRadius get vertical => BorderRadius.vertical(
        top: Radius.circular(verticalRadius),
        bottom: Radius.circular(verticalRadius),
      );

  static BorderRadius get horizontal => BorderRadius.horizontal(
        left: Radius.circular(horizontalRadius),
        right: Radius.circular(horizontalRadius),
      );

  static BorderRadius custom({
    double topLeft = mediumRadius,
    double topRight = mediumRadius,
    double bottomLeft = mediumRadius,
    double bottomRight = mediumRadius,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }
}

// class AppColors {
//   static const Color shimmerBase = Color(0xffe1e0e0);
//   static const Color shimmerHighlight = Color(0xfffaf9f9);
//   static const Color critical = Color(0xffFE5A19);
//   static const Color notice = Color(0xff23A438);
//   static const Color warning = Color(0xffE59C00);
//   static const Color expired = Color(0xffFC1919);
// }

class Placeholders {
  static final _random = Random();

  static String get shimmerText {
    int multiplier = 10 + _random.nextInt(6); // 10 to 15 inclusive
    return '█' * multiplier;
  }

  static Widget get loading => Center(child: CircularProgressIndicator());
  static Widget loadingSmall({double size = Spacing.large, Color? color}) =>
      SizedBox(
        height: Spacing.medium,
        width: Spacing.medium,
        child: Center(
          child: CircularProgressIndicator(strokeWidth: 3, color: color),
        ),
      );

  static Widget errorText(
    Failure failure, {
    void Function()? onRetry,
    TxtStyle style = TxtStyle.bodyLSemiBold,
  }) =>
      Center(
        child: Padding(
          padding: Spacing.all,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    failure.when(
                      clientError: (message) => Icons.error_outline,
                      firebaseAuthError: (message, _) => Icons.error_outline,
                      firebaseNetworkError: (message, _) => Icons.error_outline,
                      firebaseUnknownError: (message, _) => Icons.error_outline,
                      serverError: (message) => Icons.error_outline,
                      noPermission: () => Icons.no_accounts_outlined,
                      noInternet: () => Icons.wifi_off_outlined,
                    ),
                    color: activeTheme().appColors.danger,
                  ),
                  Gap.horizontalSmall,
                  Flexible(
                    child: Txt(
                      FailureHandler.getErrorMessageFromFailure(failure),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: style,
                      color: activeTheme().appColors.danger,
                    ),
                  ),
                ],
              ),
              if (onRetry != null)
                IconButton(onPressed: onRetry, icon: Icon(Icons.refresh)),
            ],
          ),
        ),
      );

  static Widget cardErrorText(Failure failure, {void Function()? onRetry}) =>
      Card(child: errorText(failure, onRetry: onRetry));

  static String editOrCreateText(bool isEdit, String value) =>
      "${isEdit ? 'Edit' : 'Create'} $value";

  static Widget noResultImage({String? label}) {
    return Center(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/no-result.png',
              fit: BoxFit.scaleDown,
              scale: 1.5,
            ),
            Txt('No ${label ?? 'Items'} To Display'),
          ],
        ),
      ),
    );
  }
}

extension ScreenSize on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}

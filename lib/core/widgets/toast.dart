// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/application/cubit/theme_cubit.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';

class Toast {
  static void show(
      String msg, IconData icon, Color iconColor, SnackBarAction? action) {
    final scaffoldMessengerKey = GetIt.I<GlobalKey<ScaffoldMessengerState>>();
    final context = scaffoldMessengerKey.currentContext;

    if (context == null) return;

    // Schedule showing the SnackBar after the current frame
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: iconColor, width: 2),
            borderRadius: BorderRadius.circular(5)),
        action: action,
        content: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 8),
            Flexible(
              child: Txt(msg,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TxtStyle.bodyLSemiBold),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 5,
        backgroundColor: activeTheme().appColors.backgroundSecondary,
      );

      scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  // static void showError(ApiFailure failure, {SnackBarAction? action}) {
  //   final errorMessage = FailureHandler.getFailureMessage(failure);
  //   show(errorMessage, Icons.error_outline, Colors.red, action);
  // }

  static void showErrorMessage(String msg, {SnackBarAction? action}) {
    show(msg, Icons.error_outline, Colors.red, action);
  }

  static void showSuccess(String msg, {SnackBarAction? action}) {
    show(msg, Icons.check_circle_outline, Colors.green, action);
  }

  static void showWarning(String msg, {SnackBarAction? action}) {
    show(msg, Icons.warning_amber_outlined, Colors.amber, action);
  }

  static void showInfo(String msg, {SnackBarAction? action}) {
    show(msg, Icons.info_outline, Colors.blue, action);
  }

  static void custom(String msg,
      {required IconData icon,
      required Color iconColor,
      SnackBarAction? action,
      required String dismissLabel}) {
    final scaffoldMessengerKey = GetIt.I<GlobalKey<ScaffoldMessengerState>>();
    final context = scaffoldMessengerKey.currentContext;

    if (context == null) return;

    // Schedule showing the SnackBar after the current frame
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: iconColor, width: 2),
            borderRadius: BorderRadius.circular(5)),
        content: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 8),
            Flexible(
              child: Txt(msg,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TxtStyle.bodyLSemiBold),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 5,
        backgroundColor: activeTheme().appColors.backgroundSecondary,
        duration:
            const Duration(days: 365), // Keep the SnackBar for a long time
        action: action,
        showCloseIcon: true,
      );

      scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
    });
  }
}

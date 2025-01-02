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
            side: BorderSide(color: activeTheme().appColors.formBorder),
            borderRadius: BorderRadius.circular(15)),
        action: action,
        content: Row(
          children: [
            Icon(icon,
                color: activeTheme().appColors.fontPrimary.withOpacity(0.5)),
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
        backgroundColor:
            activeTheme().appColors.backgroundSecondary.withOpacity(0.8),
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
}

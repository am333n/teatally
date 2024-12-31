import 'package:flutter/material.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/widgets/common_widgets.dart';

class DialogHelpers {
  static Future<void> confirmDeleteDialog(
      {required BuildContext context,
      required VoidCallback onConfirmed,
      required VoidCallback onCanceled,
      String? message,
      String? title,
      String? confirmButtonText}) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissal by tapping outside
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Txt(
            title ?? 'Confirm Delete',
            style: TxtStyle.headerSSemiBold,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Txt(
                message ?? 'Are you sure you want to delete this item?',
                style: TxtStyle.headerSRegular,
                maxLines: 3,
              ),
              const VerticalSpacing(15),
              CommonWidgets.borderColoredTextButton(
                context,
                text: "Cancel",
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onCanceled(); // Invoke the callback
                },
              ),
              const VerticalSpacing(10),
              CommonWidgets.coloredTextButton(
                context,
                text: confirmButtonText ?? "Delete",
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss dialog
                  onConfirmed(); // Invoke the callback
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showPopupMenuAbove(
    BuildContext context, {
    required GlobalKey containerKey,
    required List<PopupMenuEntry<int>> items,
  }) async {
    final RenderBox? renderBox =
        containerKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final overlay =
          Overlay.of(context).context.findRenderObject() as RenderBox;

      final containerPosition = renderBox.localToGlobal(Offset.zero);
      final containerSize = renderBox.size;

      final popupPosition = containerPosition.dy - 50;

      // Adjust the popup position if it would go out of bounds
      final adjustedPosition = popupPosition < 0
          ? containerPosition.dy + containerSize.height
          : popupPosition;

      await showMenu(
        context: context,
        position: RelativeRect.fromRect(
          Rect.fromLTWH(
            containerPosition.dx,
            adjustedPosition,
            containerSize.width,
            containerSize.height,
          ),
          Offset.zero & overlay.size,
        ),
        items: items,
      ).then((value) {
        if (value != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected: Option $value')),
          );
        }
      });
    } else {
      debugPrint('Unable to determine widget size or position.');
    }
  }
}

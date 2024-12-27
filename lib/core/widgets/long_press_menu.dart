import 'package:flutter/material.dart';
import 'dart:ui'; // For ImageFilter

class LongPressWithBlur extends StatefulWidget {
  const LongPressWithBlur({
    Key? key,
    required this.child,
    this.onEdit,
    this.onDelete,
    this.blurSigma = 5.0, // Control the blur amount
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final double blurSigma;

  @override
  _LongPressWithBlurState createState() => _LongPressWithBlurState();
}

class _LongPressWithBlurState extends State<LongPressWithBlur> {
  bool isLongPressed = false;

  // Show the menu with options like Edit and Delete
  void _showMenu(BuildContext context, Offset position) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
      items: [
        PopupMenuItem<String>(
          value: 'Edit',
          child: Text('Edit'),
        ),
        PopupMenuItem<String>(
          value: 'Delete',
          child: Text('Delete'),
        ),
      ],
    ).then((value) {
      if (value != null) {
        if (value == 'Edit' && widget.onEdit != null) {
          widget.onEdit!(); // Trigger the edit action
        } else if (value == 'Delete' && widget.onDelete != null) {
          widget.onDelete!(); // Trigger the delete action
        }
      }
    });
  }

  // Function to dismiss the blur effect if tapped outside
  void _dismissBlur() {
    setState(() {
      isLongPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (_) {
        // Dismiss blur effect if tapped outside the widget
        if (isLongPressed) {
          _dismissBlur();
        }
      },
      child: Stack(
        children: [
          // If long-pressed, blur the background
          if (isLongPressed)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  // Prevent tapping inside the blurred area from dismissing it
                },
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: widget.blurSigma, sigmaY: widget.blurSigma),
                  child: Container(
                    color: Colors.black.withOpacity(0.3), // Overlay color
                  ),
                ),
              ),
            ),
          GestureDetector(
            onLongPressStart: (details) {
              setState(() {
                isLongPressed = true; // Trigger blur effect
              });
              _showMenu(
                  context, details.localPosition); // Show menu on long press
            },
            onLongPressEnd: (_) {
              setState(() {
                isLongPressed = false; // Remove blur effect
              });
            },
            child: widget.child, // The actual child widget
          ),
        ],
      ),
    );
  }
}

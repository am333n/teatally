import 'package:flutter/material.dart';

class AppAnimations {
  static Widget slidingFadeTransition(
      Widget child, Animation<double> animation) {
    final inAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(animation);

    final outAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -1.0),
    ).animate(animation);

    if (child.key == ValueKey<int>(animation.status.index)) {
      return SlideTransition(
        position: inAnimation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    } else {
      return SlideTransition(
        position: outAnimation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    }
  }
}

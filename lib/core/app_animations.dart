import 'package:flutter/material.dart';

class AppAnimations {
  /// Duration for smooth component transitions (like Apple)
  static const Duration transitionDuration = Duration(milliseconds: 300);

  /// Smooth start and end, feels natural — great for general animations (default).
  static const Curve defaultCurve = Curves.easeInOut;

  /// Slight overshoot at the end — ideal for "jiggle", "pop" or attention-seeking animations.
  static const Curve jiggleCurve = Curves.easeInOutBack;

  /// Bouncy spring-like effect — good for playful animations.
  static const Curve bounceCurve = Curves.bounceOut;

  /// Starts fast, ends slowly — great for things sliding in or out.
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;

  /// Slight springy "bounce-in" effect — nice for elements appearing into view.
  static const Curve elasticIn = Curves.elasticIn;

  /// Springy "bounce-out" effect — for items exiting or snapping into place.
  static const Curve elasticOut = Curves.elasticOut;

  /// Fast start, slow finish — smooth for subtle zoom or fade effects.
  static const Curve zoomInCurve = Curves.easeOutExpo;

  /// No easing, linear speed — use sparingly.
  static const Curve linear = Curves.linear;

  /// Apple-like transition: fade + scale + slight slide
  static Widget smoothSwitcherTransition(
    Widget child,
    Animation<double> animation,
  ) {
    final curved = CurvedAnimation(
      parent: animation,
      curve: defaultCurve,
    );

    return FadeTransition(
      opacity: curved,
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.95, end: 1.0).animate(curved),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.00, 0.01),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      ),
    );
  }

  /// Optional: fade + scale only (no slide)
  static Widget fadeScaleTransition(
    Widget child,
    Animation<double> animation,
  ) {
    final curved = CurvedAnimation(
      parent: animation,
      curve: defaultCurve,
    );

    return FadeTransition(
      opacity: curved,
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.95, end: 1.0).animate(curved),
        child: child,
      ),
    );
  }

  /// A very subtle fade-only transition (barely noticeable, but smooth)
  static Widget subtleFadeTransition(
    Widget child,
    Animation<double> animation,
  ) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.85, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: defaultCurve,
        ),
      ),
      child: child,
    );
  }

  static Stack customLayoutBuilder(
      List<Widget> previousChildren, Widget? currentChild,
      {Alignment? alignment}) {
    return Stack(
      alignment: alignment ?? Alignment.topCenter, // Align all children left
      children: <Widget>[
        ...previousChildren,
        if (currentChild != null) currentChild,
      ],
    );
  }
}

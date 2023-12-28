import 'package:flutter/material.dart';

class PageFadeTransition {
  final Widget child;
  final Duration transitionDuration;
  final Duration reverseTransitionDuration;
  const PageFadeTransition({
    required this.child,
    this.transitionDuration = const Duration(milliseconds: 100),
    this.reverseTransitionDuration = const Duration(milliseconds: 300),
  });

  Route get build {
    return PageRouteBuilder(
      transitionDuration: transitionDuration,
      reverseTransitionDuration: reverseTransitionDuration,
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}

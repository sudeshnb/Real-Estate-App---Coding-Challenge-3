import 'package:flutter/material.dart';

class TranslateRightAnimation extends StatelessWidget {
  const TranslateRightAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1, end: 0),
      duration: duration,
      curve: Curves.fastOutSlowIn,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(width * value * 1, 0),
          child: child,
        );
      },
    );
  }
}

class TranslateLeftAnimation extends StatelessWidget {
  const TranslateLeftAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1, end: 0),
      duration: duration,
      curve: Curves.linear,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(width * value - 1, 0),
          child: child,
        );
      },
    );
  }
}

class TranslateUpAnimation extends StatelessWidget {
  const TranslateUpAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1, end: 0),
      duration: duration,
      curve: Curves.fastOutSlowIn,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(0, height * value),
          child: child,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proplink/src/core/constants/constants.dart';

class AppDecoration {
  static BorderRadius discountRadius = const BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
    bottomRight: Radius.circular(25.0),
  );

  static BoxDecoration get button => BoxDecoration(
        color: AppColor.card.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24.0),
      );
  static BoxDecoration get fader => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.fader.withOpacity(0.0),
            AppColor.radial.withOpacity(0.7),
            AppColor.radial,
          ],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
      );

  static BoxDecoration circle(bool isProfile, Color color) => BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isProfile ? AppColor.border : AppColor.button,
          width: 1.2,
        ),
        color: color,
      );

  static BoxDecoration greeting(Color color) => BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: AppColor.border, width: 1),
      );

  static BoxDecoration top(Color color) => BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.0), color],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      );
  static BoxDecoration bottomAppBar(Color color) => BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.0), color],
          stops: const [0.0, 0.1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );

  ///
  /// This is used to bottom sheet top borers shape round
  ///
  static BoxDecoration bottomSheet(BuildContext context) => BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      );
}

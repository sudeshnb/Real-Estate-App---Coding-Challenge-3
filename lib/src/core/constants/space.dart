import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpace {
  // static SizedBox get h5 => const SizedBox(height: 5.0);
  static SizedBox get h5 => SizedBox(height: 5.h);
  static SizedBox get h10 => SizedBox(height: 10.h);
  static SizedBox get h20 => SizedBox(height: 20.h);

  static SizedBox get h50 => SizedBox(height: 50.h);

  static SizedBox get w5 => SizedBox(width: 5.w);
  static SizedBox get w10 => SizedBox(width: 10.w);

  /// This is the Spacer with flex.
  static Spacer spacer(int flex) => Spacer(flex: flex);

  ///
  /// This is the Spacer with flex.
  static SizedBox hSpacer(double flex) => SizedBox(height: flex);
  static SizedBox wSpacer(double flex) => SizedBox(width: flex);
}

library text_style;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proplink/src/core/constants/constants.dart';

//
mixin Weight implements FontWeight {
  static FontWeight get l => FontWeight.w300;
  static FontWeight get n => FontWeight.w400;
  static FontWeight get sb => FontWeight.w500;
  static FontWeight get b => FontWeight.w700;
}

//
class AppTextStyle extends TextStyle {
  ///
  static TextStyle get defaultStyle => TextStyle(
        color: AppColor.black,
        fontSize: 16.0,
        fontWeight: Weight.n,
      );

  ///
  static TextStyle get wHeader => TextStyle(
        fontSize: 38.sp,
        color: AppColor.white,
        fontWeight: Weight.b,
        shadows: [TextShadow.defaultShadow],
      );

  static TextStyle get wSubheader => wHeader.copyWith(
        fontSize: 14.sp,
        fontWeight: Weight.n,
      );
  static TextStyle get wBody => wSubheader.copyWith(
        fontSize: 12.sp,
      );

  ///
  static TextStyle get style1 => defaultStyle.copyWith(fontSize: 18.0);
}

mixin TextShadow implements Shadow {
  static Shadow get defaultShadow => Shadow(
        color: AppColor.black.withOpacity(0.25),
        blurRadius: 4.0,
        offset: const Offset(0, 4),
      );
}

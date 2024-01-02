library app_colors;

import 'package:flutter/material.dart';

class AppColor {
  static Color transparent = Colors.transparent;
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  static const Color green = Color(0xFF38CA46);

  static Color darkBackground = const Color(0xFF1A2127);
  static Color darkCard = const Color(0xFF4b4b4b);

  static const Color darkText = Color(0xFF252B5C);
  static const Color lightText = Color(0xfff2f2f2);

  static const Color main = Color(0xFF234F68);

  static const Color fader = Color(0xFF21628A);

  static const Color radial = Color(0xFF1F4C6B);

  static const Color button = Color(0xFF8BC83F);

  static const Color border = Color(0xFFDFDFDF);

  static const Color softGrey = Color(0xFFF5F4F8);

  static const Color yellow = Color(0XFFFFC42D);
  static const Color hint = Color(0xFFA1A5C1);

  static const Color card = Color.fromRGBO(170, 165, 165, 0.7);

  static LinearGradient shimmerGradient = const LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
}

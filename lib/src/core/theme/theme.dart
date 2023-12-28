import 'package:flutter/material.dart';
import 'package:proplink/src/core/constants/constants.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    highlightColor: AppColor.white,
    splashColor: AppColor.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColor.white,
      elevation: 0.0,
    ),
    primaryColor: AppColor.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.white,
      surfaceTintColor: AppColor.white,
    ),
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: AppColor.white,
    canvasColor: AppColor.white,
  );
}

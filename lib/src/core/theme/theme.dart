import 'package:flutter/material.dart';
import 'package:proplink/src/core/constants/constants.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    highlightColor: AppColor.white,
    splashColor: AppColor.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardColor: AppColor.softGrey,
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
    brightness: Brightness.light,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    highlightColor: AppColor.white,
    splashColor: AppColor.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColor.darkBackground,
      elevation: 0.0,
    ),
    primaryColor: AppColor.darkBackground,
    cardColor: const Color(0xff3B444B),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.darkBackground,
      surfaceTintColor: AppColor.darkBackground,
    ),
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: AppColor.darkBackground,
    canvasColor: AppColor.darkBackground,
  );
}

extension ThemeExtras on ThemeData {
  Color get particlesColor =>
      brightness == Brightness.light ? AppColor.white : AppColor.darkBackground;

  Color get text =>
      brightness == Brightness.light ? AppColor.darkText : AppColor.lightText;

  Color get mainText =>
      brightness == Brightness.light ? AppColor.main : AppColor.lightText;

  Color get indicator =>
      brightness == Brightness.light ? AppColor.fader : AppColor.lightText;

  Color get icon => AppColor.main;

  Color get mainIcon =>
      brightness == Brightness.light ? AppColor.main : AppColor.lightText;

  Color get card =>
      brightness == Brightness.light ? AppColor.softGrey : AppColor.darkCard;
}

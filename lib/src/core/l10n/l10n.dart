import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app.l10n.dart';
import 'model/language.dart';

class L10n {
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    // Locale('ar', 'CN'),
    // Locale('hi', 'US'),
    Locale('es', 'CN'),
    // Locale('de', 'US'),
    // Locale('si', 'CN'),
    // Locale('zh', 'CN'),
  ];
  static List<Language> languages = [
    Language(flag: '🇬🇧', name: 'English', locale: const Locale('en', 'US')),
    // Language(flag: '🇸🇦', name: 'العربية', locale: const Locale('ar', 'CN')),
    // Language(flag: '🇮🇳', name: 'हिंदी', locale: const Locale('hi', 'US')),
    Language(flag: '🇪🇸', name: 'Español', locale: const Locale('es', 'CN')),
    // Language(flag: '🇩🇪', name: 'Deutsch', locale: const Locale('de', 'US')),
    // Language(flag: '🇱🇰', name: 'සිංහල', locale: const Locale('si', 'CN')),
  ];

  ///

  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}

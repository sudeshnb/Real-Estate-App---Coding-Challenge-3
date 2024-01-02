import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app.l10n.dart';

class AppLn {
  static late Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  static late Iterable<Locale> supportedLocales;

  Future<AppLn> init() async {
    localizationsDelegates = AppLocalizations.localizationsDelegates;
    supportedLocales = AppLocalizations.supportedLocales;
    return this;
  }

  static AppLocalizations? of(BuildContext context) {
    return AppLocalizations.of(context);
  }
}

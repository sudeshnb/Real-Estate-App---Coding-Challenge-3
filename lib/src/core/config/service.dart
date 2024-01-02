import 'package:flutter/material.dart';
import 'package:proplink/src/core/config/package.dart';
import 'package:proplink/src/core/services/storage.dart';

import 'localizations.dart';

class ServiceInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await AppLn().init();

    await AppInfo.init();

    await StorageService().init();
  }
}

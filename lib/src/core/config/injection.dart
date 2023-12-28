library dependency_injection;

import 'package:flutter/material.dart';
import 'package:proplink/src/core/config/package.dart';

class DependencyInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await AppInfo.init();
  }
}

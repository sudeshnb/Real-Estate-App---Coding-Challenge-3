import 'package:flutter/material.dart';
import 'package:proplink/src/core/config/package.dart';

class ServiceInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await AppInfo.init();
  }
}

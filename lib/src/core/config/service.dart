import 'package:flutter/material.dart';
import 'package:proplink/src/core/config/package.dart';
import 'package:proplink/src/core/services/storage.dart';

class ServiceInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await AppInfo.init();

    await StorageService().init();
  }
}

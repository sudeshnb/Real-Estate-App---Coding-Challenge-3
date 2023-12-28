import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static String version = '';

  static Future<void> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
  }
}

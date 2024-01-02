import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  static bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  static Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}

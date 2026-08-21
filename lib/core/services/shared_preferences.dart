import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  static getString(String key) {
    return _preferences.getString(key);
  }

  static Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }
}

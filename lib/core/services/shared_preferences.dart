import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }
}

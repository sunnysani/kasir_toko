import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static late SharedPreferences sharedPreferences;

  static Future<void> start() async {
    sharedPreferences = await SharedPreferences.getInstance();

    // setLanguage
    if (!AppSettings.sharedPreferences.containsKey('preferredLang')) {
      if (Platform.localeName.startsWith('id')) {
        AppSettings.sharedPreferences.setString('preferredLang', 'id');
      } else {
        AppSettings.sharedPreferences.setString('preferredLang', 'en');
      }
    }
  }
}

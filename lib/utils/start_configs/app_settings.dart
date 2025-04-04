import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static late SharedPreferences sharedPreferences;

  static Future<void> start() async {
    sharedPreferences = await SharedPreferences.getInstance();

    // setLanguage
    if (!AppSettings.sharedPreferences.containsKey('PREFERRED_LANGUAGE')) {
      AppSettings.sharedPreferences.setString('PREFERRED_LANGUAGE',
          PlatformDispatcher.instance.locale.languageCode);
    }
  }
}

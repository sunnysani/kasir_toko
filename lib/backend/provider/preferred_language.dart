import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_settings.dart';

class PreferredLanguage with ChangeNotifier {
  String? _selectedLanguage;

  PreferredLanguage() {
    _selectedLanguage =
        AppSettings.sharedPreferences.getString('PREFERRED_LANGUAGE');
  }

  String get selectedLanguage {
    return _selectedLanguage!;
  }

  void switchLanguage(String lang) async {
    AppSettings.sharedPreferences.setString('PREFERRED_LANGUAGE', lang);
    _selectedLanguage = lang;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:kasir_toko/utils/start_configs/app_settings.dart';

class PreferredLanguage with ChangeNotifier {
  String? _selectedLanguage;

  PreferredLanguage() {
    _selectedLanguage =
        AppSettings.sharedPreferences.getString('preferredLang');
  }

  String get selectedLanguage {
    return _selectedLanguage!;
  }

  void switchLanguage(String lang) async {
    AppSettings.sharedPreferences.setString('preferredLang', lang);
    _selectedLanguage = lang;
    notifyListeners();
  }
}

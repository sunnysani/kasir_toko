import 'package:flutter/material.dart';

class L10n {
  static final supportedLanguages = [
    const Locale('en'),
    const Locale('id'),
  ];

  static final stringLocaleMap = {
    'en': supportedLanguages[0],
    'id': supportedLanguages[1],
  };
}

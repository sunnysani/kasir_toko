import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundBaseColor = Color(0xFFFCFCFC);
  static const Color mainColor = Color(0xFF428EFF);
  static const Color secondaryMainColor = Color(0xFFD0E2FF);
  static const Color accentColor = Color(0xFF659BED);
  static const Color inactiveColor = Color(0xFF7C9299);
  static const Color positiveColor = Color(0xFF00AA00);
  static const Color negativeColor = Color(0xFFCF1010);
  static const Color warningColor = Color(0xFFFFDC25);
}

class Palette {
  static const MaterialColor appSwatch = MaterialColor(
    0xFF428EFF,
    <int, Color>{
      50: Color(0xFFE8F1FF), //10%
      100: Color(0xFFC6DDFF), //20%
      200: Color(0xFFA1C7FF), //30%
      300: Color(0xFF7BB0FF), //40%
      400: Color(0xFF5E9FFF), //50%
      500: Color(0xFF428EFF), //60%
      600: Color(0xFF3C86FF), //70%
      700: Color(0xFF337BFF), //80%
      800: Color(0xFF2B71FF), //90%
      900: Color(0xFF1D5FFF), //100%
    },
  );
}

class ButtonTextStyle {
  static const secondaryButtonStyle = ButtonStyle(
    textStyle: WidgetStatePropertyAll(
      TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
    foregroundColor: WidgetStatePropertyAll(AppColors.mainColor),
    backgroundColor: WidgetStatePropertyAll(AppColors.secondaryMainColor),
  );
}

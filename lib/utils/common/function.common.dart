import 'package:flutter/material.dart';

class CommonFunction {
  static double parseTextDouble(String input) {
    input = input.replaceAll(',', '.');

    if (input.isEmpty) return 0;
    try {
      return double.parse(input);
    } on FormatException catch (_) {
      String secondInput = input.substring(0, input.length - 1);
      return parseTextDouble(secondInput);
    }
  }

  static double getHorizontalPaddingForMaxWidth({
    required double maxWidth,
    required BuildContext context,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (maxWidth + 40 > screenWidth) return 20;
    return (screenWidth - maxWidth) / 2;
  }
}

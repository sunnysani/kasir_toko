import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.currency(symbol: '', decimalDigits: 0);

    // String newText = formatter.format(value / 100);
    String newText = formatter.format(value);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.fromPosition(
            TextPosition(offset: newText.length - 3)));
  }
}

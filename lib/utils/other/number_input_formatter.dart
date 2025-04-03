import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumberInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat("#,##0", "en_US");

  static double parseToDouble(String formattedText) {
    String cleanText = formattedText.replaceAll(',', ''); // Remove commas
    return double.tryParse(cleanText) ?? 0;
  }

  static String parseToString(double value) {
    return NumberFormat("#,##0.##", "en_US").format(value);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    // Allow empty text
    if (text.isEmpty) return newValue;

    // Check if the user included a dot (for decimals)
    bool hasDecimal = text.contains('.');

    // Remove all non-numeric characters except the decimal point
    String newText = text.replaceAll(RegExp(r'[^0-9.]'), '');

    // Prevent multiple dots
    if (newText.indexOf('.') != newText.lastIndexOf('.')) {
      return oldValue; // Ignore input if user tries multiple dots
    }

    // Split integer and decimal parts
    List<String> parts = newText.split('.');
    String integerPart = parts[0].isNotEmpty
        ? _formatter.format(int.tryParse(parts[0]) ?? 0)
        : "";
    String decimalPart = parts.length > 1 ? parts[1] : "";

    // Reconstruct formatted text
    String formattedText =
        hasDecimal ? "$integerPart.$decimalPart" : integerPart;

    // Adjust cursor position
    int offset = newValue.selection.baseOffset;
    int commasAdded =
        formattedText.length - newText.length; // Difference due to formatting
    int newOffset = offset + commasAdded;

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
          offset: newOffset.clamp(0, formattedText.length)),
    );
  }
}

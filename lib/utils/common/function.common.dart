import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';

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

  static Future<bool> outletValidationConfigured() async {
    final outlet = InstanceDB.outlet;
    if (outlet.name.isEmpty) return false;
    if (outlet.address.isEmpty) return false;
    if (outlet.phoneNumber.isEmpty) return false;

    return true;
  }

  static Future<bool> outletValidationAtLeastOneProduct() async {
    if ((await InstanceDB.getActiveCounts())['products']! < 1) {
      return false;
    }

    return true;
  }

  static Future<bool> outletValidationAtLeastOnePaymentMethod() async {
    if ((await InstanceDB.getActiveCounts())['paymentMethods']! < 1) {
      return false;
    }

    return true;
  }

  static bool sameDayDateTime(DateTime startTime, DateTime endTime) {
    if (startTime.year == endTime.year &&
        startTime.month == endTime.month &&
        startTime.day == endTime.day) {
      return true;
    }

    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/provider/esc_printer.dart';
import 'package:kasir_toko/frontend/widgets/pos/pos_proceed_receipt/select_esc_printer_widget.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';
import 'package:kasir_toko/objectbox.g.dart' as generated_object_box;
import 'package:provider/provider.dart';

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

  static showEscPrinterConnectModal(BuildContext context) {
    Provider.of<EscPrinter>(context, listen: false).startScanDevices();
    showDialog(
      context: context,
      builder: (context) => SelectEscPrinterWidget(context),
    );
  }

  static bool outletValidationConfigured() {
    final outlet = StaticDB.outlet;
    if ((outlet.name ?? "").isEmpty) return false;
    if ((outlet.address ?? "").isEmpty) return false;
    if ((outlet.phoneNumber ?? "").isEmpty) return false;

    return true;
  }

  static bool outletValidationAtLeastOneProduct() {
    if (StaticDB.productBox
            .query(generated_object_box.Product_.active.equals(true))
            .build()
            .findFirst() ==
        null) {
      return false;
    }

    return true;
  }

  static bool outletValidationAtLeastOnePaymentMethod() {
    if (StaticDB.paymentMethodBox
            .query(generated_object_box.PaymentMethod_.active.equals(true))
            .build()
            .findFirst() ==
        null) {
      return false;
    }

    return true;
  }
}

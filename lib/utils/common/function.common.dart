import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/provider/esc_printer.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/pos/pos_proceed_receipt/select_esc_printer_widget.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/static_db.dart';
import 'package:tokkoo_pos_lite/objectbox.g.dart' as generated_object_box;
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

  static showEscPrinterConnectModal(BuildContext context) async {
    final bluetoothEnabled =
        await Provider.of<EscPrinter>(context, listen: false)
            .startScanDevices();

    if (context.mounted) {
      if (bluetoothEnabled) {
        showDialog(
          context: context,
          builder: (context) => SelectEscPrinterWidget(context),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bluetooth mati'),
            backgroundColor: AppColors.negativeColor,
          ),
        );
      }
    }
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

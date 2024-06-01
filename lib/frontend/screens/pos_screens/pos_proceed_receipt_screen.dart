import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/frontend/widgets/pos/pos_proceed_receipt/pos_receipt_bottom_sheet.dart';
import 'package:kasir_toko/frontend/widgets/pos/pos_proceed_receipt/pos_receipt_column.dart';
import 'package:kasir_toko/frontend/widgets/pos/pos_template.dart';

class PosProceedReceiptScreen extends StatelessWidget {
  const PosProceedReceiptScreen({super.key});

  static const routeName = '/pos/finish';

  void submit(BuildContext context) {
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    OrderRow args = ModalRoute.of(context)!.settings.arguments as OrderRow;
    return PosTemplate(
      childAlignment: Alignment.center,
      bottomSheetWidget: PosReceiptBottomSheet(
        submit: () => submit(context),
      ),
      child: PosReceiptColumn(args),
    );
  }
}

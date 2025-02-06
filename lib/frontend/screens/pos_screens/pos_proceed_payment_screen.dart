import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/models/order_row.dart';
import 'package:tokkoo_pos_lite/frontend/screens/pos_screens/pos_proceed_receipt_screen.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/pos/pos_proceed_payment/pos_order_summary.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/pos/pos_proceed_payment/pos_payment_option.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/pos/pos_proceed_payment/pos_proceed_bottom_sheet.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/pos/pos_template.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/static_db.dart';

class PosProceedPaymentScreen extends StatelessWidget {
  const PosProceedPaymentScreen({super.key});

  static const routeName = '/pos/proceed';

  void submit(BuildContext context, OrderRow orderRow) {
    if (orderRow.paymentMethod.target == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Metode pembayaran kosong'),
          backgroundColor: AppColors.negativeColor,
        ),
      );
      return;
    }

    if (orderRow.payAmount < orderRow.totalPrice) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pembayaran kurang'),
          backgroundColor: AppColors.negativeColor,
        ),
      );
      return;
    }

    orderRow.timeStamp = DateTime.now();
    for (final item in orderRow.orderRowItem) {
      StaticDB.orderRowItemBox.put(item);
    }
    StaticDB.orderRowBox.put(orderRow);

    Navigator.of(context).pushReplacementNamed(
        PosProceedReceiptScreen.routeName,
        result: true,
        arguments: orderRow);
  }

  @override
  Widget build(BuildContext context) {
    OrderRow orderRow = ModalRoute.of(context)!.settings.arguments as OrderRow;

    return PosTemplate(
      title: 'Pembayaran',
      bottomSheetWidget:
          PosProceedBottomSheet(submit: () => submit(context, orderRow)),
      child: Column(
        children: [
          PosOrderSummary(orderRow: orderRow),
          const SizedBox(height: 20),
          PosPaymentOption(orderRow: orderRow),
        ],
      ),
    );
  }
}

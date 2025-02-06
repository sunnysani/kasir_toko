import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/backend/provider/esc_printer.dart';
import 'package:kasir_toko/frontend/widgets/common/printer_status.dart';
import 'package:kasir_toko/frontend/widgets/pos/pos_proceed_receipt/pos_receipt_bottom_sheet.dart';
import 'package:kasir_toko/frontend/widgets/pos/pos_template.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/common/function.common.dart';
import 'package:provider/provider.dart';

class PosProceedReceiptScreen extends StatefulWidget {
  const PosProceedReceiptScreen({super.key});

  static const routeName = '/pos/finish';

  @override
  State<PosProceedReceiptScreen> createState() =>
      _PosProceedReceiptScreenState();
}

class _PosProceedReceiptScreenState extends State<PosProceedReceiptScreen> {
  int printButtonClickCount = 0;

  void submit(BuildContext context) {
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    OrderRow args = ModalRoute.of(context)!.settings.arguments as OrderRow;

    return PosTemplate(
      childAlignment: Alignment.center,
      bottomSheetWidget: PosReceiptBottomSheet(
        submit: () {
          if (printButtonClickCount > 0) {
            submit(context);
          } else {
            showModalBottomSheet(
                context: context,
                builder: (context) => ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              CommonFunction.getHorizontalPaddingForMaxWidth(
                            maxWidth: 550,
                            context: context,
                          ),
                          vertical: 20),
                      children: [
                        const Text('Struk belum dicetak. Lanjutkan?'),
                        const SizedBox(height: 16),
                        FilledButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              submit(context);
                            },
                            child: const Text('Ya')),
                      ],
                    ));
          }
        },
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 32,
                color: AppColors.mainColor,
              ),
              SizedBox(width: 20),
              Text(
                'Pemesanan Selesai',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Jangan lupa untuk cetak struk',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Icon(
            Icons.point_of_sale,
            size: 84,
            color: AppColors.mainColor,
          ),
          const SizedBox(height: 20),
          const PrinterStatus(),
          ElevatedButton(
            onPressed: () {
              Provider.of<EscPrinter>(context, listen: false)
                  .printOrder(context, args);
              printButtonClickCount++;
            },
            style: ButtonTextStyle.secondaryButtonStyle,
            child: const Text('Cetak Struk'),
          )
        ],
      ),
    );
  }
}

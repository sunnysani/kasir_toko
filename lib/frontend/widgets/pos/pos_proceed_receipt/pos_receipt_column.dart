import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/backend/provider/esc_printer.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/common/function.common.dart';
import 'package:provider/provider.dart';

class PosReceiptColumn extends StatelessWidget {
  const PosReceiptColumn(this.orderRow, {super.key});

  final OrderRow orderRow;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Status printer: '),
            TextButton(
              onPressed: () =>
                  CommonFunction.showEscPrinterConnectModal(context),
              child: Text(
                  '${Provider.of<EscPrinter>(context).selectedDevice?.name ?? 'Tidak Terhubung'} (${Provider.of<EscPrinter>(context).printing ? 'Mencetak' : 'Diam'})'),
            )
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<EscPrinter>(context, listen: false)
                .printOrder(context, orderRow);
          },
          style: ButtonTextStyle.secondaryButtonStyle,
          child: const Text('Cetak Struk'),
        )
      ],
    );
  }
}

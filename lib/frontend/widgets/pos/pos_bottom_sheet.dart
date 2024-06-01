import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/common/function.common.dart';

class PosBottomSheet extends StatelessWidget {
  const PosBottomSheet({
    super.key,
    required this.totalItem,
    required this.totalPrice,
    required this.submit,
  });

  final int totalItem;
  final double totalPrice;
  final VoidCallback submit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.mainColor)),
      ),
      height: 80,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
            maxWidth: 550,
            context: context,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total ($totalItem)',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
                      .format(totalPrice),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            ElevatedButton(
                style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(80, 50)),
                ),
                onPressed: submit,
                child: const Text('Lanjut Pembayaran'))
          ],
        ),
      ),
    );
  }
}

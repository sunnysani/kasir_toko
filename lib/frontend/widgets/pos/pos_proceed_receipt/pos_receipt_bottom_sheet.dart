import 'package:flutter/material.dart';
import 'package:kasir_toko/utils/common/function.common.dart';

class PosReceiptBottomSheet extends StatelessWidget {
  const PosReceiptBottomSheet({
    super.key,
    required this.submit,
  });

  final VoidCallback submit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
            maxWidth: 550, context: context),
        vertical: 20,
      ),
      child: ElevatedButton(
        onPressed: submit,
        child: const Text('Kembali ke Halaman Kasir'),
      ),
    );
  }
}

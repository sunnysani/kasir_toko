import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class PosProceedBottomSheet extends StatelessWidget {
  const PosProceedBottomSheet({
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
        child: const Text('Konfirmasi Pembayaran'),
      ),
    );
  }
}

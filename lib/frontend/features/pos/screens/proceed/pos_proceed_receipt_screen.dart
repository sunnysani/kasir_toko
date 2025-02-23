import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tokkoo_pos_lite/backend/provider/esc_printer.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/providers/pos_state.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/screens/pos_app_screen.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/printer_status.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/widgets/pos_template.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class PosProceedReceiptScreen extends ConsumerStatefulWidget {
  const PosProceedReceiptScreen({super.key});

  static const childRouteName = 'proceed/receipt';
  static const routeName = '${PosAppScreen.routeName}/$childRouteName';

  @override
  ConsumerState<PosProceedReceiptScreen> createState() =>
      _PosProceedReceiptScreenState();
}

class _PosProceedReceiptScreenState
    extends ConsumerState<PosProceedReceiptScreen> {
  int printButtonClickCount = 0;

  @override
  Widget build(BuildContext context) {
    return PosTemplate(
      childAlignment: Alignment.center,
      bottomSheetWidget: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
              maxWidth: 550, context: context),
          vertical: 20,
        ),
        child: ElevatedButton(
          onPressed: () {
            if (printButtonClickCount > 0) {
              ref.invalidate(posProceedOrderRowProvider);
              context.pop();
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
                                ref.invalidate(posProceedOrderRowProvider);
                                context.pop();
                                context.pop();
                              },
                              child: const Text('Ya')),
                        ],
                      ));
            }
          },
          child: const Text('Kembali ke Halaman Kasir'),
        ),
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
              ref
                  .read(escPrinterProvider.notifier)
                  .printOrder(context, ref.read(posProceedOrderRowProvider)!);
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

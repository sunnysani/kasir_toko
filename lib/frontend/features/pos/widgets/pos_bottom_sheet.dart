import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/screens/proceed/pos_proceed_payment_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/providers/pos_state.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';

class PosBottomSheet extends ConsumerWidget {
  const PosBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantityAndTotalPriceState =
        ref.watch(quantityAndTotalPriceStateProvider);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.mainColor)),
      ),
      height: 80,
      child: LayoutMaxWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total (${quantityAndTotalPriceState.value?.totalQuantity ?? '-'})',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Text(
                //   NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0).format(
                //       quantityAndTotalPriceState.value?.totalPrice ?? 0),
                //   style: const TextStyle(fontSize: 16),
                // ),
              ],
            ),
            ElevatedButton(
                style: ButtonStyle(
                  minimumSize:
                      WidgetStateProperty.all<Size>(const Size(80, 50)),
                ),
                onPressed: () async {
                  if (quantityAndTotalPriceState.value?.totalQuantity == 0) {
                    return;
                  }

                  final overlay = context.loaderOverlay;
                  overlay.show(); // Show loader
                  try {
                    final orderRow = await InstanceDB.insertOrderRow(
                        productQuantities: ref
                            .read(posQuantityStateProvider.notifier)
                            .constructDBTempObjProductQuantity());
                    ref.read(posProceedOrderRowProvider.notifier).state =
                        orderRow;
                    if (context.mounted) {
                      context.push(PosProceedPaymentScreen.routeName);
                    }
                  } catch (e) {
                    debugPrint(e.toString());
                  } finally {
                    overlay.hide(); // Hide loader
                  }
                },
                child: const Text('Lanjut Pembayaran'))
          ],
        ),
      ),
    );
  }
}

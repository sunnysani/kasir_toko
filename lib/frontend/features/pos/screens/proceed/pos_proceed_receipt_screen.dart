import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tokkoo_pos_lite/backend/provider/esc_printer.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/providers/pos_state.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/screens/pos_app_screen.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/printer_status.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_with_bottom_button.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';

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

  void backToPosScreen() {
    if (printButtonClickCount > 0) {
      ref.invalidate(posProceedOrderRowProvider);
      context.pop();
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => ConstrainedBox(
          constraints: BoxConstraints(maxWidth: AppSize.maxWidth),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              Text(t.feature_pos.receipt_has_not_been_printed),
              const SizedBox(height: 16),
              FilledButton(
                  onPressed: () {
                    ref.invalidate(posProceedOrderRowProvider);
                    context.pop();
                    context.pop();
                  },
                  child: const Text('Ya')),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWithBottomButton(
      childAlignment: Alignment.center,
      bottomButton: ElevatedButton(
        onPressed: backToPosScreen,
        child: Text(t.feature_pos.back_to_cashier_page),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 32,
                color: AppColors.mainColor,
              ),
              SizedBox(width: 20),
              Text(
                t.feature_pos.order_finished,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            t.feature_pos.dont_forget_to_print_receipt,
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
            child: Text(t.feature_pos.print_receipt),
          )
        ],
      ),
    );
  }
}

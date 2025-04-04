import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/providers/pos_state.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/screens/pos_app_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/screens/proceed/pos_proceed_receipt_screen.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_with_bottom_button.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';
import 'package:tokkoo_pos_lite/utils/other/number_input_formatter.dart';

class PosProceedPaymentScreen extends ConsumerStatefulWidget {
  static const childRouteName = 'proceed/payment';
  static const routeName = '${PosAppScreen.routeName}/$childRouteName';

  const PosProceedPaymentScreen({super.key});

  @override
  ConsumerState<PosProceedPaymentScreen> createState() =>
      _PosProceedPaymentScreenState();
}

class _PosProceedPaymentScreenState
    extends ConsumerState<PosProceedPaymentScreen> {
  final payAmountController = TextEditingController();
  DriftEntityPaymentMethodData? selectedPaymentMethod;
  double change = 0;

  void triggerPayAmountListener() {
    double currentPayAmount = payAmountController.text.isEmpty
        ? 0
        : NumberInputFormatter.parseToDouble(payAmountController.text);
    setState(() => change = currentPayAmount -
        ref
            .read(posProceedOrderRowProvider.notifier)
            .state!
            .orderData
            .totalPrice);
  }

  @override
  void initState() {
    triggerPayAmountListener();
    payAmountController.addListener(triggerPayAmountListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final proceededOrderRowState = ref.watch(posProceedOrderRowProvider);
    final paymentMethodListState = ref.watch(posAvailablePaymentMethodProvider);

    if (proceededOrderRowState == null || paymentMethodListState.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(t.feature_pos.payment)),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    Future<void> confirmPayment() async {
      if (selectedPaymentMethod == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.feature_pos.payment_method_empty),
            backgroundColor: AppColors.negativeColor,
          ),
        );
        return;
      }
      if (change < 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.feature_pos.change_is_less_then_0),
            backgroundColor: AppColors.negativeColor,
          ),
        );
        return;
      }

      final overlay = context.loaderOverlay;
      overlay.show();
      try {
        final orderRow = await InstanceDB.payOrderRow(
          payAmount:
              NumberInputFormatter.parseToDouble(payAmountController.text),
          useableOrderRow: ref.read(posProceedOrderRowProvider.notifier).state!,
          paymentMethodData: selectedPaymentMethod!,
        );
        ref.read(posProceedOrderRowProvider.notifier).state = orderRow;
        if (context.mounted) {
          ref.invalidate(posQuantityStateProvider);
          context.replace(PosProceedReceiptScreen.routeName);
        }
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        overlay.hide(); // Hide loader
      }
    }

    return LayoutWithBottomButton(
        title: context.t.feature_pos.payment,
        bottomButton: ElevatedButton(
          onPressed: confirmPayment,
          child: Text(t.feature_pos.confirm_payment),
        ),
        child: Column(children: [
          // Order Summary
          Text(
            t.feature_pos.order_summary.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text(t.feature_pos.order_summary.title)),
                DataColumn(label: Text(t.quantity)),
                DataColumn(label: Text(t.total_price)),
              ],
              rows: [
                for (final item in proceededOrderRowState.items)
                  DataRow(cells: [
                    DataCell(ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: Text(item.product.product.name))),
                    DataCell(Center(
                      child: Text(item.itemData.quantity.toString()),
                    )),
                    DataCell(Align(
                      alignment: Alignment.centerLeft,
                      child: Text(NumberFormat.currency(
                        symbol: '${InstanceDB.outlet.currency} ',
                        decimalDigits: CommonFunction.determineDecimalCount(
                            (item.product.latestRevision.price *
                                item.itemData.quantity)),
                      ).format(item.product.latestRevision.price *
                          item.itemData.quantity)),
                    ))
                  ])
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Summary
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Total'),
                  Text(NumberFormat.currency(
                    symbol: '${InstanceDB.outlet.currency} ',
                    decimalDigits: CommonFunction.determineDecimalCount(
                        proceededOrderRowState.orderData.totalPrice),
                  ).format(proceededOrderRowState.orderData.totalPrice))
                ],
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                // TODO: Does the color need to be adjusted?
                style: TextStyle(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.white
                        : Colors.black),
                decoration: InputDecoration(labelText: t.payment_method),
                isExpanded: true,
                items: paymentMethodListState.value!
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item.name),
                        ))
                    .toList(),
                onChanged: (paymentMethodData) {
                  if (paymentMethodData?.sameAsAmount == true) {
                    payAmountController.text =
                        NumberInputFormatter.parseToString(
                            proceededOrderRowState.orderData.totalPrice);
                  }

                  setState(() => selectedPaymentMethod = paymentMethodData);
                },
                value: selectedPaymentMethod,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: payAmountController,
                readOnly: selectedPaymentMethod?.sameAsAmount ?? false,
                keyboardType: TextInputType.number,
                inputFormatters: [NumberInputFormatter()],
                decoration: InputDecoration(
                  prefix: Text('${InstanceDB.outlet.currency} '),
                  label: Text(t.total_payment),
                  filled: selectedPaymentMethod?.sameAsAmount ?? false,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    t.feature_pos.change,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    NumberFormat.currency(
                            symbol: '${InstanceDB.outlet.currency} ',
                            decimalDigits:
                                CommonFunction.determineDecimalCount(change))
                        .format(change),
                  )
                ],
              ),
            ],
          )
        ]));
  }
}

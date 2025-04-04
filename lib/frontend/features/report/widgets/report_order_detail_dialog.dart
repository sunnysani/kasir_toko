import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_order_row.dart';
import 'package:tokkoo_pos_lite/backend/provider/esc_printer.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/printer_status.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class ReportOrderDetailDialog extends ConsumerWidget {
  const ReportOrderDetailDialog({super.key, required this.orderRow});

  final DriftUsableOrderRow orderRow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: AppSize.maxWidth),
      child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 600),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.feature_sales_report.time_arg(
                          time_string: DateFormat('yyyy-MM-dd / HH:mm:ss')
                              .format(orderRow.orderData.createdAt)),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    ListView(
                      shrinkWrap: true,
                    ),
                    Center(
                      child: DataTable(columns: [
                        DataColumn(label: Text(t.description)),
                        DataColumn(label: Text(t.quantity)),
                        DataColumn(label: Text(t.price)),
                      ], rows: [
                        ...orderRow.items.map((item) => DataRow(cells: [
                              DataCell(ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 250),
                                  child: Text(item.product.product.name))),
                              DataCell(Center(
                                child: Text(item.itemData.quantity.toString()),
                              )),
                              DataCell(Align(
                                alignment: Alignment.centerLeft,
                                child: Text(NumberFormat.currency(
                                  symbol: '${InstanceDB.outlet.currency} ',
                                  decimalDigits:
                                      CommonFunction.determineDecimalCount(
                                    (item.product.latestRevision.price *
                                        item.itemData.quantity),
                                  ),
                                ).format(item.product.latestRevision.price *
                                    item.itemData.quantity)),
                              )),
                            ]))
                      ]),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.payment_method),
                        Text(orderRow.paymentMethod?.name ?? "-"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.total_price),
                        Text(NumberFormat.currency(
                          symbol: '${InstanceDB.outlet.currency} ',
                          decimalDigits: CommonFunction.determineDecimalCount(
                              orderRow.orderData.totalPrice),
                        ).format(orderRow.orderData.totalPrice)),
                      ],
                    ),
                    if (orderRow.paymentMethod != null &&
                        !orderRow.paymentMethod!.sameAsAmount)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(t.pay_amount),
                              Text(NumberFormat.currency(
                                symbol: '${InstanceDB.outlet.currency} ',
                                decimalDigits:
                                    CommonFunction.determineDecimalCount(
                                        orderRow.orderData.payAmount),
                              ).format(orderRow.orderData.payAmount)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(t.feature_pos.change),
                              Builder(builder: (context) {
                                final change = orderRow.orderData.payAmount -
                                    orderRow.orderData.totalPrice;
                                return Text(NumberFormat.currency(
                                  symbol: '${InstanceDB.outlet.currency} ',
                                  decimalDigits:
                                      CommonFunction.determineDecimalCount(
                                          change),
                                ).format(change));
                              }),
                            ],
                          ),
                        ],
                      ),
                    const SizedBox(height: 16),
                    Divider(),
                    const PrinterStatus(),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () => ref
                            .read(escPrinterProvider.notifier)
                            .printOrder(context, orderRow),
                        style: ButtonTextStyle.secondaryButtonStyle,
                        child: Text(t.print),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

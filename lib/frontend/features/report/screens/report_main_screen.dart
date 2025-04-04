import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_order_row.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_order_row.dart';
import 'package:tokkoo_pos_lite/frontend/features/report/widgets/report_order_detail_dialog.dart';
import 'package:tokkoo_pos_lite/frontend/features/report/widgets/report_print_select_method_bottomsheet.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_with_bottom_button.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class ReportMainScreenParam {
  final DateTime startTime;
  final DateTime endTime;

  const ReportMainScreenParam({required this.startTime, required this.endTime});
}

class ReportMainScreen extends StatelessWidget {
  const ReportMainScreen({super.key, required this.param});

  final ReportMainScreenParam param;

  static const routeName = '/report/list';

  void seeDetail(BuildContext context, DriftUsableOrderRow orderRow) {
    showDialog(
      context: context,
      builder: (ctx) => ReportOrderDetailDialog(orderRow: orderRow),
    );
  }

  Future<void> seeSummary(
      BuildContext context, List<DriftUsableOrderRow> orderRows) async {
    final Map<int, int> productRevisionQuantityMapping = {};
    final Map<int, double> productRevisionPriceMapping = {};
    final Map<String, double> paymentMethodTotalMapping = {};

    for (final order in orderRows) {
      if (order.paymentMethod == null) break;

      if (!paymentMethodTotalMapping.containsKey(order.paymentMethod!.name)) {
        paymentMethodTotalMapping[order.paymentMethod!.name] = 0;
      }

      paymentMethodTotalMapping[order.paymentMethod!.name] =
          paymentMethodTotalMapping[order.paymentMethod!.name]! +
              order.orderData.totalPrice;

      for (final item in order.items) {
        final productRevision = item.product.latestRevision;

        if (!productRevisionQuantityMapping.containsKey(productRevision.id)) {
          productRevisionQuantityMapping[productRevision.id] = 0;
          productRevisionPriceMapping[productRevision.id] = 0;
        }

        productRevisionQuantityMapping[productRevision.id] =
            productRevisionQuantityMapping[productRevision.id]! +
                item.itemData.quantity;
        productRevisionPriceMapping[productRevision.id] =
            productRevisionPriceMapping[productRevision.id]! +
                (item.itemData.quantity * productRevision.price);
      }
    }

    // Construct Payment Method -------------------------------------------------------
    // constructedPaymentMethodItems at List<String> struct is:
    // 0: name
    // 1: total
    // 2: UnitPrice
    // 3: totalPrice
    List<List<String>> constructedPaymentMethodItems = [];
    for (final paymentMethodName in paymentMethodTotalMapping.keys) {
      constructedPaymentMethodItems.add([
        paymentMethodName,
        NumberFormat.currency(
          symbol: '${InstanceDB.outlet.currency} ',
          decimalDigits: CommonFunction.determineDecimalCount(
              paymentMethodTotalMapping[paymentMethodName]),
        ).format(paymentMethodTotalMapping[paymentMethodName]),
      ]);
    }
    constructedPaymentMethodItems.sort((a, b) {
      final nameComparison = a[0].compareTo(b[0]);
      if (nameComparison == 0) {
        return a[1].compareTo(b[1]);
      }
      return nameComparison;
    });
    // --------------------------------------------------------------------------------

    // Construct Order Items ----------------------------------------------------------
    // constructedOrderItems at List<String> struct is:
    // 0: ProductName
    // 1: Quantity
    // 2: UnitPrice
    // 3: totalPrice
    List<List<String>> constructedOrderItems = [];
    for (final productRevisionId in productRevisionQuantityMapping.keys) {
      final productRevision =
          await InstanceDB.getProductRevisionByID(id: productRevisionId);
      final product =
          await InstanceDB.getProductByID(id: productRevision.product);
      constructedOrderItems.add([
        product.name,
        productRevisionQuantityMapping[productRevisionId].toString(),
        NumberFormat.currency(
          symbol: '${InstanceDB.outlet.currency} ',
          decimalDigits:
              CommonFunction.determineDecimalCount(productRevision.price),
        ).format(productRevision.price),
        NumberFormat.currency(
          symbol: '${InstanceDB.outlet.currency} ',
          decimalDigits: CommonFunction.determineDecimalCount(
              productRevisionPriceMapping[productRevisionId]),
        ).format(
          productRevisionPriceMapping[productRevisionId],
        ),
      ]);
    }
    constructedOrderItems.sort((a, b) {
      final nameComparison = a[0].compareTo(b[0]);
      if (nameComparison == 0) {
        // compare based on quantity
        return a[1].compareTo(b[1]);
      }
      return nameComparison;
    });
    // --------------------------------------------------------------------------------

    final ScrollController scrollController1 = ScrollController();
    final ScrollController scrollController2 = ScrollController();

    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (ctx) => ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 720),
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 600),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Divider(),
                    Text(
                      t.feature_sales_report.based_on_payment_method,
                      style: TextStyle(fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(),
                    Center(
                      child: Scrollbar(
                        controller: scrollController1,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          controller: scrollController1,
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              columns: [
                                DataColumn(label: Text(t.payment_method)),
                                DataColumn(label: Text(t.total_income)),
                              ],
                              rows: constructedPaymentMethodItems
                                  .map((item) => DataRow(cells: [
                                        DataCell((Text(item[0]))),
                                        DataCell((Text(item[1]))),
                                      ]))
                                  .toList()),
                        ),
                      ),
                    ),

                    // Based on Order
                    const SizedBox(height: 32),
                    const Divider(),
                    Text(
                      t.feature_sales_report.based_on_product,
                      style: TextStyle(fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(),
                    Center(
                      child: Scrollbar(
                        controller: scrollController2,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          controller: scrollController2,
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              columns: [
                                DataColumn(label: Text(t.description)),
                                DataColumn(label: Text(t.quantity)),
                                DataColumn(label: Text(t.unit_price)),
                                DataColumn(label: Text(t.total_price)),
                              ],
                              rows: constructedOrderItems
                                  .map((item) => DataRow(cells: [
                                        DataCell((Text(item[0]))),
                                        DataCell((Text(item[1]))),
                                        DataCell((Text(item[2]))),
                                        DataCell((Text(item[3]))),
                                      ]))
                                  .toList()),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    const Divider(),
                    Text(
                      t.summary,
                      style: TextStyle(fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(),
                    Text(
                        t.feature_sales_report.total_income(
                          income: NumberFormat.currency(
                            symbol: '${InstanceDB.outlet.currency} ',
                            decimalDigits: CommonFunction.determineDecimalCount(
                              paymentMethodTotalMapping.values
                                  .map((item) => item)
                                  .reduce((a, b) => a + b),
                            ),
                          ).format(paymentMethodTotalMapping.values
                              .map((item) => item)
                              .reduce((a, b) => a + b)),
                        ),
                        textAlign: TextAlign.center),
                    Text(
                        t.feature_sales_report
                            .total_product_sold(
                                count: productRevisionQuantityMapping.values
                                    .map((item) => item)
                                    .reduce((a, b) => a + b))
                            .toString(),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.sales_report),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => ReportPrintSelectMethodBottomsheet(
                    param.startTime,
                    param.endTime,
                  ),
                );
              },
              icon: const Icon(Icons.print_outlined))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
              future: InstanceDB.getOrderRowList(
                startDateTime: DateTime(param.startTime.year,
                    param.startTime.month, param.startTime.day, 0, 0, 0),
                endDateTime: DateTime(param.endTime.year, param.endTime.month,
                    param.endTime.day, 23, 59, 59),
                status: OrderStatus.paid,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                final data = snapshot.data!;
                double totalSale = 0;
                for (final orderRow in data) {
                  totalSale += orderRow.orderData.totalPrice;
                }

                return LayoutWithBottomButton(
                  bottomButton: data.isEmpty
                      ? null
                      : ElevatedButton(
                          onPressed: () async {
                            context.loaderOverlay.show();
                            await seeSummary(context, data);
                            // ignore: use_build_context_synchronously
                            context.loaderOverlay.hide();
                          },
                          child:
                              Text(t.feature_sales_report.see_report_summary),
                        ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Text(
                        CommonFunction.sameDayDateTime(
                                param.startTime, param.endTime)
                            ? t.feature_sales_report.report_date_1_arg(
                                date_string: DateFormat('yyyy/MM/dd')
                                    .format(param.startTime))
                            : t.feature_sales_report.report_date_2_args(
                                date_string_1: DateFormat('yyyy/MM/dd')
                                    .format(param.startTime),
                                date_string_2: DateFormat('yyyy/MM/dd')
                                    .format(param.endTime)),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(t.feature_sales_report.total_income(
                        income: NumberFormat.currency(
                                symbol: '${InstanceDB.outlet.currency} ',
                                decimalDigits:
                                    CommonFunction.determineDecimalCount(
                                        totalSale))
                            .format(totalSale),
                      )),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final orderData = data[index].orderData;

                          return Card(
                            child: ListTile(
                              onTap: () => seeDetail(context, data[index]),
                              title: Text(
                                NumberFormat.currency(
                                        symbol:
                                            '${InstanceDB.outlet.currency} ',
                                        decimalDigits: CommonFunction
                                            .determineDecimalCount(
                                                orderData.totalPrice))
                                    .format(orderData.totalPrice),
                              ),
                              subtitle: Text(
                                DateFormat('yyyy/MM/dd @ HH:mm')
                                    .format(orderData.updatedAt),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

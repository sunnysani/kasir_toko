import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/frontend/widgets/report_screens.dart/report_print_select_method_bottomsheet.dart';
import 'package:kasir_toko/utils/common/function.common.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

class ReportMainScreen extends StatelessWidget {
  const ReportMainScreen({super.key});

  static const routeName = '/report';

  void seeDetail(BuildContext context, OrderRow orderRow) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
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
                      'Waktu: ${DateFormat('yyyy-MM-dd / hh:mm:ss').format(orderRow.timeStamp)}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    ListView(
                      shrinkWrap: true,
                    ),
                    Center(
                      child: DataTable(columns: const [
                        DataColumn(label: Text('Deskripsi')),
                        DataColumn(label: Text('Kuantitas')),
                        DataColumn(label: Text('Harga')),
                      ], rows: [
                        ...orderRow.orderRowItem.map((item) => DataRow(cells: [
                              DataCell(ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 250),
                                  child: Text(item.product.target!.name))),
                              DataCell(Center(
                                child: Text(item.quantity.toString()),
                              )),
                              DataCell(Align(
                                alignment: Alignment.centerLeft,
                                child: Text(NumberFormat.currency(
                                        symbol: 'Rp ', decimalDigits: 0)
                                    .format(item.productRevision.target!.price *
                                        item.quantity)),
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
                        const Text('Jenis Pembayaran'),
                        Text(orderRow.paymentMethod.target!.name),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Harga'),
                        Text(NumberFormat.currency(
                                symbol: 'Rp ', decimalDigits: 0)
                            .format(orderRow.totalPrice)),
                      ],
                    ),
                    if (!orderRow.paymentMethod.target!.sameAsAmount)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Jumlah yang Dibayarkan'),
                              Text(NumberFormat.currency(
                                      symbol: 'Rp ', decimalDigits: 0)
                                  .format(orderRow.payAmount)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Kembalian'),
                              Text(NumberFormat.currency(
                                      symbol: 'Rp ', decimalDigits: 0)
                                  .format(orderRow.payAmount -
                                      orderRow.totalPrice)),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void seeSummary(BuildContext context, List<OrderRow> orderRows) {
    final Map<int, int> productRevisionQuantityMapping = {};
    final Map<int, double> productRevisionPriceMapping = {};
    final Map<int, double> paymentMethodTotalMapping = {};

    for (final paymentMethod in StaticDB.paymentMethodBox
        .getAll()
        .where((paymentMethod) => paymentMethod.active)) {
      paymentMethodTotalMapping[paymentMethod.id] = 0;
    }

    for (final order in orderRows) {
      paymentMethodTotalMapping[order.paymentMethod.targetId] =
          paymentMethodTotalMapping[order.paymentMethod.targetId]! +
              order.totalPrice;

      for (final item in order.orderRowItem) {
        final productRevision = item.productRevision;

        if (!productRevisionQuantityMapping
            .containsKey(productRevision.targetId)) {
          productRevisionQuantityMapping[productRevision.targetId] = 0;
          productRevisionPriceMapping[productRevision.targetId] = 0;
        }

        productRevisionQuantityMapping[productRevision.targetId] =
            productRevisionQuantityMapping[productRevision.targetId]! +
                item.quantity;
        productRevisionPriceMapping[productRevision.targetId] =
            productRevisionPriceMapping[productRevision.targetId]! +
                (item.quantity * productRevision.target!.price);
      }
    }

    // Construct Payment Method -------------------------------------------------------
    // constructedPaymentMethodItems at List<String> struct is:
    // 0: name
    // 1: total
    // 2: UnitPrice
    // 3: totalPrice
    List<List<String>> constructedPaymentMethodItems = [];
    for (final paymentMethodId in paymentMethodTotalMapping.keys) {
      final paymentMethod = StaticDB.paymentMethodBox.get(paymentMethodId)!;
      constructedPaymentMethodItems.add([
        paymentMethod.name,
        NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
            .format(paymentMethodTotalMapping[paymentMethodId]),
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
          StaticDB.productRevisionBox.get(productRevisionId)!;
      final product = productRevision.product.target!;
      constructedOrderItems.add([
        product.name,
        productRevisionQuantityMapping[productRevisionId].toString(),
        NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
            .format(productRevision.price),
        NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0).format(
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
      context: context,
      builder: (ctx) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 600),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                      'Total Pemasukan: ${NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0).format(paymentMethodTotalMapping.values.map((item) => item).reduce((a, b) => a + b))}'),
                  Text(
                      'Total Produk Terjual: ${productRevisionQuantityMapping.values.map((item) => item).reduce((a, b) => a + b)}'),
                  const SizedBox(height: 32),
                  const Divider(),
                  const Text(
                    'Berdasarkan Jenis Pembayaran',
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
                            columns: const [
                              DataColumn(label: Text('Metode Pembayaran')),
                              DataColumn(label: Text('Jumlah Pemasukan')),
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
                  const Text(
                    'Berdasarkan Produk',
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
                            columns: const [
                              DataColumn(label: Text('Deskripsi')),
                              DataColumn(label: Text('Kuantitas')),
                              DataColumn(label: Text('Harga Satuan')),
                              DataColumn(label: Text('Total Harga')),
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
                ],
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime args = ModalRoute.of(context)!.settings.arguments as DateTime;
    List<OrderRow> orderList = StaticDB.outlet.getOrderRowListBasedOnDate(args);
    double totalSale = 0;
    for (OrderRow order in orderList) {
      totalSale += order.totalPrice;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Harian'),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      ReportPrintSelectMethodBottomsheet(args),
                );
              },
              icon: const Icon(Icons.print_outlined))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              ListView(
                padding: EdgeInsets.fromLTRB(
                  CommonFunction.getHorizontalPaddingForMaxWidth(
                      maxWidth: 550, context: context),
                  20,
                  CommonFunction.getHorizontalPaddingForMaxWidth(
                      maxWidth: 550, context: context),
                  90,
                ),
                children: [
                  Text(
                    'Laporan Tanggal: ${DateFormat('d MMM yyyy').format(args)}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                      'Hasil Total Penjualan: ${NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0).format(totalSale)}'),
                  const SizedBox(height: 10),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderList.length,
                      itemBuilder: (context, index) => Card(
                            child: ListTile(
                              onTap: () => seeDetail(context, orderList[index]),
                              title: Text(
                                NumberFormat.currency(
                                        symbol: 'Rp ', decimalDigits: 0)
                                    .format(orderList[index].totalPrice),
                              ),
                              subtitle: Text(
                                  'Pukul: ${DateFormat('hh:mm').format(orderList[index].timeStamp)}'),
                            ),
                          ))
                ],
              ),
              if (orderList.isNotEmpty)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          CommonFunction.getHorizontalPaddingForMaxWidth(
                              maxWidth: 550, context: context),
                      vertical: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: () => seeSummary(context, orderList),
                      child: const Text('Lihat Ringkasan Laporan'),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

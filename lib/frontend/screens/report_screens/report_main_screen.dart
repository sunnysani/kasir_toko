import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

class ReportMainScreen extends StatelessWidget {
  const ReportMainScreen({super.key});

  static const routeName = '/report';

  void seeDetail(BuildContext context, OrderRow orderRow) {
    print(orderRow.orderRowItem.toList());
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
              child: Column(
                children: [
                  Text(
                    'Waktu: ${DateFormat('yyyy-MM-dd @ hh:mm:ss').format(orderRow.timeStamp)}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  ListView(
                    shrinkWrap: true,
                  ),
                  // DataTable(columns: const [
                  //   DataColumn(label: Text('Deskripsi')),
                  //   DataColumn(label: Text('Kuantitas')),
                  //   DataColumn(label: Text('Harga')),
                  // ], rows: [
                  //   ...orderRow.orderRowItem.map((item) => DataRow(cells: []))
                  // ])
                ],
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime args = ModalRoute.of(context)!.settings.arguments as DateTime;
    List<OrderRow> orderList = StaticDB.outlet.getOrderRowList(args);
    double totalSale = 0;
    for (OrderRow order in orderList) {
      totalSale += order.totalPrice;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Laporan Harian')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          Text(
            'Laporan Tanggal: ${DateFormat('yyyy MM dd').format(args)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                        '+ ${NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0).format(orderList[index].totalPrice)}',
                      ),
                      subtitle: Text(
                          'Pukul: ${DateFormat('hh:mm').format(orderList[index].timeStamp)}'),
                    ),
                  ))
        ],
      ),
    );
  }
}

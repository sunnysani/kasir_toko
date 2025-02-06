import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tokkoo_pos_lite/backend/models/order_row.dart';
import 'package:tokkoo_pos_lite/backend/models/order_row_item.dart';

class PosOrderSummary extends StatelessWidget {
  const PosOrderSummary({
    super.key,
    required this.orderRow,
  });

  final OrderRow orderRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Ringkasan Pesanan',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Deskripsi')),
              DataColumn(label: Text('Kuantitas')),
              DataColumn(label: Text('Total Harga'))
            ],
            rows: [
              for (OrderRowItem item in orderRow.orderRowItem.toList())
                DataRow(cells: [
                  DataCell(ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 250),
                      child: Text(item.product.target!.name))),
                  DataCell(Center(
                    child: Text(item.quantity.toString()),
                  )),
                  DataCell(Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
                            .format(item.productRevision.target!.price *
                                item.quantity)),
                  ))
                ])
            ],
          ),
        ),
      ],
    );
  }
}

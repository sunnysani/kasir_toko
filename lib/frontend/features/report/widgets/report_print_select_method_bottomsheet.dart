import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/features/report/widgets/report_print_select_date_bottomsheet.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';

class ReportPrintSelectMethodBottomsheet extends StatelessWidget {
  const ReportPrintSelectMethodBottomsheet(this.startDate, this.endDate,
      {super.key});

  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutMaxWidth(
        verticalPadding: 32,
        child: Column(
          children: [
            ListTile(
              title: const Text("E-Journal"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pop();

                showModalBottomSheet(
                  context: context,
                  builder: (context) => ReportPrintSelectDateBottomsheet(
                      ReportPrintType.eJournal, startDate, endDate),
                );
              },
            ),
            ListTile(
              title: const Text("Penjualan Produk"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pop();

                showModalBottomSheet(
                  context: context,
                  builder: (context) => ReportPrintSelectDateBottomsheet(
                      ReportPrintType.productSales, startDate, endDate),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

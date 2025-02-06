import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/report_screens.dart/report_print_select_date_bottomsheet.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class ReportPrintSelectMethodBottomsheet extends StatelessWidget {
  const ReportPrintSelectMethodBottomsheet(this.date, {super.key});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
          horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
              maxWidth: 550, context: context),
          vertical: 32),
      children: [
        ListTile(
          title: const Text("E-Journal"),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).pop();

            showModalBottomSheet(
              context: context,
              builder: (context) => ReportPrintSelectDateBottomsheet(
                  ReportPrintType.eJournal, date),
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
                  ReportPrintType.productSales, date),
            );
          },
        ),
      ],
    );
  }
}

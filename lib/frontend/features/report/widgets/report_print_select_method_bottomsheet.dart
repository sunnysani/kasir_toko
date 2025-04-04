import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/features/report/widgets/report_print_select_date_bottomsheet.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';

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
              title: Text(t.feature_sales_report.e_journal),
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
              title: Text(t.esc_strings.product_sales),
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

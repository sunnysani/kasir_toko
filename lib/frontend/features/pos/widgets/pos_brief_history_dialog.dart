import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/frontend/features/report/widgets/report_order_detail_dialog.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class PosBriefHistoryDialog extends StatelessWidget {
  const PosBriefHistoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: AppSize.maxWidth),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          children: [
            Text(
              t.feature_pos.latest_10_transactions,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 450,
              child: FutureBuilder(
                  future: InstanceDB.getLatestOrderRowList(limit: 10),
                  builder: (ftrBuilderContext, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.data == null) return const SizedBox();

                    return Scrollbar(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (listViewContext, index) {
                          final item = snapshot.data![index];

                          return Card(
                            child: ListTile(
                              onTap: () {
                                context.pop();
                                showDialog(
                                  context: context,
                                  builder: (ctx) =>
                                      ReportOrderDetailDialog(orderRow: item),
                                );
                              },
                              title: Text(
                                NumberFormat.currency(
                                        symbol:
                                            '${InstanceDB.outlet.currency} ',
                                        decimalDigits: CommonFunction
                                            .determineDecimalCount(
                                                item.orderData.totalPrice))
                                    .format(item.orderData.totalPrice),
                              ),
                              subtitle: Text(
                                DateFormat('yyyy/MM/dd @ HH:mm')
                                    .format(item.orderData.updatedAt),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

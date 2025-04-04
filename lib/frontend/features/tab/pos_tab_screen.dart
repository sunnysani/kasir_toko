import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/screens/pos_app_screen.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/text_list.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class PosTabScreen extends StatelessWidget {
  const PosTabScreen({super.key});

  static const routeName = '/pos';

  @override
  Widget build(BuildContext context) {
    return LayoutMaxWidth(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.done_all, size: 200, color: AppColors.mainColor),
            FutureBuilder(
                future: Future.wait<bool>([
                  CommonFunction.outletValidationConfigured(),
                  CommonFunction.outletValidationAtLeastOneProduct(),
                  CommonFunction.outletValidationAtLeastOnePaymentMethod(),
                ]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: LinearProgressIndicator(),
                    );
                  }

                  final outletConfigured = snapshot.data![0];
                  final atLeastOneProduct = snapshot.data![0];
                  final atLeastOnePaymentMehtod = snapshot.data![0];

                  if (outletConfigured &&
                      atLeastOneProduct &&
                      atLeastOnePaymentMehtod) {
                    return Text(
                      t.outlet_configuration_complete,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.before_opreate_cashier_title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      TextList(
                        texts: [
                          t.before_opreate_cashier_item_1,
                          t.before_opreate_cashier_item_2,
                          t.before_opreate_cashier_item_3,
                        ],
                        type: TextListType.number,
                      ),
                    ],
                  );
                }),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => context.push(PosAppScreen.routeName),
                child: Text(t.enter_pos_screen))
          ],
        ),
      ),
    );
  }
}

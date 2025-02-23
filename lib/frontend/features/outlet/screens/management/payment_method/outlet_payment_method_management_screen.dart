import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_management_template.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/payment_method/creation/outlet_payment_method_creation_screen.dart';

class OutletPaymentMethodManagementScreen extends StatelessWidget {
  const OutletPaymentMethodManagementScreen({super.key});

  static const routeName = '/outlet/management/payment-method';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: InstanceDB.streamPaymentMethod(),
        builder: (context, snapshot) {
          return OutletManagementTemplate(
            creationRoute: OutletPaymentMethodCreationScreen.routeName,
            appBarTitle: 'Metode Pembayaran',
            searchBarText: 'Temukan Metode Pembayaran berdasarkan nama',
            isLoading: snapshot.connectionState == ConnectionState.waiting,
            dataList: snapshot.data,
            dataPassedType: DataPassedType.paymentMethod,
          );
        });
  }
}

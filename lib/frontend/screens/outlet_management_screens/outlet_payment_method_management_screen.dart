import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/models/payment_method.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_payment_method_creation_screen.dart';
import 'package:kasir_toko/frontend/widgets/outlet_management/outlet_management_template.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

class OutletPaymentMethodManagementScreen extends StatefulWidget {
  const OutletPaymentMethodManagementScreen({super.key});

  static const routeName = '/outlet/management/payment-method';

  @override
  State<OutletPaymentMethodManagementScreen> createState() =>
      _OutletPaymentMethodManagementScreenState();
}

class _OutletPaymentMethodManagementScreenState
    extends State<OutletPaymentMethodManagementScreen> {
  List<PaymentMethod> paymentMethods = [];

  void loadData() {
    setState(
        () => paymentMethods = StaticDB.outlet.getAllSortedPaymentMethods());
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OutletManagementTemplate(
      loadData: loadData,
      showSubtitle: false,
      creationRoute: OutletPaymentMethodCreationScreen.routeName,
      appBarTitle: 'Metode Pembayaran',
      searchBarText: 'Temukan Metode Pembayaran berdasarkan nama',
      dataList: paymentMethods,
    );
  }
}

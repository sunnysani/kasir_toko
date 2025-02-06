import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/models/product.dart';
import 'package:tokkoo_pos_lite/frontend/screens/outlet_management_screens/outlet_product_creation_screen.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/outlet_management/outlet_management_template.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/static_db.dart';

class OutletProductManagementScreen extends StatefulWidget {
  const OutletProductManagementScreen({super.key});

  static const routeName = '/outlet/management/product';

  @override
  State<OutletProductManagementScreen> createState() =>
      _OutletProductManagementScreenState();
}

class _OutletProductManagementScreenState
    extends State<OutletProductManagementScreen> {
  List<Product> products = [];
  String filterString = '';

  void loadData() {
    setState(() => products = StaticDB.outlet.getAllSortedProduct());
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
      showSubtitle: true,
      creationRoute: OutletProductCreationScreen.routeName,
      appBarTitle: 'Produk',
      searchBarText: 'Temukan Produk berdasarkan nama atau kode',
      dataList: products,
    );
  }
}

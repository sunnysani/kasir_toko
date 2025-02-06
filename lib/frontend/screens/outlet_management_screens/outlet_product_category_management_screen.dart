import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/models/product_category.dart';
import 'package:tokkoo_pos_lite/frontend/screens/outlet_management_screens/outlet_product_category_creation_screen.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/outlet_management/outlet_management_template.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/static_db.dart';

class OutletProductCategoryManagementScreen extends StatefulWidget {
  const OutletProductCategoryManagementScreen({super.key});

  static const routeName = '/outlet/management/product-category';

  @override
  State<OutletProductCategoryManagementScreen> createState() =>
      _OutletProductCategoryManagementScreenState();
}

class _OutletProductCategoryManagementScreenState
    extends State<OutletProductCategoryManagementScreen> {
  List<ProductCategory> categories = [];
  String filterString = '';

  void loadData() {
    setState(() => categories = StaticDB.outlet.getAllSortedProductCategory());
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
      creationRoute: OutletProductCategoryCreationScreen.routeName,
      appBarTitle: 'Kategori Produk',
      searchBarText: 'Temukan Produk berdasarkan nama atau kode',
      dataList: categories,
    );
  }
}

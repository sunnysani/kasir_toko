import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_management_template.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product_category/creation/outlet_product_category_creation_screen.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';

class OutletProductCategoryManagementScreen extends StatelessWidget {
  const OutletProductCategoryManagementScreen({super.key});

  static const routeName = '/outlet/management/product-category';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: InstanceDB.streamProductCategory(),
        builder: (context, snapshot) {
          return OutletManagementTemplate(
            creationRoute: OutletProductCategoryCreationScreen.routeName,
            appBarTitle: t.product_category,
            searchBarText: t.find_product_category_based_on_name,
            isLoading: snapshot.connectionState == ConnectionState.waiting,
            dataList: snapshot.data,
            dataPassedType: DataPassedType.productCategory,
          );
        });
  }
}

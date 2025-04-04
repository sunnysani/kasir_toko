import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_management_template.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product/creation/outlet_product_creation_screen.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';

class OutletProductManagementScreen extends StatelessWidget {
  const OutletProductManagementScreen({super.key});

  static const routeName = '/outlet/management/product';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: InstanceDB.streamUsableProductObject(),
        builder: (context, snapshot) {
          return OutletManagementTemplate(
            creationRoute: OutletProductCreationScreen.routeName,
            appBarTitle: t.product,
            searchBarText: t.find_product_by_name_or_code,
            isLoading: snapshot.connectionState == ConnectionState.waiting,
            dataList: snapshot.data,
            dataPassedType: DataPassedType.product,
          );
        });
  }
}

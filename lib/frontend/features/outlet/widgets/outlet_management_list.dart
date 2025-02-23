import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/payment_method/outlet_payment_method_management_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product_category/outlet_product_category_management_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product/outlet_product_management.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_management_tab.dart';

class OutletManagementList extends StatelessWidget {
  const OutletManagementList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: InstanceDB.streamActiveCounts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            OutletManagementTab(
              title: 'Atur Kategori Produk',
              subtitle:
                  'Jumlah Kategori Produk Tersedia: ${snapshot.data!["productCategories"]}',
              navigatorRoute: OutletProductCategoryManagementScreen.routeName,
            ),
            const SizedBox(height: 40),
            OutletManagementTab(
              title: 'Atur Produk',
              subtitle: 'Jumlah Produk Tersedia: ${snapshot.data!["products"]}',
              navigatorRoute: OutletProductManagementScreen.routeName,
            ),
            const SizedBox(height: 40),
            OutletManagementTab(
              title: 'Atur Metode Pembayaran',
              subtitle:
                  'Jumlah Metode Pembayaran Tersedia: ${snapshot.data!["paymentMethods"]}',
              navigatorRoute: OutletPaymentMethodManagementScreen.routeName,
            ),
            const SizedBox(height: 40),
            // OutletManagementTab(
            //   title: 'Atur Perpajakan',
            //   subtitle: 'Status Perpajakan: ${activeTax ? 'Aktif' : 'Nonaktif'}',
            //   navigatorRoute: OutletTaxManagementScreen.routeName,
            //   refreshData: _refreshData,
            // ),
            // const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}

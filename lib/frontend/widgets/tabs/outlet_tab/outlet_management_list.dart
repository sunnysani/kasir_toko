import 'package:flutter/material.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_payment_method_management_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_product_category_management_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_product_management.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_tax_management_screen.dart';
import 'package:kasir_toko/frontend/widgets/tabs/outlet_tab/outlet_management_tab.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

class OutletManagementList extends StatefulWidget {
  const OutletManagementList({super.key});

  @override
  State<OutletManagementList> createState() => _OutletManagementListState();
}

class _OutletManagementListState extends State<OutletManagementList> {
  void _refreshData() {
    setState(() {
      productCategoriesCount = StaticDB.outlet.productCategories.length;
      productCount = StaticDB.outlet.products.length;
      paymentMethodCount = StaticDB.outlet.paymentMethods.length;
      activeTax = StaticDB.outlet.activeTax;
    });
  }

  int productCategoriesCount = StaticDB.outlet.productCategories.length;
  int productCount = StaticDB.outlet.products.length;
  int paymentMethodCount = StaticDB.outlet.paymentMethods.length;
  bool activeTax = StaticDB.outlet.activeTax;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutletManagementTab(
          title: 'Atur Kategori Produk',
          subtitle: 'Jumlah Kategori Produk Tersedia: $productCategoriesCount',
          navigatorRoute: OutletProductCategoryManagementScreen.routeName,
          refreshData: _refreshData,
        ),
        const SizedBox(height: 40),
        OutletManagementTab(
          title: 'Atur Produk',
          subtitle: 'Jumlah Produk Tersedia: $productCount',
          navigatorRoute: OutletProductManagementScreen.routeName,
          refreshData: _refreshData,
        ),
        const SizedBox(height: 40),
        OutletManagementTab(
          title: 'Atur Metode Pembayaran',
          subtitle: 'Jumlah Metode Pembayaran Tersedia: $paymentMethodCount',
          navigatorRoute: OutletPaymentMethodManagementScreen.routeName,
          refreshData: _refreshData,
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
  }
}

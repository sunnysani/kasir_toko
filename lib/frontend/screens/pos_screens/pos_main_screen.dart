import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/backend/models/order_row_item.dart';
import 'package:kasir_toko/backend/models/product.dart';
import 'package:kasir_toko/backend/models/product_category.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_management_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_payment_method_management_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_product_management.dart';
import 'package:kasir_toko/frontend/screens/pos_screens/pos_proceed_payment_screen.dart';
import 'package:kasir_toko/frontend/widgets/common/search_bar.dart';
import 'package:kasir_toko/frontend/widgets/pos/pos_bottom_sheet.dart';
import 'package:kasir_toko/frontend/widgets/pos/pos_categorized_product_list_view.dart';
import 'package:kasir_toko/frontend/widgets/pos/pos_product_list_view.dart';
import 'package:kasir_toko/frontend/widgets/pos/pos_filter_drawer.dart';
import 'package:kasir_toko/frontend/widgets/pos/pos_template.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/common/function.common.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

class PosMainScreen extends StatefulWidget {
  const PosMainScreen({super.key});
  static const routeName = '/pos';

  @override
  State<PosMainScreen> createState() => _PosMainScreenState();
}

class _PosMainScreenState extends State<PosMainScreen> {
  late List<ProductCategory> categories;
  late List<Product> products;
  late List<Product> uncategorizedProducts;
  final Map<int, TextEditingController> productIdQuantityControllerMap = {};

  int totalItem = 0;
  double totalPrice = 0;

  String filterText = '';

  void onSearch(String val) => setState(() => filterText = val);

  notifyChangedQuantity() {
    int totalItemLocalVar = 0;
    double totalPriceLocalVar = 0;

    productIdQuantityControllerMap.forEach((key, value) {
      int quantity = int.parse(value.text);
      if (quantity != 0) {
        totalItemLocalVar += quantity;
        totalPriceLocalVar +=
            StaticDB.productBox.get(key)!.getLatestRevision().price * quantity;
      }
    });

    setState(() {
      totalItem = totalItemLocalVar;
      totalPrice = totalPriceLocalVar;
    });
  }

  final List<ProductCategory> selectedFilterCategory = [];
  void onSelectCategory(bool? isChecked, ProductCategory category) {
    isChecked = isChecked ?? false;

    setState(() {
      if (isChecked!) {
        selectedFilterCategory.add(category);
        selectedFilterCategory.sort();
      } else {
        selectedFilterCategory.remove(category);
        selectedFilterCategory.sort();
      }
    });
  }

  void submit(BuildContext context) {
    OrderRow orderRow = OrderRow(
      isTaxActive: StaticDB.outlet.activeTax,
      taxPercentage: StaticDB.outlet.taxPercentage,
    );

    productIdQuantityControllerMap.forEach((key, value) {
      int quantity = int.parse(value.text);
      if (quantity > 0) {
        orderRow.addOrderRowItem(OrderRowItem(quantity: quantity)
          ..setProduct(StaticDB.productBox.get(key)!.id));
      }
    });

    if (orderRow.orderRowItem.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tidak ada pembelian barang'),
          backgroundColor: AppColors.negativeColor,
        ),
      );
      return;
    }

    Navigator.of(context)
        .pushNamed(PosProceedPaymentScreen.routeName, arguments: orderRow)
        .then((value) {
      if (value == null) return;
      if (value as bool) {
        productIdQuantityControllerMap.forEach((key, value) {
          value.text = '0';
        });
        notifyChangedQuantity();
      }
    });
  }

  @override
  void initState() {
    categories = StaticDB.outlet.getActiveSortedProductCategories();
    products = StaticDB.outlet.getAllActiveSortedProduct();
    uncategorizedProducts =
        StaticDB.outlet.getAllActiveUncategorizedSortedProduct();

    for (Product product in products) {
      productIdQuantityControllerMap[product.id] =
          TextEditingController(text: '0');
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!CommonFunction.outletValidationConfigured()) {
        if (context.mounted) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(OutletManagementScreen.routeName);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Silakan Atur Informasi Toko terlebih dahulu'),
            backgroundColor: AppColors.negativeColor,
          ),
        );
      }

      if (!CommonFunction.outletValidationAtLeastOneProduct()) {
        if (context.mounted) {
          Navigator.of(context).pop();
          Navigator.of(context)
              .pushNamed(OutletProductManagementScreen.routeName);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Silakan Tambah Minimal 1 Produk Aktif'),
            backgroundColor: AppColors.negativeColor,
          ),
        );
      }

      if (!CommonFunction.outletValidationAtLeastOnePaymentMethod()) {
        if (context.mounted) {
          Navigator.of(context).pop();
          Navigator.of(context)
              .pushNamed(OutletPaymentMethodManagementScreen.routeName);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Silakan Tambah Minimal 1 Metode Pembayaran Aktif'),
            backgroundColor: AppColors.negativeColor,
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PosTemplate(
      title: 'Kasir',
      endDrawer: PosFilterDrawer(
        categories: categories,
        selectedCategory: selectedFilterCategory,
        onSelectCategory: onSelectCategory,
      ),
      bottomSheetWidget: PosBottomSheet(
        totalItem: totalItem,
        totalPrice: totalPrice,
        submit: () => submit(context),
      ),
      child: Column(
        children: [
          CustomSearchBar(
              onChanged: onSearch, hintText: 'Temukan dengan Nama atau Kode'),
          const SizedBox(height: 20),
          filterText.isEmpty
              ? PosCaregorizedProductsListView(
                  categories: categories,
                  uncategorizedProducts: uncategorizedProducts,
                  productIdQuantityControllerMap:
                      productIdQuantityControllerMap,
                  selectedFilterCategory: selectedFilterCategory,
                  notifyChangedQuantity: notifyChangedQuantity,
                )
              : PosProductListView(
                  products: products
                      .where((element) => element.name
                          .toLowerCase()
                          .contains(filterText.toLowerCase()))
                      .toList()
                    ..sort(),
                  productIdQuantityControllerMap:
                      productIdQuantityControllerMap,
                  notifyChangedQuantity: notifyChangedQuantity,
                ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/models/product.dart';
import 'package:tokkoo_pos_lite/backend/models/product_category.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/pos/pos_product_list_view.dart';

class PosCaregorizedProductsListView extends StatelessWidget {
  const PosCaregorizedProductsListView({
    super.key,
    required this.categories,
    required this.uncategorizedProducts,
    required this.productIdQuantityControllerMap,
    required this.notifyChangedQuantity,
    required this.selectedFilterCategory,
  });

  final List<ProductCategory> categories;
  final List<Product> uncategorizedProducts;
  final Map<int, TextEditingController> productIdQuantityControllerMap;
  final VoidCallback notifyChangedQuantity;
  final List<ProductCategory> selectedFilterCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: selectedFilterCategory.isEmpty
              ? categories.length
              : selectedFilterCategory.length,
          itemBuilder: (_, index) {
            List<Product> categoryProducts = (selectedFilterCategory.isEmpty
                    ? categories
                    : selectedFilterCategory)[index]
                .products
                .where((element) => element.active)
                .toList()
              ..sort();
            if (categoryProducts.isEmpty) return const SizedBox();
            return PosProductListView(
              title: (selectedFilterCategory.isEmpty
                      ? categories
                      : selectedFilterCategory)[index]
                  .name,
              products: categoryProducts,
              productIdQuantityControllerMap: productIdQuantityControllerMap,
              notifyChangedQuantity: notifyChangedQuantity,
            );
          },
        ),
        if (uncategorizedProducts.isNotEmpty && selectedFilterCategory.isEmpty)
          PosProductListView(
            title: 'Tidak Berkategori',
            products: uncategorizedProducts,
            productIdQuantityControllerMap: productIdQuantityControllerMap,
            notifyChangedQuantity: notifyChangedQuantity,
          ),
      ],
    );
  }
}

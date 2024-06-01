import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/models/product_category.dart';

class PosFilterDrawer extends StatelessWidget {
  const PosFilterDrawer({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelectCategory,
  });

  final List<ProductCategory> categories;
  final List<ProductCategory> selectedCategory;
  final void Function(bool?, ProductCategory) onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          const Text(
            'Tunjukkan Kategori',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (_, index) => ListTile(
              leading: Checkbox(
                onChanged: (isChecked) =>
                    onSelectCategory(isChecked, categories[index]),
                value: selectedCategory.contains(categories[index]),
              ),
              title: Text(categories[index].name),
            ),
          )
        ],
      ),
    );
  }
}

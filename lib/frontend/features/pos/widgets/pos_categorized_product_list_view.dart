import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_product_object.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/providers/pos_state.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/widgets/pos_product_list_view.dart';

class PosCaregorizedProductsListView extends ConsumerWidget {
  const PosCaregorizedProductsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posInformationState = ref.watch(posInformationStateProvider);
    final posFilterState = ref.watch(posFilterStateProvider);

    if (posInformationState.isLoading) return const SizedBox();

    List<DriftEntityProductCategoryData> shownCategory = [];

    if (posFilterState.filterProductCategoryIDs.isEmpty) {
      for (final category in posInformationState.value!.categoryList) {
        shownCategory.add(category);
      }
    } else {
      for (final filteredID in posFilterState.filterProductCategoryIDs) {
        shownCategory.add(posInformationState.value!.categoryList
            .firstWhere((category) => filteredID == category.id));
      }
    }

    Map<int, List<DriftUsableProductObject>> categoryIDProductMapping = {};
    for (final category in shownCategory) {
      categoryIDProductMapping[category.id] = [];
    }
    for (final usableProductObj
        in posInformationState.value!.categorizedProducts) {
      for (final category in usableProductObj.categories) {
        categoryIDProductMapping[category.id]?.add(usableProductObj);
      }
    }

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: shownCategory.length,
          itemBuilder: (_, index) {
            final category = shownCategory[index];

            if (categoryIDProductMapping[category.id]!.isEmpty) {
              return const SizedBox();
            }

            return PosProductListView(
              title: category.name,
              products: categoryIDProductMapping[category.id]!,
            );
          },
        ),
        if (posInformationState.value!.uncategorizedProducts.isNotEmpty &&
            posFilterState.filterProductCategoryIDs.isEmpty)
          PosProductListView(
            title: 'Tidak Berkategori',
            products: posInformationState.value!.uncategorizedProducts,
          ),
      ],
    );
  }
}

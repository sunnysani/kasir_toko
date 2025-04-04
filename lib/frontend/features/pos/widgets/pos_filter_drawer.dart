import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/providers/pos_state.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';

class PosFilterDrawer extends ConsumerWidget {
  const PosFilterDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posInformationState = ref.watch(posInformationStateProvider);
    final posFilterState = ref.watch(posFilterStateProvider);

    if (posInformationState.isLoading) return const SizedBox();

    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Text(
              t.feature_pos.show_category,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: posInformationState.value!.categoryList.length,
              itemBuilder: (_, index) {
                final category = posInformationState.value!.categoryList[index];

                return ListTile(
                  leading: Checkbox(
                    onChanged: (checked) {
                      if (checked == true) {
                        ref
                            .read(posFilterStateProvider.notifier)
                            .addFilterID(category.id);
                      } else {
                        ref
                            .read(posFilterStateProvider.notifier)
                            .removeFilterID(category.id);
                      }
                    },
                    value: posFilterState.filterProductCategoryIDs
                        .contains(category.id),
                  ),
                  title: Text(category.name),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

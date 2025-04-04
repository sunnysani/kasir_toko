import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_product_object.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/providers/pos_state.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class PosProductListView extends ConsumerWidget {
  const PosProductListView({
    super.key,
    this.title,
    required this.products,
  });

  final String? title;
  final List<DriftUsableProductObject> products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posQuantityState = ref.watch(posQuantityStateProvider);

    if (posQuantityState.isLoading) return SizedBox();

    return Column(
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  title: Text(products[index].product.name),
                  subtitle: Text(
                    NumberFormat.currency(
                      symbol: '${InstanceDB.outlet.currency} ',
                      decimalDigits: CommonFunction.determineDecimalCount(
                          products[index].latestRevision.price),
                    ).format(products[index].latestRevision.price),
                  ),
                  trailing: InputQuantity(
                    productID: products[index].product.id,
                  ),
                ),
              );
            }),
        const SizedBox(height: 20)
      ],
    );
  }
}

class InputQuantity extends ConsumerWidget {
  const InputQuantity({super.key, required this.productID});

  final int productID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantityState = ref.watch(posQuantityStateProvider);

    if (quantityState.isLoading) return const SizedBox();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          constraints: const BoxConstraints(),
          iconSize: 15,
          color: AppColors.mainColor,
          onPressed: () {
            final currentVal = int.parse(quantityState.value![productID]!.text);

            if (currentVal <= 0) {
              quantityState.value![productID]!.text = '0';
            } else {
              quantityState.value![productID]!.text =
                  (currentVal - 1).toString();
            }

            ref.invalidate(quantityAndTotalPriceStateProvider);
          },
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 40,
          child: TextField(
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            ),
            textAlign: TextAlign.center,
            controller: quantityState.value![productID],
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            onChanged: (value) {
              final newVal = int.tryParse(value);

              if (newVal == null || newVal < 0) {
                quantityState.value![productID]!.text = '0';
              } else {
                quantityState.value![productID]!.text = newVal.toString();
              }
              ref.invalidate(quantityAndTotalPriceStateProvider);
            },
          ),
        ),
        IconButton(
          constraints: const BoxConstraints(),
          iconSize: 15,
          color: AppColors.mainColor,
          onPressed: () {
            quantityState.value![productID]!.text =
                (int.parse(quantityState.value![productID]!.text) + 1)
                    .toString();
            ref.invalidate(quantityAndTotalPriceStateProvider);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

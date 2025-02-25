import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokkoo_pos_lite/backend/db/db_temp_classes.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_order_row.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_product_object.dart';

part 'pos_state.g.dart';
part 'pos_state.freezed.dart';

final usableProductProvider =
    StreamProvider.autoDispose<List<DriftUsableProductObject>>((ref) {
  return InstanceDB.streamUsableProductObject(active: true);
});

final paymentMethodProvider =
    StreamProvider.autoDispose<List<DriftEntityPaymentMethodData>>((ref) {
  return InstanceDB.streamPaymentMethod(active: true);
});

@riverpod
class PosUsableProductIDMapping extends _$PosUsableProductIDMapping {
  @override
  Future<Map<int, DriftUsableProductObject>> build() async {
    ref.keepAlive();

    final usableProducts = await ref.watch(usableProductProvider.future);

    final Map<int, DriftUsableProductObject> retMap = {};

    for (final usableProduct in usableProducts) {
      retMap[usableProduct.product.id] = usableProduct;
    }

    return retMap;
  }
}

@freezed
class PosFilterStateReturnStruct with _$PosFilterStateReturnStruct {
  factory PosFilterStateReturnStruct({
    required List<int> filterProductCategoryIDs,
    required String searchString,
  }) = _PosFilterStateReturnStruct;
}

@riverpod
class PosFilterState extends _$PosFilterState {
  @override
  PosFilterStateReturnStruct build() {
    return PosFilterStateReturnStruct(
        filterProductCategoryIDs: [], searchString: '');
  }

  void setSearchString(String newSearchString) {
    state = state.copyWith(searchString: newSearchString);
  }

  void addFilterID(int id) {
    final newFilterList = [...state.filterProductCategoryIDs];
    newFilterList.add(id);
    state = state.copyWith(filterProductCategoryIDs: newFilterList);
  }

  void removeFilterID(int id) {
    final newFilterList = [...state.filterProductCategoryIDs];
    newFilterList.remove(id);
    state = state.copyWith(filterProductCategoryIDs: newFilterList);
  }
}

class PosInformationStateReturnStruct {
  final List<DriftUsableProductObject> allProducts;
  final List<DriftUsableProductObject> categorizedProducts;
  final List<DriftUsableProductObject> uncategorizedProducts;
  final List<DriftEntityPaymentMethodData> paymentMethodList;
  final List<DriftEntityProductCategoryData> categoryList;

  PosInformationStateReturnStruct({
    required this.allProducts,
    required this.categorizedProducts,
    required this.uncategorizedProducts,
    required this.paymentMethodList,
    required this.categoryList,
  });
}

@riverpod
class PosInformationState extends _$PosInformationState {
  @override
  Future<PosInformationStateReturnStruct> build() async {
    ref.keepAlive();
    final usableProducts = await ref.watch(usableProductProvider.future);
    final paymentMethods = await ref.watch(paymentMethodProvider.future);

    final List<DriftUsableProductObject> uncategorizedProducts = [];
    final List<DriftUsableProductObject> categorizedProducts = [];

    final Map<int, DriftEntityProductCategoryData> mapProductCategory = {};

    for (final product in usableProducts) {
      if (product.categories.isEmpty) {
        uncategorizedProducts.add(product);
      } else {
        categorizedProducts.add(product);
        for (final category in product.categories) {
          mapProductCategory.putIfAbsent(category.id, () => category);
        }
      }
    }

    final categories = mapProductCategory.values.toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    return PosInformationStateReturnStruct(
      allProducts: usableProducts,
      categorizedProducts: categorizedProducts,
      uncategorizedProducts: uncategorizedProducts,
      paymentMethodList: paymentMethods,
      categoryList: categories,
    );
  }
}

@riverpod
class PosQuantityState extends _$PosQuantityState {
  @override
  Future<Map<int, TextEditingController>> build() async {
    final usableProducts = await ref.watch(usableProductProvider.future);

    final Map<int, TextEditingController> productIdQuantityControllerMap = {};

    for (final product in usableProducts) {
      productIdQuantityControllerMap[product.product.id] =
          TextEditingController(text: '0');
    }

    return productIdQuantityControllerMap;
  }

  List<DBTempObjProductQuantity> constructDBTempObjProductQuantity() {
    final List<DBTempObjProductQuantity> dbTempObjProductQuantityList = [];

    if (!state.hasValue) return dbTempObjProductQuantityList;

    for (final key in state.value!.keys) {
      final quantity = int.parse(state.value![key]!.text);
      if (quantity > 0) {
        final product =
            ref.read(posUsableProductIDMappingProvider).value![key]!;
        dbTempObjProductQuantityList
            .add(DBTempObjProductQuantity(product, quantity));
      }
    }

    return dbTempObjProductQuantityList;
  }
}

@freezed
class QuantityAndTotalPriceStateReturnStruct
    with _$QuantityAndTotalPriceStateReturnStruct {
  factory QuantityAndTotalPriceStateReturnStruct({
    required int totalQuantity,
    required double totalPrice,
  }) = _QuantityAndTotalPriceStateReturnStruct;
}

@riverpod
class QuantityAndTotalPriceState extends _$QuantityAndTotalPriceState {
  @override
  Future<QuantityAndTotalPriceStateReturnStruct> build() async {
    int totalQuantity = 0;
    double totalPrice = 0;

    final posQuantity = await ref.watch(posQuantityStateProvider.future);
    final usableProductIDMapping =
        await ref.watch(posUsableProductIDMappingProvider.future);

    for (final quantityEntry in posQuantity.entries) {
      final quantity = int.tryParse(quantityEntry.value.text);
      if (quantity != null && quantity > 0) {
        if (usableProductIDMapping.containsKey(quantityEntry.key)) {
          totalQuantity += quantity;
          totalPrice += quantity *
              usableProductIDMapping[quantityEntry.key]!.latestRevision.price;
        }
      }
    }

    return QuantityAndTotalPriceStateReturnStruct(
        totalQuantity: totalQuantity, totalPrice: totalPrice);
  }
}

final posProceedOrderRowProvider =
    AutoDisposeStateProvider<DriftUsableOrderRow?>((ref) {
  ref.keepAlive();
  return null;
});

@riverpod
class PosAvailablePaymentMethod extends _$PosAvailablePaymentMethod {
  @override
  Future<List<DriftEntityPaymentMethodData>> build() async {
    return await InstanceDB.getPaymentMethod(active: true);
  }
}

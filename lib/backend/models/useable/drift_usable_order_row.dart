import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_product_object.dart';

class DriftUsableOrderRow {
  final DriftEntityOrderRowData orderData;
  final List<DriftUsableOrderRowItem> items;
  final DriftEntityPaymentMethodData? paymentMethod;

  DriftUsableOrderRow(this.orderData, this.items, this.paymentMethod);
}

class DriftUsableOrderRowItem {
  final DriftEntityOrderRowItemData itemData;
  final DriftUsableProductObject product;

  DriftUsableOrderRowItem(this.itemData, this.product);
}

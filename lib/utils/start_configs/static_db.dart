import 'dart:io';

import 'package:tokkoo_pos_lite/backend/models/order_row.dart';
import 'package:tokkoo_pos_lite/backend/models/order_row_item.dart';
import 'package:tokkoo_pos_lite/backend/models/outlet.dart';
import 'package:tokkoo_pos_lite/backend/models/payment_method.dart';
import 'package:tokkoo_pos_lite/backend/models/product.dart';
import 'package:tokkoo_pos_lite/backend/models/product_category.dart';
import 'package:tokkoo_pos_lite/backend/models/product_revision.dart';
import 'package:tokkoo_pos_lite/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class StaticDB {
  static late Outlet outlet;
  static late Store store;
  static late Box<Outlet> outletBox;
  static late Box<ProductCategory> productCategoryBox;
  static late Box<Product> productBox;
  static late Box<ProductRevision> productRevisionBox;
  static late Box<PaymentMethod> paymentMethodBox;
  static late Box<OrderRow> orderRowBox;
  static late Box<OrderRowItem> orderRowItemBox;

  static const singletonOutletId = 1;

  static Future<void> start() async {
    await Directory(
            '${(await getApplicationDocumentsDirectory()).path}/kasir_toko/db')
        .create(recursive: true);
    store = await openStore(
        directory:
            '${(await getApplicationDocumentsDirectory()).path}/kasir_toko/db');

    outletBox = store.box<Outlet>();
    productCategoryBox = store.box<ProductCategory>();
    productBox = store.box<Product>();
    productRevisionBox = store.box<ProductRevision>();
    paymentMethodBox = store.box<PaymentMethod>();
    orderRowBox = store.box<OrderRow>();
    orderRowItemBox = store.box<OrderRowItem>();
    // Order Item
    // productCategoryBox = store.box<ProductCategory>();

    if (!outletBox.contains(singletonOutletId)) {
      outlet = Outlet();
      outlet.id = singletonOutletId;
      outletBox.put(outlet);
    }

    outlet = outletBox.get(singletonOutletId)!;
  }

  static void saveOutlet() {
    outletBox.put(outlet);
    outlet = outletBox.get(singletonOutletId)!;
  }

  static void updateOutlet() {
    outlet = outletBox.get(singletonOutletId)!;
  }
}

import 'dart:io';
import 'dart:ui';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tokkoo_pos_lite/backend/db/db_temp_classes.dart';
import 'package:tokkoo_pos_lite/backend/db/trigger.db.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_order_row.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_order_row_item.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_outlet.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_payment_method.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_product.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_product_category.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_product_revision.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_relation_product_product_category.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_order_row.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_product_object.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_settings.dart';

part 'instance.db.g.dart';

@DriftDatabase(tables: [
  DriftEntityOutlet,
  DriftEntityProductCategory,
  DriftEntityProductRevision,
  DriftEntityProduct,
  DriftEntityPaymentMethod,
  DriftRelationProductProductCategory,
  DriftEntityOrderRowItem,
  DriftEntityOrderRow,
])
class InstanceDB extends _$InstanceDB {
  InstanceDB(super.e);

  static late InstanceDB db;
  static late DriftEntityOutletData outlet;

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (m) async {
        await m.createAll();

        // add trigger
        for (final trigger in TriggerDB.triggers) {
          await customStatement(trigger);
        }
      }, onUpgrade: (m, from, to) async {
        if (from == 1 || from == 2 || from == 3) {
          // update trigger
          for (final trigger in TriggerDB.triggers) {
            await customStatement(trigger);
          }
        }

        if (to == 5 || to == 6) {
          final pragmas = await m.database
              .customSelect('PRAGMA table_info(drift_entity_outlet);')
              .get();
          final hasCurrencyColumn =
              pragmas.any((row) => row.data['name'] == 'currency');
          if (!hasCurrencyColumn) {
            await m.addColumn(driftEntityOutlet, driftEntityOutlet.currency);
          }

          await customStatement(
            "UPDATE drift_entity_outlet SET currency='${NumberFormat.simpleCurrency(locale: PlatformDispatcher.instance.locale.toString()).currencySymbol}'",
          );
        }
      });

  static Future<void> start() async {
    await Directory(
            '${(await getApplicationDocumentsDirectory()).path}/kasir_toko/db')
        .create(recursive: true);

    db = InstanceDB(NativeDatabase(File(
        '${(await getApplicationDocumentsDirectory()).path}/kasir_toko/db/db.sqlite')));

    // initiate outlet
    int? initiatedOutletID =
        AppSettings.sharedPreferences.getInt("INITIATED_OUTLET_ID");
    if (initiatedOutletID == null) {
      final row = DriftEntityOutletCompanion.insert(
        name: "",
        address: "",
        phoneNumber: "",
        receiptMessage: "",
        currency: Value(NumberFormat.simpleCurrency(
                locale: PlatformDispatcher.instance.locale.toString())
            .currencySymbol),
      );

      final insertedRow =
          await db.into(db.driftEntityOutlet).insertReturning(row);

      initiatedOutletID = insertedRow.id;
      await AppSettings.sharedPreferences
          .setInt("INITIATED_OUTLET_ID", insertedRow.id);
    }

    outlet = await ((db.select(db.driftEntityOutlet)
          ..where((item) => item.id.equals(initiatedOutletID!))))
        .getSingle();
  }

  static Future<DriftEntityOutletData> updateOutlet({
    required String name,
    required String address,
    required String phoneNumber,
    required String receiptMessage,
  }) async {
    await (db.update(db.driftEntityOutlet)
          ..where((t) => t.id.equals(outlet.id)))
        .write(DriftEntityOutletCompanion(
      name: Value(name),
      address: Value(address),
      phoneNumber: Value(phoneNumber),
      receiptMessage: Value(
        receiptMessage,
      ),
    ));

    outlet = await (db.select(db.driftEntityOutlet)
          ..where((t) => t.id.equals(outlet.id)))
        .getSingle();

    return outlet;
  }

  static Stream<Map<String, int>> streamActiveCounts() {
    final paymentMethodStream = (db.selectOnly(db.driftEntityPaymentMethod)
          ..addColumns([db.driftEntityPaymentMethod.id.count()])
          ..where(db.driftEntityPaymentMethod.active.equals(true)))
        .watchSingle()
        .map((row) => row.read(db.driftEntityPaymentMethod.id.count()) ?? 0);

    final productCategoryStream = (db.selectOnly(db.driftEntityProductCategory)
          ..addColumns([db.driftEntityProductCategory.id.count()])
          ..where(db.driftEntityProductCategory.active.equals(true)))
        .watchSingle()
        .map((row) => row.read(db.driftEntityProductCategory.id.count()) ?? 0);

    final productStream = (db.selectOnly(db.driftEntityProduct)
          ..addColumns([db.driftEntityProduct.id.count()])
          ..where(db.driftEntityProduct.active.equals(true)))
        .watchSingle()
        .map((row) => row.read(db.driftEntityProduct.id.count()) ?? 0);

    return Rx.combineLatest3<int, int, int, Map<String, int>>(
      paymentMethodStream,
      productCategoryStream,
      productStream,
      (paymentMethodCount, productCategoryCount, productCount) => {
        'paymentMethods': paymentMethodCount,
        'productCategories': productCategoryCount,
        'products': productCount,
      },
    );
  }

  static Future<Map<String, int>> getActiveCounts() async {
    final paymentMethodCount = await (db.selectOnly(db.driftEntityPaymentMethod)
          ..addColumns([db.driftEntityPaymentMethod.id.count()])
          ..where(db.driftEntityPaymentMethod.active.equals(true)))
        .getSingle()
        .then((row) => row.read(db.driftEntityPaymentMethod.id.count()) ?? 0);

    final productCategoryCount = await (db
            .selectOnly(db.driftEntityProductCategory)
          ..addColumns([db.driftEntityProductCategory.id.count()])
          ..where(db.driftEntityProductCategory.active.equals(true)))
        .getSingle()
        .then((row) => row.read(db.driftEntityProductCategory.id.count()) ?? 0);

    final productCount = await (db.selectOnly(db.driftEntityProduct)
          ..addColumns([db.driftEntityProduct.id.count()])
          ..where(db.driftEntityProduct.active.equals(true)))
        .getSingle()
        .then((row) => row.read(db.driftEntityProduct.id.count()) ?? 0);

    return {
      'paymentMethods': paymentMethodCount,
      'productCategories': productCategoryCount,
      'products': productCount,
    };
  }

  static Stream<List<DriftEntityProductCategoryData>> streamProductCategory(
      {bool? active}) {
    var query = db.select(db.driftEntityProductCategory);

    // active filter
    if (active != null) {
      query = query..where((t) => t.active.equals(true));
    }

    query = query
      ..orderBy([
        (t) => OrderingTerm(expression: t.active, mode: OrderingMode.desc),
        (t) => OrderingTerm(expression: t.name)
      ]);

    return query.watch();
  }

  static Future<DriftEntityProductCategoryData> insertProductCategory({
    required String name,
  }) async {
    final row = DriftEntityProductCategoryCompanion.insert(
      name: name,
      outlet: outlet.id,
    );

    return await db.into(db.driftEntityProductCategory).insertReturning(row);
  }

  static Future<DriftEntityProductCategoryData> updateProductCategory({
    required DriftEntityProductCategoryData category,
    required String name,
    required bool active,
  }) async {
    await (db.update(db.driftEntityProductCategory)
          ..where((t) => t.id.equals(category.id)))
        .write(DriftEntityProductCategoryCompanion(
      name: Value(name),
      active: Value(active),
      updatedAt: Value(DateTime.now().toUtc()),
    ));

    return await (db.select(db.driftEntityProductCategory)
          ..where((t) => t.id.equals(category.id)))
        .getSingle();
  }

  static Stream<List<DriftUsableProductObject>> streamUsableProductObject({
    bool? active,
  }) {
    var query = db.select(db.driftEntityProduct);

    if (active != null) {
      query = query..where((t) => t.active.equals(active));
    }

    query = query
      ..orderBy([
        (t) => OrderingTerm(expression: t.active, mode: OrderingMode.desc),
        (t) => OrderingTerm(expression: t.name, mode: OrderingMode.asc),
      ]);

    return query.watch().asyncMap((products) async {
      List<DriftUsableProductObject> productObjects = [];

      for (final product in products) {
        // Get the latest revision for the product
        final latestRevision = await (db.select(db.driftEntityProductRevision)
              ..where((t) => t.product.equals(product.id))
              ..orderBy([
                (t) => OrderingTerm(
                    expression: t.numberOfRevision, mode: OrderingMode.desc)
              ])
              ..limit(1))
            .getSingleOrNull();

        // Get all categories for the product
        final categoryIds =
            await (db.select(db.driftRelationProductProductCategory)
                  ..where((t) => t.productId.equals(product.id)))
                .get();

        final categories = db.select(db.driftEntityProductCategory)
          ..where(
              (t) => t.id.isIn(categoryIds.map((e) => e.categoryId).toList()))
          ..where((t) => t.active.equals(true));

        productObjects.add(
          DriftUsableProductObject(
              product, latestRevision!, await categories.get()),
        );
      }

      return productObjects;
    });
  }

  static Future<DriftEntityProductData> insertProduct({
    required String name,
    required double price,
    required String nameInReceipt,
    required String code,
    List<int> categoryIDs = const [],
  }) async {
    // insert product
    final productRow = DriftEntityProductCompanion.insert(
      name: name,
      outlet: outlet.id,
      nameInReceipt: nameInReceipt,
      code: code,
    );
    final product =
        await db.into(db.driftEntityProduct).insertReturning(productRow);

    // insert product revision
    final productRevisionRow = DriftEntityProductRevisionCompanion.insert(
        numberOfRevision: 1, price: price, product: product.id);
    await db
        .into(db.driftEntityProductRevision)
        .insertReturning(productRevisionRow);

    // insert category
    for (final categoryId in categoryIDs) {
      final productCategoryRelationRow =
          DriftRelationProductProductCategoryCompanion.insert(
        categoryId: categoryId,
        productId: product.id,
      );
      await db
          .into(db.driftRelationProductProductCategory)
          .insertReturning(productCategoryRelationRow);
    }

    return product;
  }

  static Future<DriftEntityProductRevisionData> getProductRevisionByID({
    required int id,
  }) async {
    final query = db.select(db.driftEntityProductRevision)
      ..where((t) => t.id.equals(id));

    return await query.getSingle();
  }

  static Future<DriftEntityProductData> getProductByID({
    required int id,
  }) async {
    final query = db.select(db.driftEntityProduct)
      ..where((t) => t.id.equals(id));

    return await query.getSingle();
  }

  static Future<DriftEntityProductData> updateProduct({
    required DriftEntityProductData product,
    required String name,
    required String nameInReceipt,
    required String code,
    required double price,
    required bool active,
    List<int> categoryIDs = const [],
  }) async {
    await (db.update(db.driftEntityProduct)
          ..where((t) => t.id.equals(product.id)))
        .write(DriftEntityProductCompanion(
      name: Value(name),
      nameInReceipt: Value(nameInReceipt),
      code: Value(code),
      updatedAt: Value(DateTime.now().toUtc()),
      active: Value(active),
    ));

    // Category Logic -----------------------------------------
    // Add New Category
    for (final categoryID in categoryIDs) {
      final existingRelation =
          await (db.select(db.driftRelationProductProductCategory)
                ..where((t) =>
                    t.categoryId.equals(categoryID) &
                    t.productId.equals(product.id)))
              .getSingleOrNull();
      if (existingRelation == null) {
        // If no relation exists, create a new one
        await db.into(db.driftRelationProductProductCategory).insert(
              DriftRelationProductProductCategoryCompanion(
                categoryId: Value(categoryID),
                productId: Value(product.id),
              ),
            );
      }
    }
    // Remove Unpresent Category
    final currentCategoryIds =
        categoryIDs.map((categoryID) => categoryID).toSet();
    final existingRelations =
        await (db.select(db.driftRelationProductProductCategory)
              ..where((t) => t.productId.equals(product.id)))
            .get();
    for (final relation in existingRelations) {
      if (!currentCategoryIds.contains(relation.categoryId)) {
        // If the category is no longer in the updated list, remove the relation
        await (db.delete(db.driftRelationProductProductCategory)
              ..where((t) =>
                  t.categoryId.equals(relation.categoryId) &
                  t.productId.equals(product.id)))
            .go();
      }
    }
    // --------------------------------------------------------

    // Product Revision Logic ---------------------------------
    final result = await (db.select(db.driftEntityProductRevision)
          ..where((t) => t.product.equals(product.id)))
        .get();
    final maxRevision =
        result.map((e) => e.numberOfRevision).reduce((a, b) => a > b ? a : b);
    final nextReivsionNumber = maxRevision + 1;
    final productRevisionRow = DriftEntityProductRevisionCompanion.insert(
        numberOfRevision: nextReivsionNumber,
        price: price,
        product: product.id);
    await db
        .into(db.driftEntityProductRevision)
        .insertReturning(productRevisionRow);
    // --------------------------------------------------------

    return await (db.select(db.driftEntityProduct)
          ..where((t) => t.id.equals(product.id)))
        .getSingle();
  }

  static Stream<List<DriftEntityPaymentMethodData>> streamPaymentMethod({
    bool? active,
  }) {
    var query = db.select(db.driftEntityPaymentMethod);

    if (active != null) {
      query = query..where((t) => t.active.equals(active));
    }

    query = query
      ..orderBy([
        (t) => OrderingTerm(expression: t.active, mode: OrderingMode.desc),
        (t) => OrderingTerm(expression: t.name)
      ]);

    return query.watch();
  }

  static Future<List<DriftEntityPaymentMethodData>> getPaymentMethod({
    bool? active,
  }) async {
    var query = db.select(db.driftEntityPaymentMethod);

    if (active != null) {
      query = query..where((t) => t.active.equals(active));
    }

    query = query
      ..orderBy([
        (t) => OrderingTerm(expression: t.active, mode: OrderingMode.desc),
        (t) => OrderingTerm(expression: t.name)
      ]);

    return await query.get();
  }

  static Future<DriftEntityPaymentMethodData> insertPaymentMethod(
      {required String name, required bool sameAsAmount}) async {
    final row = DriftEntityPaymentMethodCompanion.insert(
      name: name,
      sameAsAmount: sameAsAmount,
      outlet: outlet.id,
    );

    return await db.into(db.driftEntityPaymentMethod).insertReturning(row);
  }

  static Future<DriftEntityPaymentMethodData> updatePaymentMethod({
    required DriftEntityPaymentMethodData paymentMethod,
    required String name,
    required bool sameAsAmount,
    required bool active,
  }) async {
    await (db.update(db.driftEntityPaymentMethod)
          ..where((t) => t.id.equals(paymentMethod.id)))
        .write(DriftEntityPaymentMethodCompanion(
      name: Value(name),
      sameAsAmount: Value(sameAsAmount),
      active: Value(active),
      updatedAt: Value(DateTime.now().toUtc()),
    ));

    return await (db.select(db.driftEntityPaymentMethod)
          ..where((t) => t.id.equals(paymentMethod.id)))
        .getSingle();
  }

  static Future<DriftUsableOrderRow> insertOrderRow(
      {required List<DBTempObjProductQuantity> productQuantities}) async {
    final orderRowID = (await db
            .into(db.driftEntityOrderRow)
            .insertReturning(DriftEntityOrderRowCompanion.insert(
              status: OrderStatus.unpaid,
            )))
        .id;

    List<DriftUsableOrderRowItem> usableOrderRowInsertedItem = [];
    for (final productQuantity in productQuantities) {
      final orderRowItem = await db
          .into(db.driftEntityOrderRowItem)
          .insertReturning(DriftEntityOrderRowItemCompanion.insert(
            orderRow: orderRowID,
            productRevision: productQuantity.product.latestRevision.id,
            quantity: productQuantity.quantity,
          ));

      usableOrderRowInsertedItem
          .add(DriftUsableOrderRowItem(orderRowItem, productQuantity.product));
    }

    final orderRow = await (db.select(db.driftEntityOrderRow)
          ..where((t) => t.id.equals(orderRowID)))
        .getSingle();

    return DriftUsableOrderRow(orderRow, usableOrderRowInsertedItem, null);
  }

  static Future<DriftUsableOrderRow> payOrderRow({
    required DriftUsableOrderRow useableOrderRow,
    required DriftEntityPaymentMethodData paymentMethodData,
    required double payAmount,
  }) async {
    await (db.update(db.driftEntityOrderRow)
          ..where((t) => t.id.equals(useableOrderRow.orderData.id)))
        .write(DriftEntityOrderRowCompanion(
      payAmount: Value(payAmount),
      paymentMethod: Value(paymentMethodData.id),
      status: Value(OrderStatus.paid),
      updatedAt: Value(DateTime.now().toUtc()),
    ));

    final orderRow = await (db.select(db.driftEntityOrderRow)
          ..where((t) => t.id.equals(useableOrderRow.orderData.id)))
        .getSingle();

    return DriftUsableOrderRow(
        orderRow, useableOrderRow.items, paymentMethodData);
  }

  static Future<DriftUsableOrderRow> cancelOrderRow(
    DriftUsableOrderRow useableOrderRow,
  ) async {
    await (db.update(db.driftEntityOrderRow)
          ..where((t) => t.id.equals(useableOrderRow.orderData.id)))
        .write(DriftEntityOrderRowCompanion(
      status: Value(OrderStatus.cancelled),
      updatedAt: Value(DateTime.now().toUtc()),
    ));

    final orderRow = await (db.select(db.driftEntityOrderRow)
          ..where((t) => t.id.equals(useableOrderRow.orderData.id)))
        .getSingle();

    return DriftUsableOrderRow(orderRow, useableOrderRow.items, null);
  }

  static Future<List<DriftUsableOrderRow>> getOrderRowList(
      {required DateTime startDateTime,
      required DateTime endDateTime,
      OrderStatus? status}) async {
    final List<DriftUsableOrderRow> retRow = [];

    late final SimpleSelectStatement<$DriftEntityOrderRowTable,
        DriftEntityOrderRowData> query;

    if (status == null) {
      query = db.select(db.driftEntityOrderRow)
        ..where((t) => t.createdAt.isBetweenValues(startDateTime, endDateTime));
    } else {
      query = db.select(db.driftEntityOrderRow)
        ..where((t) =>
            t.createdAt.isBetweenValues(startDateTime, endDateTime) &
            t.status.equals(OrderStatus.paid.name));
    }

    final orderRows = await query.get();

    for (final orderRow in orderRows) {
      List<DriftUsableOrderRowItem> usableOrderRowInsertedItem = [];

      final orderRowItems = await (db.select(db.driftEntityOrderRowItem)
            ..where((t) => t.orderRow.equals(orderRow.id)))
          .get();
      for (final orderRowItem in orderRowItems) {
        final productRevision = await (db.select(db.driftEntityProductRevision)
              ..where((t) => t.id.equals(orderRowItem.productRevision)))
            .getSingle();
        final product = await (db.select(db.driftEntityProduct)
              ..where((t) => t.id.equals(productRevision.product)))
            .getSingle();
        // Category is not needed, so assign empty list
        usableOrderRowInsertedItem.add(DriftUsableOrderRowItem(orderRowItem,
            DriftUsableProductObject(product, productRevision, [])));
      }

      late final DriftEntityPaymentMethodData? paymentMethod;
      if (orderRow.paymentMethod == null) {
        paymentMethod = null;
      } else {
        paymentMethod = await (db.select(db.driftEntityPaymentMethod)
              ..where((t) => t.id.equals(orderRow.paymentMethod!)))
            .getSingle();
      }

      retRow.add(DriftUsableOrderRow(
          orderRow, usableOrderRowInsertedItem, paymentMethod));
    }

    return retRow;
  }
}

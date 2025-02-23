// ignore_for_file: non_constant_identifier_names

import 'package:drift/drift.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_order_row.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_product_revision.dart';

@TableIndex(name: 'idx_order_row_item_order_row', columns: {#order_row})
class DriftEntityOrderRowItem extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get orderRow => integer().references(DriftEntityOrderRow, #id)();
  IntColumn get productRevision =>
      integer().references(DriftEntityProductRevision, #id)();
  IntColumn get quantity => integer()();
}

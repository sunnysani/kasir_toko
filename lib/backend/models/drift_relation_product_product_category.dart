import 'package:drift/drift.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_product.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_product_category.dart';

class DriftRelationProductProductCategory extends Table {
  IntColumn get categoryId =>
      integer().references(DriftEntityProductCategory, #id)();
  IntColumn get productId => integer().references(DriftEntityProduct, #id)();

  @override
  Set<Column> get primaryKey => {categoryId, productId};
}

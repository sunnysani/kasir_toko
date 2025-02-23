import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';

class DriftUsableProductObject {
  final DriftEntityProductData product;
  final DriftEntityProductRevisionData latestRevision;
  final List<DriftEntityProductCategoryData> categories;

  DriftUsableProductObject(this.product, this.latestRevision, this.categories);
}

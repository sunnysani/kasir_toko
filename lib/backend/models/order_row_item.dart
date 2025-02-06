import 'package:tokkoo_pos_lite/backend/models/order_row.dart';
import 'package:tokkoo_pos_lite/backend/models/product.dart';
import 'package:tokkoo_pos_lite/backend/models/product_revision.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/static_db.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 4805377593213751)
class OrderRowItem implements Comparable<OrderRowItem> {
  @Id()
  int id = 0;

  final orderRow = ToOne<OrderRow>();
  final product = ToOne<Product>();
  final productRevision = ToOne<ProductRevision>();
  late final int quantity;
  double totalPriceItem = 0;

  // Applied Discount
  // final discounts = ToMany<Discount>();

  OrderRowItem({
    required this.quantity,
  });

  void setProduct(int relatedProductId) {
    product.target = StaticDB.productBox.get(relatedProductId);
    productRevision.target = product.target?.getLatestRevision();
    totalPriceItem = quantity * productRevision.target!.price;
  }

  @override
  int compareTo(OrderRowItem other) {
    // TODO: implement compareTo
    throw UnimplementedError();
  }
}

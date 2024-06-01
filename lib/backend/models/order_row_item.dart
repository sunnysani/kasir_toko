import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/backend/models/product.dart';
import 'package:kasir_toko/backend/models/product_revision.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 4805377593213751)
class OrderRowItem implements Comparable<OrderRowItem> {
  @Id()
  int id = 0;

  final orderRow = ToOne<OrderRow>();
  final product = ToOne<Product>();
  final productRevision = ToOne<ProductRevision>();
  late final int quantity;
  late final double totalPriceItem;

  // Applied Discount
  // final discounts = ToMany<Discount>();

  OrderRowItem({
    int? relatedProductId,
    required this.quantity,
  }) {
    product.target = StaticDB.productBox.get(relatedProductId ?? -1);
    productRevision.target = product.target?.getLatestRevision();
    totalPriceItem = quantity * productRevision.target!.price;
  }

  @override
  int compareTo(OrderRowItem other) {
    // TODO: implement compareTo
    throw UnimplementedError();
  }
}

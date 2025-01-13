import 'package:kasir_toko/backend/models/outlet.dart';
import 'package:kasir_toko/backend/models/product_category.dart';
import 'package:kasir_toko/backend/models/product_revision.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 230852403568201342)
class Product implements Comparable<Product> {
  @Id()
  int id = 0;
  bool active;
  @Backlink('product')
  final revisions = ToMany<ProductRevision>();
  final categories = ToMany<ProductCategory>();
  final outlet = ToOne<Outlet>();
  String name;
  String? nameInReceipt;
  String? code;

  Product({
    required this.name,
    this.active = true,
    this.nameInReceipt,
    this.code,
  });

  ProductRevision getLatestRevision() {
    return revisions.last;
  }

  @override
  int compareTo(Product other) {
    if (active == other.active) return name.compareTo(other.name);
    if (active) return -1;
    return 1;
  }
}

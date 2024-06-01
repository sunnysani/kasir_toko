import 'package:kasir_toko/backend/models/outlet.dart';
import 'package:kasir_toko/backend/models/product.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 6617611348773466436)
class ProductCategory implements Comparable<ProductCategory> {
  @Id()
  int id = 0;
  late String name;
  bool active;
  @Backlink()
  final products = ToMany<Product>();
  final outlet = ToOne<Outlet>();

  ProductCategory({required this.name, this.active = true});

  @override
  int compareTo(ProductCategory other) {
    if (active == other.active) return name.compareTo(other.name);
    if (active) return -1;
    return 1;
  }
}

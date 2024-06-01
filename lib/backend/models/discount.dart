import 'package:objectbox/objectbox.dart';

enum DiscountType {
  discountPercentage,
  discountPrice,
  fixedPrice,
}

@Entity(uid: 319843295736912)
class Discount implements Comparable<Discount> {
  @Id()
  int id = 0;
  late double discountPercentage;
  late double discountPrice;
  late double fixedPrice;
  @Transient()
  late DiscountType discountType;

  @override
  int compareTo(Discount other) {
    // TODO: Create for biggest discount
    return 1;
  }
}

import 'package:objectbox/objectbox.dart';

@Entity(uid: 12846973592481)
class ProductRevision implements Comparable<ProductRevision> {
  @Id()
  int id = 0;
  int numberOfRevision;
  double price;

  ProductRevision({
    this.numberOfRevision = 0,
    required this.price,
  });

  @override
  int compareTo(ProductRevision other) {
    return numberOfRevision.compareTo(other.numberOfRevision);
  }
}

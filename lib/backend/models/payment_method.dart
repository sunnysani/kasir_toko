import 'package:tokkoo_pos_lite/backend/models/order_row.dart';
import 'package:tokkoo_pos_lite/backend/models/outlet.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 2539012349328530)
class PaymentMethod implements Comparable<PaymentMethod> {
  @Id()
  int id = 0;
  late String name;
  bool sameAsAmount;
  bool active;
  final outlet = ToOne<Outlet>();
  final orders = ToMany<OrderRow>();

  PaymentMethod({
    required this.name,
    this.sameAsAmount = false,
    this.active = true,
  });

  @override
  int compareTo(PaymentMethod other) {
    if (active == other.active) return name.compareTo(other.name);
    if (active) return -1;
    return 1;
  }
}

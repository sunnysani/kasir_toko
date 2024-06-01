import 'package:kasir_toko/backend/models/order_row_item.dart';
import 'package:kasir_toko/backend/models/outlet.dart';
import 'package:kasir_toko/backend/models/payment_method.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 128477593751)
class OrderRow implements Comparable<OrderRow> {
  @Id()
  int id = 0;
  @Property(type: PropertyType.dateNano)
  late DateTime timeStamp;

  late bool isTaxActive;
  late double taxPercentage;

  double totalPrice = 0;
  int totalItem = 0;
  double payAmount = 0;

  final outlet = ToOne<Outlet>();
  final paymentMethod = ToOne<PaymentMethod>();
  final orderRowItem = ToMany<OrderRowItem>();

  void addOrderRowItem(OrderRowItem newItem) {
    orderRowItem.add(newItem);
    totalItem += newItem.quantity;
    totalPrice += newItem.totalPriceItem;
  }

  OrderRow({
    required this.isTaxActive,
    required this.taxPercentage,
  });

  double get change {
    return payAmount - totalPrice;
  }

  @override
  int compareTo(OrderRow other) {
    return timeStamp.compareTo(other.timeStamp);
  }
}

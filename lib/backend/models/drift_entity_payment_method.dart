import 'package:drift/drift.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_outlet.dart';

class DriftEntityPaymentMethod extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get active => boolean().withDefault(const Constant(true))();

  TextColumn get name => text()();
  BoolColumn get sameAsAmount => boolean()();
  IntColumn get outlet => integer().references(DriftEntityOutlet, #id)();
}

// @Entity(uid: 2539012349328530)
// class PaymentMethod implements Comparable<PaymentMethod> {
//   @Id()
//   int id = 0;
//   late String name;
//   bool sameAsAmount;
//   bool active;
//   final outlet = ToOne<Outlet>();
//   final orders = ToMany<OrderRow>();

//   PaymentMethod({
//     required this.name,
//     this.sameAsAmount = false,
//     this.active = true,
//   });

//   @override
//   int compareTo(PaymentMethod other) {
//     if (active == other.active) return name.compareTo(other.name);
//     if (active) return -1;
//     return 1;
//   }
// }

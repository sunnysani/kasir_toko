import 'package:drift/drift.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_payment_method.dart';

enum OrderStatus { unpaid, paid, cancelled }

@TableIndex(name: 'idx_order_row_created_at', columns: {#createdAt})
class DriftEntityOrderRow extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  RealColumn get payAmount => real().withDefault(const Constant(0.0))();
  IntColumn get paymentMethod =>
      integer().nullable().references(DriftEntityPaymentMethod, #id)();
  TextColumn get status => textEnum<OrderStatus>()
      .map(const EnumNameConverter(OrderStatus.values))();

  // Auto count from SQL Trigger
  RealColumn get totalPrice => real().withDefault(const Constant(0.0))();
  IntColumn get totalQuantity => integer().withDefault(const Constant(0))();
}

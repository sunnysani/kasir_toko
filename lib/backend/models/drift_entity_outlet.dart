import 'package:drift/drift.dart';

class DriftEntityOutlet extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get active => boolean().withDefault(const Constant(true))();

  TextColumn get name => text()();
  TextColumn get address => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get receiptMessage => text()();
}

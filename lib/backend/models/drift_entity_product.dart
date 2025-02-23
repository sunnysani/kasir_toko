import 'package:drift/drift.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_outlet.dart';

class DriftEntityProduct extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get active => boolean().withDefault(const Constant(true))();

  TextColumn get name => text()();
  TextColumn get nameInReceipt => text()();
  TextColumn get code => text()();

  IntColumn get outlet => integer().references(DriftEntityOutlet, #id)();
}

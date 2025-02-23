import 'package:drift/drift.dart';
import 'package:tokkoo_pos_lite/backend/models/drift_entity_product.dart';

class DriftEntityProductRevision extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get active => boolean().withDefault(const Constant(true))();

  IntColumn get numberOfRevision => integer()();
  RealColumn get price => real()();
  IntColumn get product => integer().references(DriftEntityProduct, #id)();
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance.db.dart';

// ignore_for_file: type=lint
class $DriftEntityOutletTable extends DriftEntityOutlet
    with TableInfo<$DriftEntityOutletTable, DriftEntityOutletData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftEntityOutletTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _receiptMessageMeta =
      const VerificationMeta('receiptMessage');
  @override
  late final GeneratedColumn<String> receiptMessage = GeneratedColumn<String>(
      'receipt_message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        active,
        name,
        address,
        phoneNumber,
        receiptMessage
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_entity_outlet';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftEntityOutletData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('receipt_message')) {
      context.handle(
          _receiptMessageMeta,
          receiptMessage.isAcceptableOrUnknown(
              data['receipt_message']!, _receiptMessageMeta));
    } else if (isInserting) {
      context.missing(_receiptMessageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftEntityOutletData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftEntityOutletData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      receiptMessage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}receipt_message'])!,
    );
  }

  @override
  $DriftEntityOutletTable createAlias(String alias) {
    return $DriftEntityOutletTable(attachedDatabase, alias);
  }
}

class DriftEntityOutletData extends DataClass
    implements Insertable<DriftEntityOutletData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool active;
  final String name;
  final String address;
  final String phoneNumber;
  final String receiptMessage;
  const DriftEntityOutletData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.active,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.receiptMessage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['active'] = Variable<bool>(active);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['receipt_message'] = Variable<String>(receiptMessage);
    return map;
  }

  DriftEntityOutletCompanion toCompanion(bool nullToAbsent) {
    return DriftEntityOutletCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      active: Value(active),
      name: Value(name),
      address: Value(address),
      phoneNumber: Value(phoneNumber),
      receiptMessage: Value(receiptMessage),
    );
  }

  factory DriftEntityOutletData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftEntityOutletData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      active: serializer.fromJson<bool>(json['active']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      receiptMessage: serializer.fromJson<String>(json['receiptMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'active': serializer.toJson<bool>(active),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'receiptMessage': serializer.toJson<String>(receiptMessage),
    };
  }

  DriftEntityOutletData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? active,
          String? name,
          String? address,
          String? phoneNumber,
          String? receiptMessage}) =>
      DriftEntityOutletData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        active: active ?? this.active,
        name: name ?? this.name,
        address: address ?? this.address,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        receiptMessage: receiptMessage ?? this.receiptMessage,
      );
  DriftEntityOutletData copyWithCompanion(DriftEntityOutletCompanion data) {
    return DriftEntityOutletData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      active: data.active.present ? data.active.value : this.active,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      receiptMessage: data.receiptMessage.present
          ? data.receiptMessage.value
          : this.receiptMessage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityOutletData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('active: $active, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('receiptMessage: $receiptMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, active, name,
      address, phoneNumber, receiptMessage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftEntityOutletData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.active == this.active &&
          other.name == this.name &&
          other.address == this.address &&
          other.phoneNumber == this.phoneNumber &&
          other.receiptMessage == this.receiptMessage);
}

class DriftEntityOutletCompanion
    extends UpdateCompanion<DriftEntityOutletData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> active;
  final Value<String> name;
  final Value<String> address;
  final Value<String> phoneNumber;
  final Value<String> receiptMessage;
  const DriftEntityOutletCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.active = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.receiptMessage = const Value.absent(),
  });
  DriftEntityOutletCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.active = const Value.absent(),
    required String name,
    required String address,
    required String phoneNumber,
    required String receiptMessage,
  })  : name = Value(name),
        address = Value(address),
        phoneNumber = Value(phoneNumber),
        receiptMessage = Value(receiptMessage);
  static Insertable<DriftEntityOutletData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? active,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? phoneNumber,
    Expression<String>? receiptMessage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (active != null) 'active': active,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (receiptMessage != null) 'receipt_message': receiptMessage,
    });
  }

  DriftEntityOutletCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? active,
      Value<String>? name,
      Value<String>? address,
      Value<String>? phoneNumber,
      Value<String>? receiptMessage}) {
    return DriftEntityOutletCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      active: active ?? this.active,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      receiptMessage: receiptMessage ?? this.receiptMessage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (receiptMessage.present) {
      map['receipt_message'] = Variable<String>(receiptMessage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityOutletCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('active: $active, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('receiptMessage: $receiptMessage')
          ..write(')'))
        .toString();
  }
}

class $DriftEntityProductCategoryTable extends DriftEntityProductCategory
    with
        TableInfo<$DriftEntityProductCategoryTable,
            DriftEntityProductCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftEntityProductCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _outletMeta = const VerificationMeta('outlet');
  @override
  late final GeneratedColumn<int> outlet = GeneratedColumn<int>(
      'outlet', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_entity_outlet (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, active, name, outlet];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_entity_product_category';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftEntityProductCategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('outlet')) {
      context.handle(_outletMeta,
          outlet.isAcceptableOrUnknown(data['outlet']!, _outletMeta));
    } else if (isInserting) {
      context.missing(_outletMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftEntityProductCategoryData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftEntityProductCategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      outlet: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}outlet'])!,
    );
  }

  @override
  $DriftEntityProductCategoryTable createAlias(String alias) {
    return $DriftEntityProductCategoryTable(attachedDatabase, alias);
  }
}

class DriftEntityProductCategoryData extends DataClass
    implements Insertable<DriftEntityProductCategoryData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool active;
  final String name;
  final int outlet;
  const DriftEntityProductCategoryData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.active,
      required this.name,
      required this.outlet});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['active'] = Variable<bool>(active);
    map['name'] = Variable<String>(name);
    map['outlet'] = Variable<int>(outlet);
    return map;
  }

  DriftEntityProductCategoryCompanion toCompanion(bool nullToAbsent) {
    return DriftEntityProductCategoryCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      active: Value(active),
      name: Value(name),
      outlet: Value(outlet),
    );
  }

  factory DriftEntityProductCategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftEntityProductCategoryData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      active: serializer.fromJson<bool>(json['active']),
      name: serializer.fromJson<String>(json['name']),
      outlet: serializer.fromJson<int>(json['outlet']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'active': serializer.toJson<bool>(active),
      'name': serializer.toJson<String>(name),
      'outlet': serializer.toJson<int>(outlet),
    };
  }

  DriftEntityProductCategoryData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? active,
          String? name,
          int? outlet}) =>
      DriftEntityProductCategoryData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        active: active ?? this.active,
        name: name ?? this.name,
        outlet: outlet ?? this.outlet,
      );
  DriftEntityProductCategoryData copyWithCompanion(
      DriftEntityProductCategoryCompanion data) {
    return DriftEntityProductCategoryData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      active: data.active.present ? data.active.value : this.active,
      name: data.name.present ? data.name.value : this.name,
      outlet: data.outlet.present ? data.outlet.value : this.outlet,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityProductCategoryData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('active: $active, ')
          ..write('name: $name, ')
          ..write('outlet: $outlet')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, active, name, outlet);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftEntityProductCategoryData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.active == this.active &&
          other.name == this.name &&
          other.outlet == this.outlet);
}

class DriftEntityProductCategoryCompanion
    extends UpdateCompanion<DriftEntityProductCategoryData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> active;
  final Value<String> name;
  final Value<int> outlet;
  const DriftEntityProductCategoryCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.active = const Value.absent(),
    this.name = const Value.absent(),
    this.outlet = const Value.absent(),
  });
  DriftEntityProductCategoryCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.active = const Value.absent(),
    required String name,
    required int outlet,
  })  : name = Value(name),
        outlet = Value(outlet);
  static Insertable<DriftEntityProductCategoryData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? active,
    Expression<String>? name,
    Expression<int>? outlet,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (active != null) 'active': active,
      if (name != null) 'name': name,
      if (outlet != null) 'outlet': outlet,
    });
  }

  DriftEntityProductCategoryCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? active,
      Value<String>? name,
      Value<int>? outlet}) {
    return DriftEntityProductCategoryCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      active: active ?? this.active,
      name: name ?? this.name,
      outlet: outlet ?? this.outlet,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (outlet.present) {
      map['outlet'] = Variable<int>(outlet.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityProductCategoryCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('active: $active, ')
          ..write('name: $name, ')
          ..write('outlet: $outlet')
          ..write(')'))
        .toString();
  }
}

class $DriftEntityProductTable extends DriftEntityProduct
    with TableInfo<$DriftEntityProductTable, DriftEntityProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftEntityProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameInReceiptMeta =
      const VerificationMeta('nameInReceipt');
  @override
  late final GeneratedColumn<String> nameInReceipt = GeneratedColumn<String>(
      'name_in_receipt', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _outletMeta = const VerificationMeta('outlet');
  @override
  late final GeneratedColumn<int> outlet = GeneratedColumn<int>(
      'outlet', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_entity_outlet (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, active, name, nameInReceipt, code, outlet];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_entity_product';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftEntityProductData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_in_receipt')) {
      context.handle(
          _nameInReceiptMeta,
          nameInReceipt.isAcceptableOrUnknown(
              data['name_in_receipt']!, _nameInReceiptMeta));
    } else if (isInserting) {
      context.missing(_nameInReceiptMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('outlet')) {
      context.handle(_outletMeta,
          outlet.isAcceptableOrUnknown(data['outlet']!, _outletMeta));
    } else if (isInserting) {
      context.missing(_outletMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftEntityProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftEntityProductData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      nameInReceipt: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}name_in_receipt'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      outlet: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}outlet'])!,
    );
  }

  @override
  $DriftEntityProductTable createAlias(String alias) {
    return $DriftEntityProductTable(attachedDatabase, alias);
  }
}

class DriftEntityProductData extends DataClass
    implements Insertable<DriftEntityProductData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool active;
  final String name;
  final String nameInReceipt;
  final String code;
  final int outlet;
  const DriftEntityProductData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.active,
      required this.name,
      required this.nameInReceipt,
      required this.code,
      required this.outlet});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['active'] = Variable<bool>(active);
    map['name'] = Variable<String>(name);
    map['name_in_receipt'] = Variable<String>(nameInReceipt);
    map['code'] = Variable<String>(code);
    map['outlet'] = Variable<int>(outlet);
    return map;
  }

  DriftEntityProductCompanion toCompanion(bool nullToAbsent) {
    return DriftEntityProductCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      active: Value(active),
      name: Value(name),
      nameInReceipt: Value(nameInReceipt),
      code: Value(code),
      outlet: Value(outlet),
    );
  }

  factory DriftEntityProductData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftEntityProductData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      active: serializer.fromJson<bool>(json['active']),
      name: serializer.fromJson<String>(json['name']),
      nameInReceipt: serializer.fromJson<String>(json['nameInReceipt']),
      code: serializer.fromJson<String>(json['code']),
      outlet: serializer.fromJson<int>(json['outlet']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'active': serializer.toJson<bool>(active),
      'name': serializer.toJson<String>(name),
      'nameInReceipt': serializer.toJson<String>(nameInReceipt),
      'code': serializer.toJson<String>(code),
      'outlet': serializer.toJson<int>(outlet),
    };
  }

  DriftEntityProductData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? active,
          String? name,
          String? nameInReceipt,
          String? code,
          int? outlet}) =>
      DriftEntityProductData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        active: active ?? this.active,
        name: name ?? this.name,
        nameInReceipt: nameInReceipt ?? this.nameInReceipt,
        code: code ?? this.code,
        outlet: outlet ?? this.outlet,
      );
  DriftEntityProductData copyWithCompanion(DriftEntityProductCompanion data) {
    return DriftEntityProductData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      active: data.active.present ? data.active.value : this.active,
      name: data.name.present ? data.name.value : this.name,
      nameInReceipt: data.nameInReceipt.present
          ? data.nameInReceipt.value
          : this.nameInReceipt,
      code: data.code.present ? data.code.value : this.code,
      outlet: data.outlet.present ? data.outlet.value : this.outlet,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityProductData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('active: $active, ')
          ..write('name: $name, ')
          ..write('nameInReceipt: $nameInReceipt, ')
          ..write('code: $code, ')
          ..write('outlet: $outlet')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, createdAt, updatedAt, active, name, nameInReceipt, code, outlet);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftEntityProductData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.active == this.active &&
          other.name == this.name &&
          other.nameInReceipt == this.nameInReceipt &&
          other.code == this.code &&
          other.outlet == this.outlet);
}

class DriftEntityProductCompanion
    extends UpdateCompanion<DriftEntityProductData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> active;
  final Value<String> name;
  final Value<String> nameInReceipt;
  final Value<String> code;
  final Value<int> outlet;
  const DriftEntityProductCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.active = const Value.absent(),
    this.name = const Value.absent(),
    this.nameInReceipt = const Value.absent(),
    this.code = const Value.absent(),
    this.outlet = const Value.absent(),
  });
  DriftEntityProductCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.active = const Value.absent(),
    required String name,
    required String nameInReceipt,
    required String code,
    required int outlet,
  })  : name = Value(name),
        nameInReceipt = Value(nameInReceipt),
        code = Value(code),
        outlet = Value(outlet);
  static Insertable<DriftEntityProductData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? active,
    Expression<String>? name,
    Expression<String>? nameInReceipt,
    Expression<String>? code,
    Expression<int>? outlet,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (active != null) 'active': active,
      if (name != null) 'name': name,
      if (nameInReceipt != null) 'name_in_receipt': nameInReceipt,
      if (code != null) 'code': code,
      if (outlet != null) 'outlet': outlet,
    });
  }

  DriftEntityProductCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? active,
      Value<String>? name,
      Value<String>? nameInReceipt,
      Value<String>? code,
      Value<int>? outlet}) {
    return DriftEntityProductCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      active: active ?? this.active,
      name: name ?? this.name,
      nameInReceipt: nameInReceipt ?? this.nameInReceipt,
      code: code ?? this.code,
      outlet: outlet ?? this.outlet,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameInReceipt.present) {
      map['name_in_receipt'] = Variable<String>(nameInReceipt.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (outlet.present) {
      map['outlet'] = Variable<int>(outlet.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityProductCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('active: $active, ')
          ..write('name: $name, ')
          ..write('nameInReceipt: $nameInReceipt, ')
          ..write('code: $code, ')
          ..write('outlet: $outlet')
          ..write(')'))
        .toString();
  }
}

class $DriftEntityProductRevisionTable extends DriftEntityProductRevision
    with
        TableInfo<$DriftEntityProductRevisionTable,
            DriftEntityProductRevisionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftEntityProductRevisionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _numberOfRevisionMeta =
      const VerificationMeta('numberOfRevision');
  @override
  late final GeneratedColumn<int> numberOfRevision = GeneratedColumn<int>(
      'number_of_revision', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumn<int> product = GeneratedColumn<int>(
      'product', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_entity_product (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, active, numberOfRevision, price, product];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_entity_product_revision';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftEntityProductRevisionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('number_of_revision')) {
      context.handle(
          _numberOfRevisionMeta,
          numberOfRevision.isAcceptableOrUnknown(
              data['number_of_revision']!, _numberOfRevisionMeta));
    } else if (isInserting) {
      context.missing(_numberOfRevisionMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product']!, _productMeta));
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftEntityProductRevisionData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftEntityProductRevisionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      numberOfRevision: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}number_of_revision'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      product: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product'])!,
    );
  }

  @override
  $DriftEntityProductRevisionTable createAlias(String alias) {
    return $DriftEntityProductRevisionTable(attachedDatabase, alias);
  }
}

class DriftEntityProductRevisionData extends DataClass
    implements Insertable<DriftEntityProductRevisionData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool active;
  final int numberOfRevision;
  final double price;
  final int product;
  const DriftEntityProductRevisionData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.active,
      required this.numberOfRevision,
      required this.price,
      required this.product});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['active'] = Variable<bool>(active);
    map['number_of_revision'] = Variable<int>(numberOfRevision);
    map['price'] = Variable<double>(price);
    map['product'] = Variable<int>(product);
    return map;
  }

  DriftEntityProductRevisionCompanion toCompanion(bool nullToAbsent) {
    return DriftEntityProductRevisionCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      active: Value(active),
      numberOfRevision: Value(numberOfRevision),
      price: Value(price),
      product: Value(product),
    );
  }

  factory DriftEntityProductRevisionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftEntityProductRevisionData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      active: serializer.fromJson<bool>(json['active']),
      numberOfRevision: serializer.fromJson<int>(json['numberOfRevision']),
      price: serializer.fromJson<double>(json['price']),
      product: serializer.fromJson<int>(json['product']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'active': serializer.toJson<bool>(active),
      'numberOfRevision': serializer.toJson<int>(numberOfRevision),
      'price': serializer.toJson<double>(price),
      'product': serializer.toJson<int>(product),
    };
  }

  DriftEntityProductRevisionData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? active,
          int? numberOfRevision,
          double? price,
          int? product}) =>
      DriftEntityProductRevisionData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        active: active ?? this.active,
        numberOfRevision: numberOfRevision ?? this.numberOfRevision,
        price: price ?? this.price,
        product: product ?? this.product,
      );
  DriftEntityProductRevisionData copyWithCompanion(
      DriftEntityProductRevisionCompanion data) {
    return DriftEntityProductRevisionData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      active: data.active.present ? data.active.value : this.active,
      numberOfRevision: data.numberOfRevision.present
          ? data.numberOfRevision.value
          : this.numberOfRevision,
      price: data.price.present ? data.price.value : this.price,
      product: data.product.present ? data.product.value : this.product,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityProductRevisionData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('active: $active, ')
          ..write('numberOfRevision: $numberOfRevision, ')
          ..write('price: $price, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, createdAt, updatedAt, active, numberOfRevision, price, product);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftEntityProductRevisionData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.active == this.active &&
          other.numberOfRevision == this.numberOfRevision &&
          other.price == this.price &&
          other.product == this.product);
}

class DriftEntityProductRevisionCompanion
    extends UpdateCompanion<DriftEntityProductRevisionData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> active;
  final Value<int> numberOfRevision;
  final Value<double> price;
  final Value<int> product;
  const DriftEntityProductRevisionCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.active = const Value.absent(),
    this.numberOfRevision = const Value.absent(),
    this.price = const Value.absent(),
    this.product = const Value.absent(),
  });
  DriftEntityProductRevisionCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.active = const Value.absent(),
    required int numberOfRevision,
    required double price,
    required int product,
  })  : numberOfRevision = Value(numberOfRevision),
        price = Value(price),
        product = Value(product);
  static Insertable<DriftEntityProductRevisionData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? active,
    Expression<int>? numberOfRevision,
    Expression<double>? price,
    Expression<int>? product,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (active != null) 'active': active,
      if (numberOfRevision != null) 'number_of_revision': numberOfRevision,
      if (price != null) 'price': price,
      if (product != null) 'product': product,
    });
  }

  DriftEntityProductRevisionCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? active,
      Value<int>? numberOfRevision,
      Value<double>? price,
      Value<int>? product}) {
    return DriftEntityProductRevisionCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      active: active ?? this.active,
      numberOfRevision: numberOfRevision ?? this.numberOfRevision,
      price: price ?? this.price,
      product: product ?? this.product,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (numberOfRevision.present) {
      map['number_of_revision'] = Variable<int>(numberOfRevision.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (product.present) {
      map['product'] = Variable<int>(product.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityProductRevisionCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('active: $active, ')
          ..write('numberOfRevision: $numberOfRevision, ')
          ..write('price: $price, ')
          ..write('product: $product')
          ..write(')'))
        .toString();
  }
}

class $DriftEntityPaymentMethodTable extends DriftEntityPaymentMethod
    with
        TableInfo<$DriftEntityPaymentMethodTable,
            DriftEntityPaymentMethodData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftEntityPaymentMethodTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sameAsAmountMeta =
      const VerificationMeta('sameAsAmount');
  @override
  late final GeneratedColumn<bool> sameAsAmount = GeneratedColumn<bool>(
      'same_as_amount', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("same_as_amount" IN (0, 1))'));
  static const VerificationMeta _outletMeta = const VerificationMeta('outlet');
  @override
  late final GeneratedColumn<int> outlet = GeneratedColumn<int>(
      'outlet', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_entity_outlet (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, active, name, sameAsAmount, outlet];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_entity_payment_method';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftEntityPaymentMethodData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('same_as_amount')) {
      context.handle(
          _sameAsAmountMeta,
          sameAsAmount.isAcceptableOrUnknown(
              data['same_as_amount']!, _sameAsAmountMeta));
    } else if (isInserting) {
      context.missing(_sameAsAmountMeta);
    }
    if (data.containsKey('outlet')) {
      context.handle(_outletMeta,
          outlet.isAcceptableOrUnknown(data['outlet']!, _outletMeta));
    } else if (isInserting) {
      context.missing(_outletMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftEntityPaymentMethodData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftEntityPaymentMethodData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sameAsAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}same_as_amount'])!,
      outlet: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}outlet'])!,
    );
  }

  @override
  $DriftEntityPaymentMethodTable createAlias(String alias) {
    return $DriftEntityPaymentMethodTable(attachedDatabase, alias);
  }
}

class DriftEntityPaymentMethodData extends DataClass
    implements Insertable<DriftEntityPaymentMethodData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool active;
  final String name;
  final bool sameAsAmount;
  final int outlet;
  const DriftEntityPaymentMethodData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.active,
      required this.name,
      required this.sameAsAmount,
      required this.outlet});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['active'] = Variable<bool>(active);
    map['name'] = Variable<String>(name);
    map['same_as_amount'] = Variable<bool>(sameAsAmount);
    map['outlet'] = Variable<int>(outlet);
    return map;
  }

  DriftEntityPaymentMethodCompanion toCompanion(bool nullToAbsent) {
    return DriftEntityPaymentMethodCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      active: Value(active),
      name: Value(name),
      sameAsAmount: Value(sameAsAmount),
      outlet: Value(outlet),
    );
  }

  factory DriftEntityPaymentMethodData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftEntityPaymentMethodData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      active: serializer.fromJson<bool>(json['active']),
      name: serializer.fromJson<String>(json['name']),
      sameAsAmount: serializer.fromJson<bool>(json['sameAsAmount']),
      outlet: serializer.fromJson<int>(json['outlet']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'active': serializer.toJson<bool>(active),
      'name': serializer.toJson<String>(name),
      'sameAsAmount': serializer.toJson<bool>(sameAsAmount),
      'outlet': serializer.toJson<int>(outlet),
    };
  }

  DriftEntityPaymentMethodData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? active,
          String? name,
          bool? sameAsAmount,
          int? outlet}) =>
      DriftEntityPaymentMethodData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        active: active ?? this.active,
        name: name ?? this.name,
        sameAsAmount: sameAsAmount ?? this.sameAsAmount,
        outlet: outlet ?? this.outlet,
      );
  DriftEntityPaymentMethodData copyWithCompanion(
      DriftEntityPaymentMethodCompanion data) {
    return DriftEntityPaymentMethodData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      active: data.active.present ? data.active.value : this.active,
      name: data.name.present ? data.name.value : this.name,
      sameAsAmount: data.sameAsAmount.present
          ? data.sameAsAmount.value
          : this.sameAsAmount,
      outlet: data.outlet.present ? data.outlet.value : this.outlet,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityPaymentMethodData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('active: $active, ')
          ..write('name: $name, ')
          ..write('sameAsAmount: $sameAsAmount, ')
          ..write('outlet: $outlet')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, active, name, sameAsAmount, outlet);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftEntityPaymentMethodData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.active == this.active &&
          other.name == this.name &&
          other.sameAsAmount == this.sameAsAmount &&
          other.outlet == this.outlet);
}

class DriftEntityPaymentMethodCompanion
    extends UpdateCompanion<DriftEntityPaymentMethodData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> active;
  final Value<String> name;
  final Value<bool> sameAsAmount;
  final Value<int> outlet;
  const DriftEntityPaymentMethodCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.active = const Value.absent(),
    this.name = const Value.absent(),
    this.sameAsAmount = const Value.absent(),
    this.outlet = const Value.absent(),
  });
  DriftEntityPaymentMethodCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.active = const Value.absent(),
    required String name,
    required bool sameAsAmount,
    required int outlet,
  })  : name = Value(name),
        sameAsAmount = Value(sameAsAmount),
        outlet = Value(outlet);
  static Insertable<DriftEntityPaymentMethodData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? active,
    Expression<String>? name,
    Expression<bool>? sameAsAmount,
    Expression<int>? outlet,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (active != null) 'active': active,
      if (name != null) 'name': name,
      if (sameAsAmount != null) 'same_as_amount': sameAsAmount,
      if (outlet != null) 'outlet': outlet,
    });
  }

  DriftEntityPaymentMethodCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? active,
      Value<String>? name,
      Value<bool>? sameAsAmount,
      Value<int>? outlet}) {
    return DriftEntityPaymentMethodCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      active: active ?? this.active,
      name: name ?? this.name,
      sameAsAmount: sameAsAmount ?? this.sameAsAmount,
      outlet: outlet ?? this.outlet,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sameAsAmount.present) {
      map['same_as_amount'] = Variable<bool>(sameAsAmount.value);
    }
    if (outlet.present) {
      map['outlet'] = Variable<int>(outlet.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityPaymentMethodCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('active: $active, ')
          ..write('name: $name, ')
          ..write('sameAsAmount: $sameAsAmount, ')
          ..write('outlet: $outlet')
          ..write(')'))
        .toString();
  }
}

class $DriftRelationProductProductCategoryTable
    extends DriftRelationProductProductCategory
    with
        TableInfo<$DriftRelationProductProductCategoryTable,
            DriftRelationProductProductCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftRelationProductProductCategoryTable(this.attachedDatabase,
      [this._alias]);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_entity_product_category (id)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_entity_product (id)'));
  @override
  List<GeneratedColumn> get $columns => [categoryId, productId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_relation_product_product_category';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftRelationProductProductCategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryId, productId};
  @override
  DriftRelationProductProductCategoryData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftRelationProductProductCategoryData(
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
    );
  }

  @override
  $DriftRelationProductProductCategoryTable createAlias(String alias) {
    return $DriftRelationProductProductCategoryTable(attachedDatabase, alias);
  }
}

class DriftRelationProductProductCategoryData extends DataClass
    implements Insertable<DriftRelationProductProductCategoryData> {
  final int categoryId;
  final int productId;
  const DriftRelationProductProductCategoryData(
      {required this.categoryId, required this.productId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category_id'] = Variable<int>(categoryId);
    map['product_id'] = Variable<int>(productId);
    return map;
  }

  DriftRelationProductProductCategoryCompanion toCompanion(bool nullToAbsent) {
    return DriftRelationProductProductCategoryCompanion(
      categoryId: Value(categoryId),
      productId: Value(productId),
    );
  }

  factory DriftRelationProductProductCategoryData.fromJson(
      Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftRelationProductProductCategoryData(
      categoryId: serializer.fromJson<int>(json['categoryId']),
      productId: serializer.fromJson<int>(json['productId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryId': serializer.toJson<int>(categoryId),
      'productId': serializer.toJson<int>(productId),
    };
  }

  DriftRelationProductProductCategoryData copyWith(
          {int? categoryId, int? productId}) =>
      DriftRelationProductProductCategoryData(
        categoryId: categoryId ?? this.categoryId,
        productId: productId ?? this.productId,
      );
  DriftRelationProductProductCategoryData copyWithCompanion(
      DriftRelationProductProductCategoryCompanion data) {
    return DriftRelationProductProductCategoryData(
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      productId: data.productId.present ? data.productId.value : this.productId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftRelationProductProductCategoryData(')
          ..write('categoryId: $categoryId, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(categoryId, productId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftRelationProductProductCategoryData &&
          other.categoryId == this.categoryId &&
          other.productId == this.productId);
}

class DriftRelationProductProductCategoryCompanion
    extends UpdateCompanion<DriftRelationProductProductCategoryData> {
  final Value<int> categoryId;
  final Value<int> productId;
  final Value<int> rowid;
  const DriftRelationProductProductCategoryCompanion({
    this.categoryId = const Value.absent(),
    this.productId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftRelationProductProductCategoryCompanion.insert({
    required int categoryId,
    required int productId,
    this.rowid = const Value.absent(),
  })  : categoryId = Value(categoryId),
        productId = Value(productId);
  static Insertable<DriftRelationProductProductCategoryData> custom({
    Expression<int>? categoryId,
    Expression<int>? productId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (categoryId != null) 'category_id': categoryId,
      if (productId != null) 'product_id': productId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftRelationProductProductCategoryCompanion copyWith(
      {Value<int>? categoryId, Value<int>? productId, Value<int>? rowid}) {
    return DriftRelationProductProductCategoryCompanion(
      categoryId: categoryId ?? this.categoryId,
      productId: productId ?? this.productId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftRelationProductProductCategoryCompanion(')
          ..write('categoryId: $categoryId, ')
          ..write('productId: $productId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftEntityOrderRowTable extends DriftEntityOrderRow
    with TableInfo<$DriftEntityOrderRowTable, DriftEntityOrderRowData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftEntityOrderRowTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _payAmountMeta =
      const VerificationMeta('payAmount');
  @override
  late final GeneratedColumn<double> payAmount = GeneratedColumn<double>(
      'pay_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<int> paymentMethod = GeneratedColumn<int>(
      'payment_method', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_entity_payment_method (id)'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<OrderStatus, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<OrderStatus>(
              $DriftEntityOrderRowTable.$converterstatus);
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
      'total_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _totalQuantityMeta =
      const VerificationMeta('totalQuantity');
  @override
  late final GeneratedColumn<int> totalQuantity = GeneratedColumn<int>(
      'total_quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        payAmount,
        paymentMethod,
        status,
        totalPrice,
        totalQuantity
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_entity_order_row';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftEntityOrderRowData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('pay_amount')) {
      context.handle(_payAmountMeta,
          payAmount.isAcceptableOrUnknown(data['pay_amount']!, _payAmountMeta));
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    }
    if (data.containsKey('total_quantity')) {
      context.handle(
          _totalQuantityMeta,
          totalQuantity.isAcceptableOrUnknown(
              data['total_quantity']!, _totalQuantityMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftEntityOrderRowData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftEntityOrderRowData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      payAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}pay_amount'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payment_method']),
      status: $DriftEntityOrderRowTable.$converterstatus.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_price'])!,
      totalQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_quantity'])!,
    );
  }

  @override
  $DriftEntityOrderRowTable createAlias(String alias) {
    return $DriftEntityOrderRowTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<OrderStatus, String, String> $converterstatus =
      const EnumNameConverter<OrderStatus>(OrderStatus.values);
}

class DriftEntityOrderRowData extends DataClass
    implements Insertable<DriftEntityOrderRowData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double payAmount;
  final int? paymentMethod;
  final OrderStatus status;
  final double totalPrice;
  final int totalQuantity;
  const DriftEntityOrderRowData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.payAmount,
      this.paymentMethod,
      required this.status,
      required this.totalPrice,
      required this.totalQuantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['pay_amount'] = Variable<double>(payAmount);
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<int>(paymentMethod);
    }
    {
      map['status'] = Variable<String>(
          $DriftEntityOrderRowTable.$converterstatus.toSql(status));
    }
    map['total_price'] = Variable<double>(totalPrice);
    map['total_quantity'] = Variable<int>(totalQuantity);
    return map;
  }

  DriftEntityOrderRowCompanion toCompanion(bool nullToAbsent) {
    return DriftEntityOrderRowCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      payAmount: Value(payAmount),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
      status: Value(status),
      totalPrice: Value(totalPrice),
      totalQuantity: Value(totalQuantity),
    );
  }

  factory DriftEntityOrderRowData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftEntityOrderRowData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      payAmount: serializer.fromJson<double>(json['payAmount']),
      paymentMethod: serializer.fromJson<int?>(json['paymentMethod']),
      status: $DriftEntityOrderRowTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
      totalQuantity: serializer.fromJson<int>(json['totalQuantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'payAmount': serializer.toJson<double>(payAmount),
      'paymentMethod': serializer.toJson<int?>(paymentMethod),
      'status': serializer.toJson<String>(
          $DriftEntityOrderRowTable.$converterstatus.toJson(status)),
      'totalPrice': serializer.toJson<double>(totalPrice),
      'totalQuantity': serializer.toJson<int>(totalQuantity),
    };
  }

  DriftEntityOrderRowData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          double? payAmount,
          Value<int?> paymentMethod = const Value.absent(),
          OrderStatus? status,
          double? totalPrice,
          int? totalQuantity}) =>
      DriftEntityOrderRowData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        payAmount: payAmount ?? this.payAmount,
        paymentMethod:
            paymentMethod.present ? paymentMethod.value : this.paymentMethod,
        status: status ?? this.status,
        totalPrice: totalPrice ?? this.totalPrice,
        totalQuantity: totalQuantity ?? this.totalQuantity,
      );
  DriftEntityOrderRowData copyWithCompanion(DriftEntityOrderRowCompanion data) {
    return DriftEntityOrderRowData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      payAmount: data.payAmount.present ? data.payAmount.value : this.payAmount,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      status: data.status.present ? data.status.value : this.status,
      totalPrice:
          data.totalPrice.present ? data.totalPrice.value : this.totalPrice,
      totalQuantity: data.totalQuantity.present
          ? data.totalQuantity.value
          : this.totalQuantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityOrderRowData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('payAmount: $payAmount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('status: $status, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('totalQuantity: $totalQuantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, payAmount,
      paymentMethod, status, totalPrice, totalQuantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftEntityOrderRowData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.payAmount == this.payAmount &&
          other.paymentMethod == this.paymentMethod &&
          other.status == this.status &&
          other.totalPrice == this.totalPrice &&
          other.totalQuantity == this.totalQuantity);
}

class DriftEntityOrderRowCompanion
    extends UpdateCompanion<DriftEntityOrderRowData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<double> payAmount;
  final Value<int?> paymentMethod;
  final Value<OrderStatus> status;
  final Value<double> totalPrice;
  final Value<int> totalQuantity;
  const DriftEntityOrderRowCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.payAmount = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.status = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.totalQuantity = const Value.absent(),
  });
  DriftEntityOrderRowCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.payAmount = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    required OrderStatus status,
    this.totalPrice = const Value.absent(),
    this.totalQuantity = const Value.absent(),
  }) : status = Value(status);
  static Insertable<DriftEntityOrderRowData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<double>? payAmount,
    Expression<int>? paymentMethod,
    Expression<String>? status,
    Expression<double>? totalPrice,
    Expression<int>? totalQuantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (payAmount != null) 'pay_amount': payAmount,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (status != null) 'status': status,
      if (totalPrice != null) 'total_price': totalPrice,
      if (totalQuantity != null) 'total_quantity': totalQuantity,
    });
  }

  DriftEntityOrderRowCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<double>? payAmount,
      Value<int?>? paymentMethod,
      Value<OrderStatus>? status,
      Value<double>? totalPrice,
      Value<int>? totalQuantity}) {
    return DriftEntityOrderRowCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      payAmount: payAmount ?? this.payAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
      totalQuantity: totalQuantity ?? this.totalQuantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (payAmount.present) {
      map['pay_amount'] = Variable<double>(payAmount.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<int>(paymentMethod.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
          $DriftEntityOrderRowTable.$converterstatus.toSql(status.value));
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    if (totalQuantity.present) {
      map['total_quantity'] = Variable<int>(totalQuantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityOrderRowCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('payAmount: $payAmount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('status: $status, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('totalQuantity: $totalQuantity')
          ..write(')'))
        .toString();
  }
}

class $DriftEntityOrderRowItemTable extends DriftEntityOrderRowItem
    with TableInfo<$DriftEntityOrderRowItemTable, DriftEntityOrderRowItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftEntityOrderRowItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderRowMeta =
      const VerificationMeta('orderRow');
  @override
  late final GeneratedColumn<int> orderRow = GeneratedColumn<int>(
      'order_row', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_entity_order_row (id)'));
  static const VerificationMeta _productRevisionMeta =
      const VerificationMeta('productRevision');
  @override
  late final GeneratedColumn<int> productRevision = GeneratedColumn<int>(
      'product_revision', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_entity_product_revision (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, orderRow, productRevision, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_entity_order_row_item';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftEntityOrderRowItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_row')) {
      context.handle(_orderRowMeta,
          orderRow.isAcceptableOrUnknown(data['order_row']!, _orderRowMeta));
    } else if (isInserting) {
      context.missing(_orderRowMeta);
    }
    if (data.containsKey('product_revision')) {
      context.handle(
          _productRevisionMeta,
          productRevision.isAcceptableOrUnknown(
              data['product_revision']!, _productRevisionMeta));
    } else if (isInserting) {
      context.missing(_productRevisionMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftEntityOrderRowItemData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftEntityOrderRowItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      orderRow: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_row'])!,
      productRevision: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_revision'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $DriftEntityOrderRowItemTable createAlias(String alias) {
    return $DriftEntityOrderRowItemTable(attachedDatabase, alias);
  }
}

class DriftEntityOrderRowItemData extends DataClass
    implements Insertable<DriftEntityOrderRowItemData> {
  final int id;
  final int orderRow;
  final int productRevision;
  final int quantity;
  const DriftEntityOrderRowItemData(
      {required this.id,
      required this.orderRow,
      required this.productRevision,
      required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_row'] = Variable<int>(orderRow);
    map['product_revision'] = Variable<int>(productRevision);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  DriftEntityOrderRowItemCompanion toCompanion(bool nullToAbsent) {
    return DriftEntityOrderRowItemCompanion(
      id: Value(id),
      orderRow: Value(orderRow),
      productRevision: Value(productRevision),
      quantity: Value(quantity),
    );
  }

  factory DriftEntityOrderRowItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftEntityOrderRowItemData(
      id: serializer.fromJson<int>(json['id']),
      orderRow: serializer.fromJson<int>(json['orderRow']),
      productRevision: serializer.fromJson<int>(json['productRevision']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderRow': serializer.toJson<int>(orderRow),
      'productRevision': serializer.toJson<int>(productRevision),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  DriftEntityOrderRowItemData copyWith(
          {int? id, int? orderRow, int? productRevision, int? quantity}) =>
      DriftEntityOrderRowItemData(
        id: id ?? this.id,
        orderRow: orderRow ?? this.orderRow,
        productRevision: productRevision ?? this.productRevision,
        quantity: quantity ?? this.quantity,
      );
  DriftEntityOrderRowItemData copyWithCompanion(
      DriftEntityOrderRowItemCompanion data) {
    return DriftEntityOrderRowItemData(
      id: data.id.present ? data.id.value : this.id,
      orderRow: data.orderRow.present ? data.orderRow.value : this.orderRow,
      productRevision: data.productRevision.present
          ? data.productRevision.value
          : this.productRevision,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityOrderRowItemData(')
          ..write('id: $id, ')
          ..write('orderRow: $orderRow, ')
          ..write('productRevision: $productRevision, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, orderRow, productRevision, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftEntityOrderRowItemData &&
          other.id == this.id &&
          other.orderRow == this.orderRow &&
          other.productRevision == this.productRevision &&
          other.quantity == this.quantity);
}

class DriftEntityOrderRowItemCompanion
    extends UpdateCompanion<DriftEntityOrderRowItemData> {
  final Value<int> id;
  final Value<int> orderRow;
  final Value<int> productRevision;
  final Value<int> quantity;
  const DriftEntityOrderRowItemCompanion({
    this.id = const Value.absent(),
    this.orderRow = const Value.absent(),
    this.productRevision = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  DriftEntityOrderRowItemCompanion.insert({
    this.id = const Value.absent(),
    required int orderRow,
    required int productRevision,
    required int quantity,
  })  : orderRow = Value(orderRow),
        productRevision = Value(productRevision),
        quantity = Value(quantity);
  static Insertable<DriftEntityOrderRowItemData> custom({
    Expression<int>? id,
    Expression<int>? orderRow,
    Expression<int>? productRevision,
    Expression<int>? quantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderRow != null) 'order_row': orderRow,
      if (productRevision != null) 'product_revision': productRevision,
      if (quantity != null) 'quantity': quantity,
    });
  }

  DriftEntityOrderRowItemCompanion copyWith(
      {Value<int>? id,
      Value<int>? orderRow,
      Value<int>? productRevision,
      Value<int>? quantity}) {
    return DriftEntityOrderRowItemCompanion(
      id: id ?? this.id,
      orderRow: orderRow ?? this.orderRow,
      productRevision: productRevision ?? this.productRevision,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderRow.present) {
      map['order_row'] = Variable<int>(orderRow.value);
    }
    if (productRevision.present) {
      map['product_revision'] = Variable<int>(productRevision.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftEntityOrderRowItemCompanion(')
          ..write('id: $id, ')
          ..write('orderRow: $orderRow, ')
          ..write('productRevision: $productRevision, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

abstract class _$InstanceDB extends GeneratedDatabase {
  _$InstanceDB(QueryExecutor e) : super(e);
  $InstanceDBManager get managers => $InstanceDBManager(this);
  late final $DriftEntityOutletTable driftEntityOutlet =
      $DriftEntityOutletTable(this);
  late final $DriftEntityProductCategoryTable driftEntityProductCategory =
      $DriftEntityProductCategoryTable(this);
  late final $DriftEntityProductTable driftEntityProduct =
      $DriftEntityProductTable(this);
  late final $DriftEntityProductRevisionTable driftEntityProductRevision =
      $DriftEntityProductRevisionTable(this);
  late final $DriftEntityPaymentMethodTable driftEntityPaymentMethod =
      $DriftEntityPaymentMethodTable(this);
  late final $DriftRelationProductProductCategoryTable
      driftRelationProductProductCategory =
      $DriftRelationProductProductCategoryTable(this);
  late final $DriftEntityOrderRowTable driftEntityOrderRow =
      $DriftEntityOrderRowTable(this);
  late final $DriftEntityOrderRowItemTable driftEntityOrderRowItem =
      $DriftEntityOrderRowItemTable(this);
  late final Index idxOrderRowCreatedAt = Index('idx_order_row_created_at',
      'CREATE INDEX idx_order_row_created_at ON drift_entity_order_row (created_at)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        driftEntityOutlet,
        driftEntityProductCategory,
        driftEntityProduct,
        driftEntityProductRevision,
        driftEntityPaymentMethod,
        driftRelationProductProductCategory,
        driftEntityOrderRow,
        driftEntityOrderRowItem,
        idxOrderRowCreatedAt
      ];
}

typedef $$DriftEntityOutletTableCreateCompanionBuilder
    = DriftEntityOutletCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> active,
  required String name,
  required String address,
  required String phoneNumber,
  required String receiptMessage,
});
typedef $$DriftEntityOutletTableUpdateCompanionBuilder
    = DriftEntityOutletCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> active,
  Value<String> name,
  Value<String> address,
  Value<String> phoneNumber,
  Value<String> receiptMessage,
});

final class $$DriftEntityOutletTableReferences extends BaseReferences<
    _$InstanceDB, $DriftEntityOutletTable, DriftEntityOutletData> {
  $$DriftEntityOutletTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DriftEntityProductCategoryTable,
          List<DriftEntityProductCategoryData>>
      _driftEntityProductCategoryRefsTable(_$InstanceDB db) =>
          MultiTypedResultKey.fromTable(db.driftEntityProductCategory,
              aliasName: $_aliasNameGenerator(db.driftEntityOutlet.id,
                  db.driftEntityProductCategory.outlet));

  $$DriftEntityProductCategoryTableProcessedTableManager
      get driftEntityProductCategoryRefs {
    final manager = $$DriftEntityProductCategoryTableTableManager(
            $_db, $_db.driftEntityProductCategory)
        .filter((f) => f.outlet.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_driftEntityProductCategoryRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DriftEntityProductTable,
      List<DriftEntityProductData>> _driftEntityProductRefsTable(
          _$InstanceDB db) =>
      MultiTypedResultKey.fromTable(db.driftEntityProduct,
          aliasName: $_aliasNameGenerator(
              db.driftEntityOutlet.id, db.driftEntityProduct.outlet));

  $$DriftEntityProductTableProcessedTableManager get driftEntityProductRefs {
    final manager =
        $$DriftEntityProductTableTableManager($_db, $_db.driftEntityProduct)
            .filter((f) => f.outlet.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_driftEntityProductRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DriftEntityPaymentMethodTable,
      List<DriftEntityPaymentMethodData>> _driftEntityPaymentMethodRefsTable(
          _$InstanceDB db) =>
      MultiTypedResultKey.fromTable(db.driftEntityPaymentMethod,
          aliasName: $_aliasNameGenerator(
              db.driftEntityOutlet.id, db.driftEntityPaymentMethod.outlet));

  $$DriftEntityPaymentMethodTableProcessedTableManager
      get driftEntityPaymentMethodRefs {
    final manager = $$DriftEntityPaymentMethodTableTableManager(
            $_db, $_db.driftEntityPaymentMethod)
        .filter((f) => f.outlet.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_driftEntityPaymentMethodRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftEntityOutletTableFilterComposer
    extends Composer<_$InstanceDB, $DriftEntityOutletTable> {
  $$DriftEntityOutletTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiptMessage => $composableBuilder(
      column: $table.receiptMessage,
      builder: (column) => ColumnFilters(column));

  Expression<bool> driftEntityProductCategoryRefs(
      Expression<bool> Function(
              $$DriftEntityProductCategoryTableFilterComposer f)
          f) {
    final $$DriftEntityProductCategoryTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityProductCategory,
            getReferencedColumn: (t) => t.outlet,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductCategoryTableFilterComposer(
                  $db: $db,
                  $table: $db.driftEntityProductCategory,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> driftEntityProductRefs(
      Expression<bool> Function($$DriftEntityProductTableFilterComposer f) f) {
    final $$DriftEntityProductTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.driftEntityProduct,
        getReferencedColumn: (t) => t.outlet,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityProductTableFilterComposer(
              $db: $db,
              $table: $db.driftEntityProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> driftEntityPaymentMethodRefs(
      Expression<bool> Function($$DriftEntityPaymentMethodTableFilterComposer f)
          f) {
    final $$DriftEntityPaymentMethodTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityPaymentMethod,
            getReferencedColumn: (t) => t.outlet,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityPaymentMethodTableFilterComposer(
                  $db: $db,
                  $table: $db.driftEntityPaymentMethod,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DriftEntityOutletTableOrderingComposer
    extends Composer<_$InstanceDB, $DriftEntityOutletTable> {
  $$DriftEntityOutletTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiptMessage => $composableBuilder(
      column: $table.receiptMessage,
      builder: (column) => ColumnOrderings(column));
}

class $$DriftEntityOutletTableAnnotationComposer
    extends Composer<_$InstanceDB, $DriftEntityOutletTable> {
  $$DriftEntityOutletTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get receiptMessage => $composableBuilder(
      column: $table.receiptMessage, builder: (column) => column);

  Expression<T> driftEntityProductCategoryRefs<T extends Object>(
      Expression<T> Function(
              $$DriftEntityProductCategoryTableAnnotationComposer a)
          f) {
    final $$DriftEntityProductCategoryTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityProductCategory,
            getReferencedColumn: (t) => t.outlet,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductCategoryTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityProductCategory,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> driftEntityProductRefs<T extends Object>(
      Expression<T> Function($$DriftEntityProductTableAnnotationComposer a) f) {
    final $$DriftEntityProductTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityProduct,
            getReferencedColumn: (t) => t.outlet,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityProduct,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> driftEntityPaymentMethodRefs<T extends Object>(
      Expression<T> Function(
              $$DriftEntityPaymentMethodTableAnnotationComposer a)
          f) {
    final $$DriftEntityPaymentMethodTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityPaymentMethod,
            getReferencedColumn: (t) => t.outlet,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityPaymentMethodTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityPaymentMethod,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DriftEntityOutletTableTableManager extends RootTableManager<
    _$InstanceDB,
    $DriftEntityOutletTable,
    DriftEntityOutletData,
    $$DriftEntityOutletTableFilterComposer,
    $$DriftEntityOutletTableOrderingComposer,
    $$DriftEntityOutletTableAnnotationComposer,
    $$DriftEntityOutletTableCreateCompanionBuilder,
    $$DriftEntityOutletTableUpdateCompanionBuilder,
    (DriftEntityOutletData, $$DriftEntityOutletTableReferences),
    DriftEntityOutletData,
    PrefetchHooks Function(
        {bool driftEntityProductCategoryRefs,
        bool driftEntityProductRefs,
        bool driftEntityPaymentMethodRefs})> {
  $$DriftEntityOutletTableTableManager(
      _$InstanceDB db, $DriftEntityOutletTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriftEntityOutletTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DriftEntityOutletTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriftEntityOutletTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<String> receiptMessage = const Value.absent(),
          }) =>
              DriftEntityOutletCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            active: active,
            name: name,
            address: address,
            phoneNumber: phoneNumber,
            receiptMessage: receiptMessage,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> active = const Value.absent(),
            required String name,
            required String address,
            required String phoneNumber,
            required String receiptMessage,
          }) =>
              DriftEntityOutletCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            active: active,
            name: name,
            address: address,
            phoneNumber: phoneNumber,
            receiptMessage: receiptMessage,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftEntityOutletTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {driftEntityProductCategoryRefs = false,
              driftEntityProductRefs = false,
              driftEntityPaymentMethodRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftEntityProductCategoryRefs)
                  db.driftEntityProductCategory,
                if (driftEntityProductRefs) db.driftEntityProduct,
                if (driftEntityPaymentMethodRefs) db.driftEntityPaymentMethod
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftEntityProductCategoryRefs)
                    await $_getPrefetchedData<
                            DriftEntityOutletData,
                            $DriftEntityOutletTable,
                            DriftEntityProductCategoryData>(
                        currentTable: table,
                        referencedTable: $$DriftEntityOutletTableReferences
                            ._driftEntityProductCategoryRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftEntityOutletTableReferences(db, table, p0)
                                .driftEntityProductCategoryRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.outlet == item.id),
                        typedResults: items),
                  if (driftEntityProductRefs)
                    await $_getPrefetchedData<DriftEntityOutletData,
                            $DriftEntityOutletTable, DriftEntityProductData>(
                        currentTable: table,
                        referencedTable: $$DriftEntityOutletTableReferences
                            ._driftEntityProductRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftEntityOutletTableReferences(db, table, p0)
                                .driftEntityProductRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.outlet == item.id),
                        typedResults: items),
                  if (driftEntityPaymentMethodRefs)
                    await $_getPrefetchedData<
                            DriftEntityOutletData,
                            $DriftEntityOutletTable,
                            DriftEntityPaymentMethodData>(
                        currentTable: table,
                        referencedTable: $$DriftEntityOutletTableReferences
                            ._driftEntityPaymentMethodRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftEntityOutletTableReferences(db, table, p0)
                                .driftEntityPaymentMethodRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.outlet == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftEntityOutletTableProcessedTableManager = ProcessedTableManager<
    _$InstanceDB,
    $DriftEntityOutletTable,
    DriftEntityOutletData,
    $$DriftEntityOutletTableFilterComposer,
    $$DriftEntityOutletTableOrderingComposer,
    $$DriftEntityOutletTableAnnotationComposer,
    $$DriftEntityOutletTableCreateCompanionBuilder,
    $$DriftEntityOutletTableUpdateCompanionBuilder,
    (DriftEntityOutletData, $$DriftEntityOutletTableReferences),
    DriftEntityOutletData,
    PrefetchHooks Function(
        {bool driftEntityProductCategoryRefs,
        bool driftEntityProductRefs,
        bool driftEntityPaymentMethodRefs})>;
typedef $$DriftEntityProductCategoryTableCreateCompanionBuilder
    = DriftEntityProductCategoryCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> active,
  required String name,
  required int outlet,
});
typedef $$DriftEntityProductCategoryTableUpdateCompanionBuilder
    = DriftEntityProductCategoryCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> active,
  Value<String> name,
  Value<int> outlet,
});

final class $$DriftEntityProductCategoryTableReferences extends BaseReferences<
    _$InstanceDB,
    $DriftEntityProductCategoryTable,
    DriftEntityProductCategoryData> {
  $$DriftEntityProductCategoryTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftEntityOutletTable _outletTable(_$InstanceDB db) =>
      db.driftEntityOutlet.createAlias($_aliasNameGenerator(
          db.driftEntityProductCategory.outlet, db.driftEntityOutlet.id));

  $$DriftEntityOutletTableProcessedTableManager get outlet {
    final $_column = $_itemColumn<int>('outlet')!;

    final manager =
        $$DriftEntityOutletTableTableManager($_db, $_db.driftEntityOutlet)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_outletTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$DriftRelationProductProductCategoryTable,
          List<DriftRelationProductProductCategoryData>>
      _driftRelationProductProductCategoryRefsTable(_$InstanceDB db) =>
          MultiTypedResultKey.fromTable(db.driftRelationProductProductCategory,
              aliasName: $_aliasNameGenerator(db.driftEntityProductCategory.id,
                  db.driftRelationProductProductCategory.categoryId));

  $$DriftRelationProductProductCategoryTableProcessedTableManager
      get driftRelationProductProductCategoryRefs {
    final manager = $$DriftRelationProductProductCategoryTableTableManager(
            $_db, $_db.driftRelationProductProductCategory)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_driftRelationProductProductCategoryRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftEntityProductCategoryTableFilterComposer
    extends Composer<_$InstanceDB, $DriftEntityProductCategoryTable> {
  $$DriftEntityProductCategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  $$DriftEntityOutletTableFilterComposer get outlet {
    final $$DriftEntityOutletTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.outlet,
        referencedTable: $db.driftEntityOutlet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityOutletTableFilterComposer(
              $db: $db,
              $table: $db.driftEntityOutlet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> driftRelationProductProductCategoryRefs(
      Expression<bool> Function(
              $$DriftRelationProductProductCategoryTableFilterComposer f)
          f) {
    final $$DriftRelationProductProductCategoryTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftRelationProductProductCategory,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftRelationProductProductCategoryTableFilterComposer(
                  $db: $db,
                  $table: $db.driftRelationProductProductCategory,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DriftEntityProductCategoryTableOrderingComposer
    extends Composer<_$InstanceDB, $DriftEntityProductCategoryTable> {
  $$DriftEntityProductCategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  $$DriftEntityOutletTableOrderingComposer get outlet {
    final $$DriftEntityOutletTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.outlet,
        referencedTable: $db.driftEntityOutlet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityOutletTableOrderingComposer(
              $db: $db,
              $table: $db.driftEntityOutlet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DriftEntityProductCategoryTableAnnotationComposer
    extends Composer<_$InstanceDB, $DriftEntityProductCategoryTable> {
  $$DriftEntityProductCategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$DriftEntityOutletTableAnnotationComposer get outlet {
    final $$DriftEntityOutletTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.outlet,
            referencedTable: $db.driftEntityOutlet,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityOutletTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityOutlet,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> driftRelationProductProductCategoryRefs<T extends Object>(
      Expression<T> Function(
              $$DriftRelationProductProductCategoryTableAnnotationComposer a)
          f) {
    final $$DriftRelationProductProductCategoryTableAnnotationComposer
        composer = $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftRelationProductProductCategory,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftRelationProductProductCategoryTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftRelationProductProductCategory,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DriftEntityProductCategoryTableTableManager extends RootTableManager<
    _$InstanceDB,
    $DriftEntityProductCategoryTable,
    DriftEntityProductCategoryData,
    $$DriftEntityProductCategoryTableFilterComposer,
    $$DriftEntityProductCategoryTableOrderingComposer,
    $$DriftEntityProductCategoryTableAnnotationComposer,
    $$DriftEntityProductCategoryTableCreateCompanionBuilder,
    $$DriftEntityProductCategoryTableUpdateCompanionBuilder,
    (
      DriftEntityProductCategoryData,
      $$DriftEntityProductCategoryTableReferences
    ),
    DriftEntityProductCategoryData,
    PrefetchHooks Function(
        {bool outlet, bool driftRelationProductProductCategoryRefs})> {
  $$DriftEntityProductCategoryTableTableManager(
      _$InstanceDB db, $DriftEntityProductCategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriftEntityProductCategoryTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$DriftEntityProductCategoryTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriftEntityProductCategoryTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> outlet = const Value.absent(),
          }) =>
              DriftEntityProductCategoryCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            active: active,
            name: name,
            outlet: outlet,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> active = const Value.absent(),
            required String name,
            required int outlet,
          }) =>
              DriftEntityProductCategoryCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            active: active,
            name: name,
            outlet: outlet,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftEntityProductCategoryTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {outlet = false,
              driftRelationProductProductCategoryRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftRelationProductProductCategoryRefs)
                  db.driftRelationProductProductCategory
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (outlet) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.outlet,
                    referencedTable: $$DriftEntityProductCategoryTableReferences
                        ._outletTable(db),
                    referencedColumn:
                        $$DriftEntityProductCategoryTableReferences
                            ._outletTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftRelationProductProductCategoryRefs)
                    await $_getPrefetchedData<
                            DriftEntityProductCategoryData,
                            $DriftEntityProductCategoryTable,
                            DriftRelationProductProductCategoryData>(
                        currentTable: table,
                        referencedTable:
                            $$DriftEntityProductCategoryTableReferences
                                ._driftRelationProductProductCategoryRefsTable(
                                    db),
                        managerFromTypedResult: (p0) =>
                            $$DriftEntityProductCategoryTableReferences(
                                    db, table, p0)
                                .driftRelationProductProductCategoryRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftEntityProductCategoryTableProcessedTableManager
    = ProcessedTableManager<
        _$InstanceDB,
        $DriftEntityProductCategoryTable,
        DriftEntityProductCategoryData,
        $$DriftEntityProductCategoryTableFilterComposer,
        $$DriftEntityProductCategoryTableOrderingComposer,
        $$DriftEntityProductCategoryTableAnnotationComposer,
        $$DriftEntityProductCategoryTableCreateCompanionBuilder,
        $$DriftEntityProductCategoryTableUpdateCompanionBuilder,
        (
          DriftEntityProductCategoryData,
          $$DriftEntityProductCategoryTableReferences
        ),
        DriftEntityProductCategoryData,
        PrefetchHooks Function(
            {bool outlet, bool driftRelationProductProductCategoryRefs})>;
typedef $$DriftEntityProductTableCreateCompanionBuilder
    = DriftEntityProductCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> active,
  required String name,
  required String nameInReceipt,
  required String code,
  required int outlet,
});
typedef $$DriftEntityProductTableUpdateCompanionBuilder
    = DriftEntityProductCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> active,
  Value<String> name,
  Value<String> nameInReceipt,
  Value<String> code,
  Value<int> outlet,
});

final class $$DriftEntityProductTableReferences extends BaseReferences<
    _$InstanceDB, $DriftEntityProductTable, DriftEntityProductData> {
  $$DriftEntityProductTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftEntityOutletTable _outletTable(_$InstanceDB db) =>
      db.driftEntityOutlet.createAlias($_aliasNameGenerator(
          db.driftEntityProduct.outlet, db.driftEntityOutlet.id));

  $$DriftEntityOutletTableProcessedTableManager get outlet {
    final $_column = $_itemColumn<int>('outlet')!;

    final manager =
        $$DriftEntityOutletTableTableManager($_db, $_db.driftEntityOutlet)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_outletTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$DriftEntityProductRevisionTable,
          List<DriftEntityProductRevisionData>>
      _driftEntityProductRevisionRefsTable(_$InstanceDB db) =>
          MultiTypedResultKey.fromTable(db.driftEntityProductRevision,
              aliasName: $_aliasNameGenerator(db.driftEntityProduct.id,
                  db.driftEntityProductRevision.product));

  $$DriftEntityProductRevisionTableProcessedTableManager
      get driftEntityProductRevisionRefs {
    final manager = $$DriftEntityProductRevisionTableTableManager(
            $_db, $_db.driftEntityProductRevision)
        .filter((f) => f.product.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_driftEntityProductRevisionRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DriftRelationProductProductCategoryTable,
          List<DriftRelationProductProductCategoryData>>
      _driftRelationProductProductCategoryRefsTable(_$InstanceDB db) =>
          MultiTypedResultKey.fromTable(db.driftRelationProductProductCategory,
              aliasName: $_aliasNameGenerator(db.driftEntityProduct.id,
                  db.driftRelationProductProductCategory.productId));

  $$DriftRelationProductProductCategoryTableProcessedTableManager
      get driftRelationProductProductCategoryRefs {
    final manager = $$DriftRelationProductProductCategoryTableTableManager(
            $_db, $_db.driftRelationProductProductCategory)
        .filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_driftRelationProductProductCategoryRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftEntityProductTableFilterComposer
    extends Composer<_$InstanceDB, $DriftEntityProductTable> {
  $$DriftEntityProductTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameInReceipt => $composableBuilder(
      column: $table.nameInReceipt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  $$DriftEntityOutletTableFilterComposer get outlet {
    final $$DriftEntityOutletTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.outlet,
        referencedTable: $db.driftEntityOutlet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityOutletTableFilterComposer(
              $db: $db,
              $table: $db.driftEntityOutlet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> driftEntityProductRevisionRefs(
      Expression<bool> Function(
              $$DriftEntityProductRevisionTableFilterComposer f)
          f) {
    final $$DriftEntityProductRevisionTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityProductRevision,
            getReferencedColumn: (t) => t.product,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductRevisionTableFilterComposer(
                  $db: $db,
                  $table: $db.driftEntityProductRevision,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> driftRelationProductProductCategoryRefs(
      Expression<bool> Function(
              $$DriftRelationProductProductCategoryTableFilterComposer f)
          f) {
    final $$DriftRelationProductProductCategoryTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftRelationProductProductCategory,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftRelationProductProductCategoryTableFilterComposer(
                  $db: $db,
                  $table: $db.driftRelationProductProductCategory,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DriftEntityProductTableOrderingComposer
    extends Composer<_$InstanceDB, $DriftEntityProductTable> {
  $$DriftEntityProductTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameInReceipt => $composableBuilder(
      column: $table.nameInReceipt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  $$DriftEntityOutletTableOrderingComposer get outlet {
    final $$DriftEntityOutletTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.outlet,
        referencedTable: $db.driftEntityOutlet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityOutletTableOrderingComposer(
              $db: $db,
              $table: $db.driftEntityOutlet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DriftEntityProductTableAnnotationComposer
    extends Composer<_$InstanceDB, $DriftEntityProductTable> {
  $$DriftEntityProductTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameInReceipt => $composableBuilder(
      column: $table.nameInReceipt, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  $$DriftEntityOutletTableAnnotationComposer get outlet {
    final $$DriftEntityOutletTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.outlet,
            referencedTable: $db.driftEntityOutlet,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityOutletTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityOutlet,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> driftEntityProductRevisionRefs<T extends Object>(
      Expression<T> Function(
              $$DriftEntityProductRevisionTableAnnotationComposer a)
          f) {
    final $$DriftEntityProductRevisionTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityProductRevision,
            getReferencedColumn: (t) => t.product,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductRevisionTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityProductRevision,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> driftRelationProductProductCategoryRefs<T extends Object>(
      Expression<T> Function(
              $$DriftRelationProductProductCategoryTableAnnotationComposer a)
          f) {
    final $$DriftRelationProductProductCategoryTableAnnotationComposer
        composer = $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftRelationProductProductCategory,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftRelationProductProductCategoryTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftRelationProductProductCategory,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DriftEntityProductTableTableManager extends RootTableManager<
    _$InstanceDB,
    $DriftEntityProductTable,
    DriftEntityProductData,
    $$DriftEntityProductTableFilterComposer,
    $$DriftEntityProductTableOrderingComposer,
    $$DriftEntityProductTableAnnotationComposer,
    $$DriftEntityProductTableCreateCompanionBuilder,
    $$DriftEntityProductTableUpdateCompanionBuilder,
    (DriftEntityProductData, $$DriftEntityProductTableReferences),
    DriftEntityProductData,
    PrefetchHooks Function(
        {bool outlet,
        bool driftEntityProductRevisionRefs,
        bool driftRelationProductProductCategoryRefs})> {
  $$DriftEntityProductTableTableManager(
      _$InstanceDB db, $DriftEntityProductTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriftEntityProductTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DriftEntityProductTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriftEntityProductTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> nameInReceipt = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<int> outlet = const Value.absent(),
          }) =>
              DriftEntityProductCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            active: active,
            name: name,
            nameInReceipt: nameInReceipt,
            code: code,
            outlet: outlet,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> active = const Value.absent(),
            required String name,
            required String nameInReceipt,
            required String code,
            required int outlet,
          }) =>
              DriftEntityProductCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            active: active,
            name: name,
            nameInReceipt: nameInReceipt,
            code: code,
            outlet: outlet,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftEntityProductTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {outlet = false,
              driftEntityProductRevisionRefs = false,
              driftRelationProductProductCategoryRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftEntityProductRevisionRefs)
                  db.driftEntityProductRevision,
                if (driftRelationProductProductCategoryRefs)
                  db.driftRelationProductProductCategory
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (outlet) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.outlet,
                    referencedTable:
                        $$DriftEntityProductTableReferences._outletTable(db),
                    referencedColumn:
                        $$DriftEntityProductTableReferences._outletTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftEntityProductRevisionRefs)
                    await $_getPrefetchedData<
                            DriftEntityProductData,
                            $DriftEntityProductTable,
                            DriftEntityProductRevisionData>(
                        currentTable: table,
                        referencedTable: $$DriftEntityProductTableReferences
                            ._driftEntityProductRevisionRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftEntityProductTableReferences(db, table, p0)
                                .driftEntityProductRevisionRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.product == item.id),
                        typedResults: items),
                  if (driftRelationProductProductCategoryRefs)
                    await $_getPrefetchedData<
                            DriftEntityProductData,
                            $DriftEntityProductTable,
                            DriftRelationProductProductCategoryData>(
                        currentTable: table,
                        referencedTable: $$DriftEntityProductTableReferences
                            ._driftRelationProductProductCategoryRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftEntityProductTableReferences(db, table, p0)
                                .driftRelationProductProductCategoryRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftEntityProductTableProcessedTableManager = ProcessedTableManager<
    _$InstanceDB,
    $DriftEntityProductTable,
    DriftEntityProductData,
    $$DriftEntityProductTableFilterComposer,
    $$DriftEntityProductTableOrderingComposer,
    $$DriftEntityProductTableAnnotationComposer,
    $$DriftEntityProductTableCreateCompanionBuilder,
    $$DriftEntityProductTableUpdateCompanionBuilder,
    (DriftEntityProductData, $$DriftEntityProductTableReferences),
    DriftEntityProductData,
    PrefetchHooks Function(
        {bool outlet,
        bool driftEntityProductRevisionRefs,
        bool driftRelationProductProductCategoryRefs})>;
typedef $$DriftEntityProductRevisionTableCreateCompanionBuilder
    = DriftEntityProductRevisionCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> active,
  required int numberOfRevision,
  required double price,
  required int product,
});
typedef $$DriftEntityProductRevisionTableUpdateCompanionBuilder
    = DriftEntityProductRevisionCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> active,
  Value<int> numberOfRevision,
  Value<double> price,
  Value<int> product,
});

final class $$DriftEntityProductRevisionTableReferences extends BaseReferences<
    _$InstanceDB,
    $DriftEntityProductRevisionTable,
    DriftEntityProductRevisionData> {
  $$DriftEntityProductRevisionTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftEntityProductTable _productTable(_$InstanceDB db) =>
      db.driftEntityProduct.createAlias($_aliasNameGenerator(
          db.driftEntityProductRevision.product, db.driftEntityProduct.id));

  $$DriftEntityProductTableProcessedTableManager get product {
    final $_column = $_itemColumn<int>('product')!;

    final manager =
        $$DriftEntityProductTableTableManager($_db, $_db.driftEntityProduct)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$DriftEntityOrderRowItemTable,
      List<DriftEntityOrderRowItemData>> _driftEntityOrderRowItemRefsTable(
          _$InstanceDB db) =>
      MultiTypedResultKey.fromTable(db.driftEntityOrderRowItem,
          aliasName: $_aliasNameGenerator(db.driftEntityProductRevision.id,
              db.driftEntityOrderRowItem.productRevision));

  $$DriftEntityOrderRowItemTableProcessedTableManager
      get driftEntityOrderRowItemRefs {
    final manager = $$DriftEntityOrderRowItemTableTableManager(
            $_db, $_db.driftEntityOrderRowItem)
        .filter(
            (f) => f.productRevision.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_driftEntityOrderRowItemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftEntityProductRevisionTableFilterComposer
    extends Composer<_$InstanceDB, $DriftEntityProductRevisionTable> {
  $$DriftEntityProductRevisionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numberOfRevision => $composableBuilder(
      column: $table.numberOfRevision,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  $$DriftEntityProductTableFilterComposer get product {
    final $$DriftEntityProductTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.product,
        referencedTable: $db.driftEntityProduct,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityProductTableFilterComposer(
              $db: $db,
              $table: $db.driftEntityProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> driftEntityOrderRowItemRefs(
      Expression<bool> Function($$DriftEntityOrderRowItemTableFilterComposer f)
          f) {
    final $$DriftEntityOrderRowItemTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityOrderRowItem,
            getReferencedColumn: (t) => t.productRevision,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityOrderRowItemTableFilterComposer(
                  $db: $db,
                  $table: $db.driftEntityOrderRowItem,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DriftEntityProductRevisionTableOrderingComposer
    extends Composer<_$InstanceDB, $DriftEntityProductRevisionTable> {
  $$DriftEntityProductRevisionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numberOfRevision => $composableBuilder(
      column: $table.numberOfRevision,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  $$DriftEntityProductTableOrderingComposer get product {
    final $$DriftEntityProductTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.product,
        referencedTable: $db.driftEntityProduct,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityProductTableOrderingComposer(
              $db: $db,
              $table: $db.driftEntityProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DriftEntityProductRevisionTableAnnotationComposer
    extends Composer<_$InstanceDB, $DriftEntityProductRevisionTable> {
  $$DriftEntityProductRevisionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<int> get numberOfRevision => $composableBuilder(
      column: $table.numberOfRevision, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  $$DriftEntityProductTableAnnotationComposer get product {
    final $$DriftEntityProductTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.product,
            referencedTable: $db.driftEntityProduct,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityProduct,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> driftEntityOrderRowItemRefs<T extends Object>(
      Expression<T> Function($$DriftEntityOrderRowItemTableAnnotationComposer a)
          f) {
    final $$DriftEntityOrderRowItemTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityOrderRowItem,
            getReferencedColumn: (t) => t.productRevision,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityOrderRowItemTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityOrderRowItem,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DriftEntityProductRevisionTableTableManager extends RootTableManager<
    _$InstanceDB,
    $DriftEntityProductRevisionTable,
    DriftEntityProductRevisionData,
    $$DriftEntityProductRevisionTableFilterComposer,
    $$DriftEntityProductRevisionTableOrderingComposer,
    $$DriftEntityProductRevisionTableAnnotationComposer,
    $$DriftEntityProductRevisionTableCreateCompanionBuilder,
    $$DriftEntityProductRevisionTableUpdateCompanionBuilder,
    (
      DriftEntityProductRevisionData,
      $$DriftEntityProductRevisionTableReferences
    ),
    DriftEntityProductRevisionData,
    PrefetchHooks Function({bool product, bool driftEntityOrderRowItemRefs})> {
  $$DriftEntityProductRevisionTableTableManager(
      _$InstanceDB db, $DriftEntityProductRevisionTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriftEntityProductRevisionTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$DriftEntityProductRevisionTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriftEntityProductRevisionTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<int> numberOfRevision = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<int> product = const Value.absent(),
          }) =>
              DriftEntityProductRevisionCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            active: active,
            numberOfRevision: numberOfRevision,
            price: price,
            product: product,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> active = const Value.absent(),
            required int numberOfRevision,
            required double price,
            required int product,
          }) =>
              DriftEntityProductRevisionCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            active: active,
            numberOfRevision: numberOfRevision,
            price: price,
            product: product,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftEntityProductRevisionTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {product = false, driftEntityOrderRowItemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftEntityOrderRowItemRefs) db.driftEntityOrderRowItem
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (product) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.product,
                    referencedTable: $$DriftEntityProductRevisionTableReferences
                        ._productTable(db),
                    referencedColumn:
                        $$DriftEntityProductRevisionTableReferences
                            ._productTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftEntityOrderRowItemRefs)
                    await $_getPrefetchedData<
                            DriftEntityProductRevisionData,
                            $DriftEntityProductRevisionTable,
                            DriftEntityOrderRowItemData>(
                        currentTable: table,
                        referencedTable:
                            $$DriftEntityProductRevisionTableReferences
                                ._driftEntityOrderRowItemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftEntityProductRevisionTableReferences(
                                    db, table, p0)
                                .driftEntityOrderRowItemRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productRevision == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftEntityProductRevisionTableProcessedTableManager
    = ProcessedTableManager<
        _$InstanceDB,
        $DriftEntityProductRevisionTable,
        DriftEntityProductRevisionData,
        $$DriftEntityProductRevisionTableFilterComposer,
        $$DriftEntityProductRevisionTableOrderingComposer,
        $$DriftEntityProductRevisionTableAnnotationComposer,
        $$DriftEntityProductRevisionTableCreateCompanionBuilder,
        $$DriftEntityProductRevisionTableUpdateCompanionBuilder,
        (
          DriftEntityProductRevisionData,
          $$DriftEntityProductRevisionTableReferences
        ),
        DriftEntityProductRevisionData,
        PrefetchHooks Function(
            {bool product, bool driftEntityOrderRowItemRefs})>;
typedef $$DriftEntityPaymentMethodTableCreateCompanionBuilder
    = DriftEntityPaymentMethodCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> active,
  required String name,
  required bool sameAsAmount,
  required int outlet,
});
typedef $$DriftEntityPaymentMethodTableUpdateCompanionBuilder
    = DriftEntityPaymentMethodCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> active,
  Value<String> name,
  Value<bool> sameAsAmount,
  Value<int> outlet,
});

final class $$DriftEntityPaymentMethodTableReferences extends BaseReferences<
    _$InstanceDB,
    $DriftEntityPaymentMethodTable,
    DriftEntityPaymentMethodData> {
  $$DriftEntityPaymentMethodTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftEntityOutletTable _outletTable(_$InstanceDB db) =>
      db.driftEntityOutlet.createAlias($_aliasNameGenerator(
          db.driftEntityPaymentMethod.outlet, db.driftEntityOutlet.id));

  $$DriftEntityOutletTableProcessedTableManager get outlet {
    final $_column = $_itemColumn<int>('outlet')!;

    final manager =
        $$DriftEntityOutletTableTableManager($_db, $_db.driftEntityOutlet)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_outletTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$DriftEntityOrderRowTable,
      List<DriftEntityOrderRowData>> _driftEntityOrderRowRefsTable(
          _$InstanceDB db) =>
      MultiTypedResultKey.fromTable(db.driftEntityOrderRow,
          aliasName: $_aliasNameGenerator(db.driftEntityPaymentMethod.id,
              db.driftEntityOrderRow.paymentMethod));

  $$DriftEntityOrderRowTableProcessedTableManager get driftEntityOrderRowRefs {
    final manager = $$DriftEntityOrderRowTableTableManager(
            $_db, $_db.driftEntityOrderRow)
        .filter((f) => f.paymentMethod.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_driftEntityOrderRowRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftEntityPaymentMethodTableFilterComposer
    extends Composer<_$InstanceDB, $DriftEntityPaymentMethodTable> {
  $$DriftEntityPaymentMethodTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get sameAsAmount => $composableBuilder(
      column: $table.sameAsAmount, builder: (column) => ColumnFilters(column));

  $$DriftEntityOutletTableFilterComposer get outlet {
    final $$DriftEntityOutletTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.outlet,
        referencedTable: $db.driftEntityOutlet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityOutletTableFilterComposer(
              $db: $db,
              $table: $db.driftEntityOutlet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> driftEntityOrderRowRefs(
      Expression<bool> Function($$DriftEntityOrderRowTableFilterComposer f) f) {
    final $$DriftEntityOrderRowTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.driftEntityOrderRow,
        getReferencedColumn: (t) => t.paymentMethod,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityOrderRowTableFilterComposer(
              $db: $db,
              $table: $db.driftEntityOrderRow,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DriftEntityPaymentMethodTableOrderingComposer
    extends Composer<_$InstanceDB, $DriftEntityPaymentMethodTable> {
  $$DriftEntityPaymentMethodTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get sameAsAmount => $composableBuilder(
      column: $table.sameAsAmount,
      builder: (column) => ColumnOrderings(column));

  $$DriftEntityOutletTableOrderingComposer get outlet {
    final $$DriftEntityOutletTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.outlet,
        referencedTable: $db.driftEntityOutlet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityOutletTableOrderingComposer(
              $db: $db,
              $table: $db.driftEntityOutlet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DriftEntityPaymentMethodTableAnnotationComposer
    extends Composer<_$InstanceDB, $DriftEntityPaymentMethodTable> {
  $$DriftEntityPaymentMethodTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get sameAsAmount => $composableBuilder(
      column: $table.sameAsAmount, builder: (column) => column);

  $$DriftEntityOutletTableAnnotationComposer get outlet {
    final $$DriftEntityOutletTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.outlet,
            referencedTable: $db.driftEntityOutlet,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityOutletTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityOutlet,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> driftEntityOrderRowRefs<T extends Object>(
      Expression<T> Function($$DriftEntityOrderRowTableAnnotationComposer a)
          f) {
    final $$DriftEntityOrderRowTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityOrderRow,
            getReferencedColumn: (t) => t.paymentMethod,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityOrderRowTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityOrderRow,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DriftEntityPaymentMethodTableTableManager extends RootTableManager<
    _$InstanceDB,
    $DriftEntityPaymentMethodTable,
    DriftEntityPaymentMethodData,
    $$DriftEntityPaymentMethodTableFilterComposer,
    $$DriftEntityPaymentMethodTableOrderingComposer,
    $$DriftEntityPaymentMethodTableAnnotationComposer,
    $$DriftEntityPaymentMethodTableCreateCompanionBuilder,
    $$DriftEntityPaymentMethodTableUpdateCompanionBuilder,
    (DriftEntityPaymentMethodData, $$DriftEntityPaymentMethodTableReferences),
    DriftEntityPaymentMethodData,
    PrefetchHooks Function({bool outlet, bool driftEntityOrderRowRefs})> {
  $$DriftEntityPaymentMethodTableTableManager(
      _$InstanceDB db, $DriftEntityPaymentMethodTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriftEntityPaymentMethodTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$DriftEntityPaymentMethodTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriftEntityPaymentMethodTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> sameAsAmount = const Value.absent(),
            Value<int> outlet = const Value.absent(),
          }) =>
              DriftEntityPaymentMethodCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            active: active,
            name: name,
            sameAsAmount: sameAsAmount,
            outlet: outlet,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> active = const Value.absent(),
            required String name,
            required bool sameAsAmount,
            required int outlet,
          }) =>
              DriftEntityPaymentMethodCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            active: active,
            name: name,
            sameAsAmount: sameAsAmount,
            outlet: outlet,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftEntityPaymentMethodTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {outlet = false, driftEntityOrderRowRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftEntityOrderRowRefs) db.driftEntityOrderRow
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (outlet) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.outlet,
                    referencedTable: $$DriftEntityPaymentMethodTableReferences
                        ._outletTable(db),
                    referencedColumn: $$DriftEntityPaymentMethodTableReferences
                        ._outletTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftEntityOrderRowRefs)
                    await $_getPrefetchedData<
                            DriftEntityPaymentMethodData,
                            $DriftEntityPaymentMethodTable,
                            DriftEntityOrderRowData>(
                        currentTable: table,
                        referencedTable:
                            $$DriftEntityPaymentMethodTableReferences
                                ._driftEntityOrderRowRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftEntityPaymentMethodTableReferences(
                                    db, table, p0)
                                .driftEntityOrderRowRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.paymentMethod == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftEntityPaymentMethodTableProcessedTableManager
    = ProcessedTableManager<
        _$InstanceDB,
        $DriftEntityPaymentMethodTable,
        DriftEntityPaymentMethodData,
        $$DriftEntityPaymentMethodTableFilterComposer,
        $$DriftEntityPaymentMethodTableOrderingComposer,
        $$DriftEntityPaymentMethodTableAnnotationComposer,
        $$DriftEntityPaymentMethodTableCreateCompanionBuilder,
        $$DriftEntityPaymentMethodTableUpdateCompanionBuilder,
        (
          DriftEntityPaymentMethodData,
          $$DriftEntityPaymentMethodTableReferences
        ),
        DriftEntityPaymentMethodData,
        PrefetchHooks Function({bool outlet, bool driftEntityOrderRowRefs})>;
typedef $$DriftRelationProductProductCategoryTableCreateCompanionBuilder
    = DriftRelationProductProductCategoryCompanion Function({
  required int categoryId,
  required int productId,
  Value<int> rowid,
});
typedef $$DriftRelationProductProductCategoryTableUpdateCompanionBuilder
    = DriftRelationProductProductCategoryCompanion Function({
  Value<int> categoryId,
  Value<int> productId,
  Value<int> rowid,
});

final class $$DriftRelationProductProductCategoryTableReferences
    extends BaseReferences<
        _$InstanceDB,
        $DriftRelationProductProductCategoryTable,
        DriftRelationProductProductCategoryData> {
  $$DriftRelationProductProductCategoryTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftEntityProductCategoryTable _categoryIdTable(_$InstanceDB db) =>
      db.driftEntityProductCategory.createAlias($_aliasNameGenerator(
          db.driftRelationProductProductCategory.categoryId,
          db.driftEntityProductCategory.id));

  $$DriftEntityProductCategoryTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$DriftEntityProductCategoryTableTableManager(
            $_db, $_db.driftEntityProductCategory)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DriftEntityProductTable _productIdTable(_$InstanceDB db) =>
      db.driftEntityProduct.createAlias($_aliasNameGenerator(
          db.driftRelationProductProductCategory.productId,
          db.driftEntityProduct.id));

  $$DriftEntityProductTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager =
        $$DriftEntityProductTableTableManager($_db, $_db.driftEntityProduct)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftRelationProductProductCategoryTableFilterComposer
    extends Composer<_$InstanceDB, $DriftRelationProductProductCategoryTable> {
  $$DriftRelationProductProductCategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DriftEntityProductCategoryTableFilterComposer get categoryId {
    final $$DriftEntityProductCategoryTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.driftEntityProductCategory,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductCategoryTableFilterComposer(
                  $db: $db,
                  $table: $db.driftEntityProductCategory,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$DriftEntityProductTableFilterComposer get productId {
    final $$DriftEntityProductTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.driftEntityProduct,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityProductTableFilterComposer(
              $db: $db,
              $table: $db.driftEntityProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DriftRelationProductProductCategoryTableOrderingComposer
    extends Composer<_$InstanceDB, $DriftRelationProductProductCategoryTable> {
  $$DriftRelationProductProductCategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DriftEntityProductCategoryTableOrderingComposer get categoryId {
    final $$DriftEntityProductCategoryTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.driftEntityProductCategory,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductCategoryTableOrderingComposer(
                  $db: $db,
                  $table: $db.driftEntityProductCategory,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$DriftEntityProductTableOrderingComposer get productId {
    final $$DriftEntityProductTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.driftEntityProduct,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityProductTableOrderingComposer(
              $db: $db,
              $table: $db.driftEntityProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DriftRelationProductProductCategoryTableAnnotationComposer
    extends Composer<_$InstanceDB, $DriftRelationProductProductCategoryTable> {
  $$DriftRelationProductProductCategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DriftEntityProductCategoryTableAnnotationComposer get categoryId {
    final $$DriftEntityProductCategoryTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.driftEntityProductCategory,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductCategoryTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityProductCategory,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$DriftEntityProductTableAnnotationComposer get productId {
    final $$DriftEntityProductTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productId,
            referencedTable: $db.driftEntityProduct,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityProduct,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$DriftRelationProductProductCategoryTableTableManager
    extends RootTableManager<
        _$InstanceDB,
        $DriftRelationProductProductCategoryTable,
        DriftRelationProductProductCategoryData,
        $$DriftRelationProductProductCategoryTableFilterComposer,
        $$DriftRelationProductProductCategoryTableOrderingComposer,
        $$DriftRelationProductProductCategoryTableAnnotationComposer,
        $$DriftRelationProductProductCategoryTableCreateCompanionBuilder,
        $$DriftRelationProductProductCategoryTableUpdateCompanionBuilder,
        (
          DriftRelationProductProductCategoryData,
          $$DriftRelationProductProductCategoryTableReferences
        ),
        DriftRelationProductProductCategoryData,
        PrefetchHooks Function({bool categoryId, bool productId})> {
  $$DriftRelationProductProductCategoryTableTableManager(
      _$InstanceDB db, $DriftRelationProductProductCategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriftRelationProductProductCategoryTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$DriftRelationProductProductCategoryTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriftRelationProductProductCategoryTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> categoryId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftRelationProductProductCategoryCompanion(
            categoryId: categoryId,
            productId: productId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int categoryId,
            required int productId,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftRelationProductProductCategoryCompanion.insert(
            categoryId: categoryId,
            productId: productId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftRelationProductProductCategoryTableReferences(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({categoryId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$DriftRelationProductProductCategoryTableReferences
                            ._categoryIdTable(db),
                    referencedColumn:
                        $$DriftRelationProductProductCategoryTableReferences
                            ._categoryIdTable(db)
                            .id,
                  ) as T;
                }
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$DriftRelationProductProductCategoryTableReferences
                            ._productIdTable(db),
                    referencedColumn:
                        $$DriftRelationProductProductCategoryTableReferences
                            ._productIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftRelationProductProductCategoryTableProcessedTableManager
    = ProcessedTableManager<
        _$InstanceDB,
        $DriftRelationProductProductCategoryTable,
        DriftRelationProductProductCategoryData,
        $$DriftRelationProductProductCategoryTableFilterComposer,
        $$DriftRelationProductProductCategoryTableOrderingComposer,
        $$DriftRelationProductProductCategoryTableAnnotationComposer,
        $$DriftRelationProductProductCategoryTableCreateCompanionBuilder,
        $$DriftRelationProductProductCategoryTableUpdateCompanionBuilder,
        (
          DriftRelationProductProductCategoryData,
          $$DriftRelationProductProductCategoryTableReferences
        ),
        DriftRelationProductProductCategoryData,
        PrefetchHooks Function({bool categoryId, bool productId})>;
typedef $$DriftEntityOrderRowTableCreateCompanionBuilder
    = DriftEntityOrderRowCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<double> payAmount,
  Value<int?> paymentMethod,
  required OrderStatus status,
  Value<double> totalPrice,
  Value<int> totalQuantity,
});
typedef $$DriftEntityOrderRowTableUpdateCompanionBuilder
    = DriftEntityOrderRowCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<double> payAmount,
  Value<int?> paymentMethod,
  Value<OrderStatus> status,
  Value<double> totalPrice,
  Value<int> totalQuantity,
});

final class $$DriftEntityOrderRowTableReferences extends BaseReferences<
    _$InstanceDB, $DriftEntityOrderRowTable, DriftEntityOrderRowData> {
  $$DriftEntityOrderRowTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftEntityPaymentMethodTable _paymentMethodTable(_$InstanceDB db) =>
      db.driftEntityPaymentMethod.createAlias($_aliasNameGenerator(
          db.driftEntityOrderRow.paymentMethod,
          db.driftEntityPaymentMethod.id));

  $$DriftEntityPaymentMethodTableProcessedTableManager? get paymentMethod {
    final $_column = $_itemColumn<int>('payment_method');
    if ($_column == null) return null;
    final manager = $$DriftEntityPaymentMethodTableTableManager(
            $_db, $_db.driftEntityPaymentMethod)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paymentMethodTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$DriftEntityOrderRowItemTable,
      List<DriftEntityOrderRowItemData>> _driftEntityOrderRowItemRefsTable(
          _$InstanceDB db) =>
      MultiTypedResultKey.fromTable(db.driftEntityOrderRowItem,
          aliasName: $_aliasNameGenerator(
              db.driftEntityOrderRow.id, db.driftEntityOrderRowItem.orderRow));

  $$DriftEntityOrderRowItemTableProcessedTableManager
      get driftEntityOrderRowItemRefs {
    final manager = $$DriftEntityOrderRowItemTableTableManager(
            $_db, $_db.driftEntityOrderRowItem)
        .filter((f) => f.orderRow.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_driftEntityOrderRowItemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftEntityOrderRowTableFilterComposer
    extends Composer<_$InstanceDB, $DriftEntityOrderRowTable> {
  $$DriftEntityOrderRowTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get payAmount => $composableBuilder(
      column: $table.payAmount, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<OrderStatus, OrderStatus, String> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalQuantity => $composableBuilder(
      column: $table.totalQuantity, builder: (column) => ColumnFilters(column));

  $$DriftEntityPaymentMethodTableFilterComposer get paymentMethod {
    final $$DriftEntityPaymentMethodTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.paymentMethod,
            referencedTable: $db.driftEntityPaymentMethod,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityPaymentMethodTableFilterComposer(
                  $db: $db,
                  $table: $db.driftEntityPaymentMethod,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<bool> driftEntityOrderRowItemRefs(
      Expression<bool> Function($$DriftEntityOrderRowItemTableFilterComposer f)
          f) {
    final $$DriftEntityOrderRowItemTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityOrderRowItem,
            getReferencedColumn: (t) => t.orderRow,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityOrderRowItemTableFilterComposer(
                  $db: $db,
                  $table: $db.driftEntityOrderRowItem,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DriftEntityOrderRowTableOrderingComposer
    extends Composer<_$InstanceDB, $DriftEntityOrderRowTable> {
  $$DriftEntityOrderRowTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get payAmount => $composableBuilder(
      column: $table.payAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalQuantity => $composableBuilder(
      column: $table.totalQuantity,
      builder: (column) => ColumnOrderings(column));

  $$DriftEntityPaymentMethodTableOrderingComposer get paymentMethod {
    final $$DriftEntityPaymentMethodTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.paymentMethod,
            referencedTable: $db.driftEntityPaymentMethod,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityPaymentMethodTableOrderingComposer(
                  $db: $db,
                  $table: $db.driftEntityPaymentMethod,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$DriftEntityOrderRowTableAnnotationComposer
    extends Composer<_$InstanceDB, $DriftEntityOrderRowTable> {
  $$DriftEntityOrderRowTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<double> get payAmount =>
      $composableBuilder(column: $table.payAmount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<OrderStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => column);

  GeneratedColumn<int> get totalQuantity => $composableBuilder(
      column: $table.totalQuantity, builder: (column) => column);

  $$DriftEntityPaymentMethodTableAnnotationComposer get paymentMethod {
    final $$DriftEntityPaymentMethodTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.paymentMethod,
            referencedTable: $db.driftEntityPaymentMethod,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityPaymentMethodTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityPaymentMethod,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> driftEntityOrderRowItemRefs<T extends Object>(
      Expression<T> Function($$DriftEntityOrderRowItemTableAnnotationComposer a)
          f) {
    final $$DriftEntityOrderRowItemTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.driftEntityOrderRowItem,
            getReferencedColumn: (t) => t.orderRow,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityOrderRowItemTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityOrderRowItem,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$DriftEntityOrderRowTableTableManager extends RootTableManager<
    _$InstanceDB,
    $DriftEntityOrderRowTable,
    DriftEntityOrderRowData,
    $$DriftEntityOrderRowTableFilterComposer,
    $$DriftEntityOrderRowTableOrderingComposer,
    $$DriftEntityOrderRowTableAnnotationComposer,
    $$DriftEntityOrderRowTableCreateCompanionBuilder,
    $$DriftEntityOrderRowTableUpdateCompanionBuilder,
    (DriftEntityOrderRowData, $$DriftEntityOrderRowTableReferences),
    DriftEntityOrderRowData,
    PrefetchHooks Function(
        {bool paymentMethod, bool driftEntityOrderRowItemRefs})> {
  $$DriftEntityOrderRowTableTableManager(
      _$InstanceDB db, $DriftEntityOrderRowTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriftEntityOrderRowTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DriftEntityOrderRowTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriftEntityOrderRowTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<double> payAmount = const Value.absent(),
            Value<int?> paymentMethod = const Value.absent(),
            Value<OrderStatus> status = const Value.absent(),
            Value<double> totalPrice = const Value.absent(),
            Value<int> totalQuantity = const Value.absent(),
          }) =>
              DriftEntityOrderRowCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            payAmount: payAmount,
            paymentMethod: paymentMethod,
            status: status,
            totalPrice: totalPrice,
            totalQuantity: totalQuantity,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<double> payAmount = const Value.absent(),
            Value<int?> paymentMethod = const Value.absent(),
            required OrderStatus status,
            Value<double> totalPrice = const Value.absent(),
            Value<int> totalQuantity = const Value.absent(),
          }) =>
              DriftEntityOrderRowCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            payAmount: payAmount,
            paymentMethod: paymentMethod,
            status: status,
            totalPrice: totalPrice,
            totalQuantity: totalQuantity,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftEntityOrderRowTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {paymentMethod = false, driftEntityOrderRowItemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftEntityOrderRowItemRefs) db.driftEntityOrderRowItem
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (paymentMethod) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.paymentMethod,
                    referencedTable: $$DriftEntityOrderRowTableReferences
                        ._paymentMethodTable(db),
                    referencedColumn: $$DriftEntityOrderRowTableReferences
                        ._paymentMethodTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftEntityOrderRowItemRefs)
                    await $_getPrefetchedData<
                            DriftEntityOrderRowData,
                            $DriftEntityOrderRowTable,
                            DriftEntityOrderRowItemData>(
                        currentTable: table,
                        referencedTable: $$DriftEntityOrderRowTableReferences
                            ._driftEntityOrderRowItemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftEntityOrderRowTableReferences(db, table, p0)
                                .driftEntityOrderRowItemRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.orderRow == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftEntityOrderRowTableProcessedTableManager = ProcessedTableManager<
    _$InstanceDB,
    $DriftEntityOrderRowTable,
    DriftEntityOrderRowData,
    $$DriftEntityOrderRowTableFilterComposer,
    $$DriftEntityOrderRowTableOrderingComposer,
    $$DriftEntityOrderRowTableAnnotationComposer,
    $$DriftEntityOrderRowTableCreateCompanionBuilder,
    $$DriftEntityOrderRowTableUpdateCompanionBuilder,
    (DriftEntityOrderRowData, $$DriftEntityOrderRowTableReferences),
    DriftEntityOrderRowData,
    PrefetchHooks Function(
        {bool paymentMethod, bool driftEntityOrderRowItemRefs})>;
typedef $$DriftEntityOrderRowItemTableCreateCompanionBuilder
    = DriftEntityOrderRowItemCompanion Function({
  Value<int> id,
  required int orderRow,
  required int productRevision,
  required int quantity,
});
typedef $$DriftEntityOrderRowItemTableUpdateCompanionBuilder
    = DriftEntityOrderRowItemCompanion Function({
  Value<int> id,
  Value<int> orderRow,
  Value<int> productRevision,
  Value<int> quantity,
});

final class $$DriftEntityOrderRowItemTableReferences extends BaseReferences<
    _$InstanceDB, $DriftEntityOrderRowItemTable, DriftEntityOrderRowItemData> {
  $$DriftEntityOrderRowItemTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftEntityOrderRowTable _orderRowTable(_$InstanceDB db) =>
      db.driftEntityOrderRow.createAlias($_aliasNameGenerator(
          db.driftEntityOrderRowItem.orderRow, db.driftEntityOrderRow.id));

  $$DriftEntityOrderRowTableProcessedTableManager get orderRow {
    final $_column = $_itemColumn<int>('order_row')!;

    final manager =
        $$DriftEntityOrderRowTableTableManager($_db, $_db.driftEntityOrderRow)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderRowTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DriftEntityProductRevisionTable _productRevisionTable(
          _$InstanceDB db) =>
      db.driftEntityProductRevision.createAlias($_aliasNameGenerator(
          db.driftEntityOrderRowItem.productRevision,
          db.driftEntityProductRevision.id));

  $$DriftEntityProductRevisionTableProcessedTableManager get productRevision {
    final $_column = $_itemColumn<int>('product_revision')!;

    final manager = $$DriftEntityProductRevisionTableTableManager(
            $_db, $_db.driftEntityProductRevision)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productRevisionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftEntityOrderRowItemTableFilterComposer
    extends Composer<_$InstanceDB, $DriftEntityOrderRowItemTable> {
  $$DriftEntityOrderRowItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  $$DriftEntityOrderRowTableFilterComposer get orderRow {
    final $$DriftEntityOrderRowTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderRow,
        referencedTable: $db.driftEntityOrderRow,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DriftEntityOrderRowTableFilterComposer(
              $db: $db,
              $table: $db.driftEntityOrderRow,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DriftEntityProductRevisionTableFilterComposer get productRevision {
    final $$DriftEntityProductRevisionTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productRevision,
            referencedTable: $db.driftEntityProductRevision,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductRevisionTableFilterComposer(
                  $db: $db,
                  $table: $db.driftEntityProductRevision,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$DriftEntityOrderRowItemTableOrderingComposer
    extends Composer<_$InstanceDB, $DriftEntityOrderRowItemTable> {
  $$DriftEntityOrderRowItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  $$DriftEntityOrderRowTableOrderingComposer get orderRow {
    final $$DriftEntityOrderRowTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.orderRow,
            referencedTable: $db.driftEntityOrderRow,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityOrderRowTableOrderingComposer(
                  $db: $db,
                  $table: $db.driftEntityOrderRow,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$DriftEntityProductRevisionTableOrderingComposer get productRevision {
    final $$DriftEntityProductRevisionTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productRevision,
            referencedTable: $db.driftEntityProductRevision,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductRevisionTableOrderingComposer(
                  $db: $db,
                  $table: $db.driftEntityProductRevision,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$DriftEntityOrderRowItemTableAnnotationComposer
    extends Composer<_$InstanceDB, $DriftEntityOrderRowItemTable> {
  $$DriftEntityOrderRowItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  $$DriftEntityOrderRowTableAnnotationComposer get orderRow {
    final $$DriftEntityOrderRowTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.orderRow,
            referencedTable: $db.driftEntityOrderRow,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityOrderRowTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityOrderRow,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$DriftEntityProductRevisionTableAnnotationComposer get productRevision {
    final $$DriftEntityProductRevisionTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productRevision,
            referencedTable: $db.driftEntityProductRevision,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$DriftEntityProductRevisionTableAnnotationComposer(
                  $db: $db,
                  $table: $db.driftEntityProductRevision,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$DriftEntityOrderRowItemTableTableManager extends RootTableManager<
    _$InstanceDB,
    $DriftEntityOrderRowItemTable,
    DriftEntityOrderRowItemData,
    $$DriftEntityOrderRowItemTableFilterComposer,
    $$DriftEntityOrderRowItemTableOrderingComposer,
    $$DriftEntityOrderRowItemTableAnnotationComposer,
    $$DriftEntityOrderRowItemTableCreateCompanionBuilder,
    $$DriftEntityOrderRowItemTableUpdateCompanionBuilder,
    (DriftEntityOrderRowItemData, $$DriftEntityOrderRowItemTableReferences),
    DriftEntityOrderRowItemData,
    PrefetchHooks Function({bool orderRow, bool productRevision})> {
  $$DriftEntityOrderRowItemTableTableManager(
      _$InstanceDB db, $DriftEntityOrderRowItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriftEntityOrderRowItemTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$DriftEntityOrderRowItemTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriftEntityOrderRowItemTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> orderRow = const Value.absent(),
            Value<int> productRevision = const Value.absent(),
            Value<int> quantity = const Value.absent(),
          }) =>
              DriftEntityOrderRowItemCompanion(
            id: id,
            orderRow: orderRow,
            productRevision: productRevision,
            quantity: quantity,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int orderRow,
            required int productRevision,
            required int quantity,
          }) =>
              DriftEntityOrderRowItemCompanion.insert(
            id: id,
            orderRow: orderRow,
            productRevision: productRevision,
            quantity: quantity,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftEntityOrderRowItemTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({orderRow = false, productRevision = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (orderRow) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.orderRow,
                    referencedTable: $$DriftEntityOrderRowItemTableReferences
                        ._orderRowTable(db),
                    referencedColumn: $$DriftEntityOrderRowItemTableReferences
                        ._orderRowTable(db)
                        .id,
                  ) as T;
                }
                if (productRevision) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productRevision,
                    referencedTable: $$DriftEntityOrderRowItemTableReferences
                        ._productRevisionTable(db),
                    referencedColumn: $$DriftEntityOrderRowItemTableReferences
                        ._productRevisionTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftEntityOrderRowItemTableProcessedTableManager
    = ProcessedTableManager<
        _$InstanceDB,
        $DriftEntityOrderRowItemTable,
        DriftEntityOrderRowItemData,
        $$DriftEntityOrderRowItemTableFilterComposer,
        $$DriftEntityOrderRowItemTableOrderingComposer,
        $$DriftEntityOrderRowItemTableAnnotationComposer,
        $$DriftEntityOrderRowItemTableCreateCompanionBuilder,
        $$DriftEntityOrderRowItemTableUpdateCompanionBuilder,
        (DriftEntityOrderRowItemData, $$DriftEntityOrderRowItemTableReferences),
        DriftEntityOrderRowItemData,
        PrefetchHooks Function({bool orderRow, bool productRevision})>;

class $InstanceDBManager {
  final _$InstanceDB _db;
  $InstanceDBManager(this._db);
  $$DriftEntityOutletTableTableManager get driftEntityOutlet =>
      $$DriftEntityOutletTableTableManager(_db, _db.driftEntityOutlet);
  $$DriftEntityProductCategoryTableTableManager
      get driftEntityProductCategory =>
          $$DriftEntityProductCategoryTableTableManager(
              _db, _db.driftEntityProductCategory);
  $$DriftEntityProductTableTableManager get driftEntityProduct =>
      $$DriftEntityProductTableTableManager(_db, _db.driftEntityProduct);
  $$DriftEntityProductRevisionTableTableManager
      get driftEntityProductRevision =>
          $$DriftEntityProductRevisionTableTableManager(
              _db, _db.driftEntityProductRevision);
  $$DriftEntityPaymentMethodTableTableManager get driftEntityPaymentMethod =>
      $$DriftEntityPaymentMethodTableTableManager(
          _db, _db.driftEntityPaymentMethod);
  $$DriftRelationProductProductCategoryTableTableManager
      get driftRelationProductProductCategory =>
          $$DriftRelationProductProductCategoryTableTableManager(
              _db, _db.driftRelationProductProductCategory);
  $$DriftEntityOrderRowTableTableManager get driftEntityOrderRow =>
      $$DriftEntityOrderRowTableTableManager(_db, _db.driftEntityOrderRow);
  $$DriftEntityOrderRowItemTableTableManager get driftEntityOrderRowItem =>
      $$DriftEntityOrderRowItemTableTableManager(
          _db, _db.driftEntityOrderRowItem);
}

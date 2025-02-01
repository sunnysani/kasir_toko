import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/backend/models/payment_method.dart';
import 'package:kasir_toko/backend/models/product.dart';
import 'package:kasir_toko/backend/models/product_category.dart';
import 'package:kasir_toko/objectbox.g.dart' as generated_object_box;
import 'package:objectbox/objectbox.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

@Entity(uid: 2542198763334126311)
class Outlet {
  @Id(assignable: true)
  int id = 0;
  String? name;
  String? address;
  String? phoneNumber;
  String? receiptMessage;
  bool activeTax = false;
  double taxPercentage = 10;

  @Backlink('outlet')
  final paymentMethods = ToMany<PaymentMethod>();
  @Backlink('outlet')
  final productCategories = ToMany<ProductCategory>();
  @Backlink('outlet')
  final products = ToMany<Product>();
  @Backlink('outlet')
  final orders = ToMany<OrderRow>();

  bool isValid() {
    if ((name?.isNotEmpty ?? false) &&
        (address?.isNotEmpty ?? false) &&
        (phoneNumber?.isNotEmpty ?? false)) {
      return true;
    }

    return false;
  }

  List<ProductCategory> getActiveSortedProductCategories() {
    return productCategories.where((element) => element.active).toList()
      ..sort();
  }

  List<ProductCategory> getAllSortedProductCategory() {
    return productCategories.toList()..sort();
  }

  List<Product> getAllSortedProduct() {
    return products.toList()..sort();
  }

  List<Product> getAllActiveSortedProduct() {
    return products.where((element) => element.active).toList()..sort();
  }

  List<Product> getAllActiveUncategorizedSortedProduct() {
    return products
        .where((element) =>
            (element.categories.isEmpty ||
                element.categories
                    .where((element) => element.active)
                    .isEmpty) &&
            element.active)
        .toList()
      ..sort();
  }

  List<PaymentMethod> getAllSortedPaymentMethods() {
    return paymentMethods.toList()..sort();
  }

  List<PaymentMethod> getAllActiveSortedPaymentMethods() {
    return paymentMethods.where((element) => element.active).toList()..sort();
  }

  bool get isGeneralInformationOk {
    if (name == null ||
        name!.isEmpty ||
        address == null ||
        address!.isEmpty ||
        phoneNumber == null ||
        phoneNumber!.isEmpty) return false;

    return true;
  }

  bool get hasAtLeastOneProduct {
    if (getAllActiveSortedProduct().isEmpty) return false;

    return true;
  }

  bool get hasAtLeastOnePaymentMethod {
    if (getAllActiveSortedPaymentMethods().isEmpty) return false;

    return true;
  }

  List<OrderRow> getOrderRowListBasedOnDate(DateTime date) {
    final startDayTime =
        DateTime(date.year, date.month, date.day, 0, 0, 0, 0, 0);
    final endDayTime =
        DateTime(date.year, date.month, date.day, 23, 59, 59, 999, 999);

    Query<OrderRow> query = StaticDB.orderRowBox
        .query((generated_object_box.OrderRow_.timeStamp
            .betweenDate(startDayTime, endDayTime)))
        .build();
    List<OrderRow> orderRowList = query.find();
    query.close();

    return orderRowList;
  }

  List<OrderRow> getOrderRowListBetweenTime(
      DateTime date, TimeOfDay start, TimeOfDay end) {
    final startDayTime = DateTime(
        date.year, date.month, date.day, start.hour, start.minute, 0, 0, 0);
    final endDayTime = DateTime(
        date.year, date.month, date.day, end.hour, end.minute, 59, 999, 999);

    Query<OrderRow> query = StaticDB.orderRowBox
        .query((generated_object_box.OrderRow_.timeStamp
            .betweenDate(startDayTime, endDayTime)))
        .build();
    List<OrderRow> orderRowList = query.find();
    query.close();

    return orderRowList;
  }
}

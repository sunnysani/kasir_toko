import 'package:kasir_toko/backend/models/payment_method.dart';
import 'package:kasir_toko/backend/models/product.dart';
import 'package:kasir_toko/backend/models/product_category.dart';
import 'package:kasir_toko/backend/models/product_revision.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

class DBFunction {
  static void saveOutlet({
    String? name,
    String? address,
    String? phoneNumber,
    String? receiptMessage,
    bool? activeTax,
    double? taxPercentage,
  }) {
    if (name != null) StaticDB.outlet.name = name;
    if (address != null) StaticDB.outlet.address = address;
    if (phoneNumber != null) StaticDB.outlet.phoneNumber = phoneNumber;
    if (receiptMessage != null) StaticDB.outlet.receiptMessage = receiptMessage;
    if (activeTax != null) StaticDB.outlet.activeTax = activeTax;
    if (taxPercentage != null) StaticDB.outlet.taxPercentage = taxPercentage;

    StaticDB.saveOutlet();
  }

  static void createProductCategory({
    required String name,
  }) {
    ProductCategory newProductCategory = ProductCategory(name: name);

    StaticDB.outlet.productCategories.add(newProductCategory);
    StaticDB.saveOutlet();
  }

  static void editProductCategory({
    required ProductCategory productCategory,
    String? name,
    bool? active,
  }) {
    if (name != null) productCategory.name = name;
    if (active != null) productCategory.active = active;

    StaticDB.productCategoryBox.put(productCategory);
    StaticDB.updateOutlet();
  }

  static void createProduct({
    required String name,
    required double price,
    String? nameInReceipt,
    String? code,
    List<ProductCategory?> categories = const [],
  }) {
    Product newProduct = Product(
      name: name,
      code: code,
      nameInReceipt: nameInReceipt,
    );
    ProductRevision newProductRevision = ProductRevision(
      price: price,
    );

    for (ProductCategory? category in categories) {
      if (category != null) {
        newProduct.categories.add(category);
      }
    }

    newProduct.revisions.add(newProductRevision);

    StaticDB.outlet.products.add(newProduct);
    StaticDB.saveOutlet();
  }

  static void editProduct({
    required Product product,
    String? name,
    double? price,
    String? nameInReceipt,
    String? code,
    List<ProductCategory?>? categories,
  }) {
    if (name != null) product.name = name;
    if (code != null) product.code = code;
    if (nameInReceipt != null) product.nameInReceipt = nameInReceipt;

    if (categories != null) {
      product.categories.clear();
      for (ProductCategory? category in categories) {
        if (category != null) {
          product.categories.add(category);
        }
      }
    }

    if (price != null && price != product.getLatestRevision().price) {
      ProductRevision newProductRevision = ProductRevision(price: price);
      product.revisions.add(newProductRevision);
    }

    StaticDB.productBox.put(product);
    StaticDB.updateOutlet();
  }

  static void createPaymentMethod({
    required String name,
    bool sameAsAmount = false,
  }) {
    PaymentMethod newPaymentMethod =
        PaymentMethod(name: name, sameAsAmount: sameAsAmount);

    StaticDB.outlet.paymentMethods.add(newPaymentMethod);
    StaticDB.saveOutlet();
  }

  static void editPaymentMethod({
    required PaymentMethod paymentMethod,
    String? name,
    bool? sameAsAmount,
    bool? active,
  }) {
    if (name != null) paymentMethod.name = name;
    if (sameAsAmount != null) paymentMethod.sameAsAmount = sameAsAmount;
    if (active != null) paymentMethod.active = active;

    StaticDB.paymentMethodBox.put(paymentMethod);
    StaticDB.updateOutlet();
  }
}

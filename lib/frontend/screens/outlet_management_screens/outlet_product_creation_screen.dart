import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kasir_toko/backend/db/function.db.dart';
import 'package:kasir_toko/backend/models/product.dart';
import 'package:kasir_toko/backend/models/product_category.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_product_category_management_screen.dart';
import 'package:kasir_toko/frontend/widgets/common/modified_text_form_field.dart';
import 'package:kasir_toko/frontend/widgets/common/switch_form_field.dart';
import 'package:kasir_toko/frontend/widgets/outlet_management/outlet_management_creation_template.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/common/function.common.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class OutletProductCreationScreen extends StatefulWidget {
  const OutletProductCreationScreen({super.key});

  static const routeName = '/outlet/management/product/creation';

  @override
  State<OutletProductCreationScreen> createState() =>
      _OutletProductCreationScreenState();
}

class _OutletProductCreationScreenState
    extends State<OutletProductCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<dynamic>> _formMultiSelect =
      GlobalKey<FormFieldState<dynamic>>();
  final textEditingControllerProductName = TextEditingController();
  final textEditingControllerProductCode = TextEditingController();
  final textEditingControllerProductNameInReceipt = TextEditingController();
  final textEditingControllerProductPrice = TextEditingController();
  List<int> categories = [];
  Product? args;
  bool active = true;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    if (args == null) {
      DBFunction.createProduct(
        name: textEditingControllerProductName.text,
        price: CommonFunction.parseTextDouble(
            textEditingControllerProductPrice.text),
        code: textEditingControllerProductCode.text,
        nameInReceipt: textEditingControllerProductNameInReceipt.text,
        categories: categories
            .map((number) => StaticDB.productCategoryBox.get(number))
            .toList(),
      );
    } else {
      DBFunction.editProduct(
        product: args!,
        name: textEditingControllerProductName.text,
        price: CommonFunction.parseTextDouble(
            textEditingControllerProductPrice.text),
        code: textEditingControllerProductCode.text,
        nameInReceipt: textEditingControllerProductNameInReceipt.text,
        categories: categories
            .map((number) => StaticDB.productCategoryBox.get(number))
            .toList(),
      );
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as Product?;
    if (args != null) {
      textEditingControllerProductName.text = args!.name;
      textEditingControllerProductCode.text = args!.code ?? '';
      textEditingControllerProductNameInReceipt.text =
          args!.nameInReceipt ?? '';
      textEditingControllerProductPrice.text =
          args!.getLatestRevision().price.toString();
      setState(() {
        active = args!.active;
        categories = args!.categories.map((category) => category.id).toList();
      });
    }

    return OutletManagementCreationTemplate(
      title: args == null ? 'Tambah Produk' : 'Edit Produk',
      isCreation: args == null,
      submit: _submit,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ModifiedTextFormField(
              controller: textEditingControllerProductName,
              labelName: 'Nama Produk',
              value: args?.name,
              isCreation: args == null,
              validator: ((value) =>
                  value?.isNotEmpty ?? false ? null : 'Salah'),
            ),
            const SizedBox(height: 20),
            ModifiedTextFormField(
              controller: textEditingControllerProductNameInReceipt,
              labelName: 'Nama Produk di Struk',
              isCreation: args == null,
              isOkEmpty: true,
              okEmptyMessage:
                  'Nama Produk di Struk akan sama dengan Nama Produk',
            ),
            const SizedBox(height: 20),
            ModifiedTextFormField(
              controller: textEditingControllerProductCode,
              labelName: 'Kode Produk',
              isCreation: args == null,
              isOkEmpty: true,
            ),
            const SizedBox(height: 20),
            ModifiedTextFormField(
              controller: textEditingControllerProductPrice,
              value: args?.getLatestRevision().price.toString(),
              keyboardType: TextInputType.number,
              labelName: 'Harga',
              isCreation: args == null,
              validator: ((value) =>
                  value?.isNotEmpty ?? false ? null : 'Salah'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,12}$')),
              ],
              prefix: 'Rp ',
            ),
            const SizedBox(height: 20),
            StaticDB.outlet.getActiveSortedProductCategories().isEmpty
                ? Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: AppColors.inactiveColor)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            OutletProductCategoryManagementScreen.routeName);
                      },
                      child: const Text('Tidak ada kategori produk terdaftar'),
                    ),
                  )
                : MultiSelectChipField(
                    initialValue: args == null ? [] : categories,
                    key: _formMultiSelect,
                    scroll: false,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(width: 1, color: AppColors.inactiveColor),
                    ),
                    scrollBar: HorizontalScrollBar(),
                    selectedTextStyle: const TextStyle(color: Colors.white),
                    selectedChipColor: AppColors.accentColor,
                    showHeader: false,
                    items: [
                      for (ProductCategory? category
                          in StaticDB.outlet.getActiveSortedProductCategories())
                        MultiSelectItem(category?.id, category?.name ?? ''),
                    ],
                    onSaved: (val) {
                      categories = List<int>.from(val!);
                    },
                  ),
            const SizedBox(height: 20),
            if (args != null)
              SwitchFormField(
                  value: active,
                  onChanged: (val) => setState(() {
                        active = args!.active = val;
                      }),
                  description: 'Aktif')
          ],
        ),
      ),
    );
  }
}

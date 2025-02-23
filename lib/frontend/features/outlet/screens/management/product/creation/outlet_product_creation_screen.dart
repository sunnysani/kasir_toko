import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_product_object.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product/outlet_product_management.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product_category/outlet_product_category_management_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_management_creation_template.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/modified_text_form_field.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/switch_form_field.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class OutletProductCreationScreen extends StatefulWidget {
  const OutletProductCreationScreen({super.key, this.data});

  final DriftUsableProductObject? data;

  static const childRouteName = 'creation';
  static const routeName =
      '${OutletProductManagementScreen.routeName}/$childRouteName';

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
  List<int> selectedCategories = [];
  bool active = true;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    if (widget.data == null) {
      InstanceDB.insertProduct(
        name: textEditingControllerProductName.text,
        price: double.parse(textEditingControllerProductPrice.text),
        nameInReceipt: textEditingControllerProductNameInReceipt.text,
        code: textEditingControllerProductCode.text,
        categoryIDs: selectedCategories,
      );
    } else {
      InstanceDB.updateProduct(
        product: widget.data!.product,
        name: textEditingControllerProductName.text,
        price: CommonFunction.parseTextDouble(
            textEditingControllerProductPrice.text),
        code: textEditingControllerProductCode.text,
        nameInReceipt: textEditingControllerProductNameInReceipt.text,
        categoryIDs: selectedCategories,
        active: active,
      );
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    if (widget.data != null) {
      textEditingControllerProductName.text = widget.data!.product.name;
      textEditingControllerProductCode.text = widget.data!.product.code;
      textEditingControllerProductNameInReceipt.text =
          widget.data!.product.nameInReceipt;
      textEditingControllerProductPrice.text =
          widget.data!.latestRevision.price.toString();
      setState(() {
        active = widget.data!.product.active;
        selectedCategories =
            widget.data!.categories.map((category) => category.id).toList();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OutletManagementCreationTemplate(
      title: widget.data == null ? 'Tambah Produk' : 'Edit Produk',
      isCreation: widget.data == null,
      submit: _submit,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ModifiedTextFormField(
              controller: textEditingControllerProductName,
              labelName: 'Nama Produk',
              isCreation: widget.data == null,
              validator: ((value) =>
                  value?.isNotEmpty ?? false ? null : 'Salah'),
            ),
            const SizedBox(height: 20),
            ModifiedTextFormField(
              controller: textEditingControllerProductNameInReceipt,
              labelName: 'Nama Produk di Struk',
              isCreation: widget.data == null,
              isOkEmpty: true,
              okEmptyMessage:
                  'Nama Produk di Struk akan sama dengan Nama Produk',
            ),
            const SizedBox(height: 20),
            ModifiedTextFormField(
              controller: textEditingControllerProductCode,
              labelName: 'Kode Produk',
              isCreation: widget.data == null,
              isOkEmpty: true,
            ),
            const SizedBox(height: 20),
            ModifiedTextFormField(
              controller: textEditingControllerProductPrice,
              keyboardType: TextInputType.number,
              labelName: 'Harga',
              isCreation: widget.data == null,
              validator: ((value) =>
                  value?.isNotEmpty ?? false ? null : 'Salah'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,12}$')),
              ],
              prefix: 'Rp ',
            ),
            const SizedBox(height: 20),
            StreamBuilder(
                stream: InstanceDB.streamProductCategory(active: true),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (snapshot.data!.isEmpty) {
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1, color: AppColors.inactiveColor)),
                      child: TextButton(
                        onPressed: () {
                          context.push(
                              OutletProductCategoryManagementScreen.routeName);
                        },
                        child:
                            const Text('Tidak ada kategori produk terdaftar'),
                      ),
                    );
                  }

                  return MultiSelectChipField(
                    initialValue: widget.data == null ? [] : selectedCategories,
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
                      for (DriftEntityProductCategoryData? category
                          in snapshot.data!)
                        MultiSelectItem(category?.id, category?.name ?? ''),
                    ],
                    onSaved: (val) {
                      selectedCategories = List<int>.from(val!);
                    },
                  );
                }),
            const SizedBox(height: 20),
            if (widget.data != null)
              SwitchFormField(
                initialValue: active,
                onChanged: (val) => active = val,
                description: 'Aktif',
              )
          ],
        ),
      ),
    );
  }
}

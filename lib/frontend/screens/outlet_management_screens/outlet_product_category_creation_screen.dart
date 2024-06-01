import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/db/function.db.dart';
import 'package:kasir_toko/backend/models/product_category.dart';
import 'package:kasir_toko/frontend/widgets/common/modified_text_form_field.dart';
import 'package:kasir_toko/frontend/widgets/common/switch_form_field.dart';
import 'package:kasir_toko/frontend/widgets/outlet_management/outlet_management_creation_template.dart';

class OutletProductCategoryCreationScreen extends StatefulWidget {
  const OutletProductCategoryCreationScreen({super.key});

  static const routeName = '/outlet/management/product-category/creation';

  @override
  State<OutletProductCategoryCreationScreen> createState() =>
      _OutletProductCategoryCreationScreenState();
}

class _OutletProductCategoryCreationScreenState
    extends State<OutletProductCategoryCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final textEditingControllerProductCategoryName = TextEditingController();
  late ProductCategory? args;
  bool active = true;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (args == null) {
      DBFunction.createProductCategory(
          name: textEditingControllerProductCategoryName.text);
    } else {
      DBFunction.editProductCategory(
          productCategory: args!,
          name: textEditingControllerProductCategoryName.text,
          active: active);
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ProductCategory?;
    if (args != null) {
      textEditingControllerProductCategoryName.text = args!.name;
      setState(() => active = args!.active);
    }

    return OutletManagementCreationTemplate(
      title: 'Tambah Kategori Produk',
      isCreation: args == null,
      submit: _submit,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ModifiedTextFormField(
              controller: textEditingControllerProductCategoryName,
              labelName: 'Nama Kategori Produk',
              isCreation: args == null,
              value: args?.name,
              validator: ((value) =>
                  value?.isNotEmpty ?? false ? null : 'Salah'),
            ),
            const SizedBox(height: 20),
            if (args != null)
              SwitchFormField(
                  value: active,
                  onChanged: (val) =>
                      setState(() => active = args!.active = val),
                  description: 'Aktif')
          ],
        ),
      ),
    );
  }
}

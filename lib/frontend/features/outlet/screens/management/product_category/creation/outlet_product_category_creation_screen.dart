import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product_category/outlet_product_category_management_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_management_creation_template.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/modified_text_form_field.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/switch_form_field.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';

class OutletProductCategoryCreationScreen extends StatefulWidget {
  const OutletProductCategoryCreationScreen({super.key, this.data});

  final DriftEntityProductCategoryData? data;

  static const childRouteName = 'creation';
  static const routeName =
      '${OutletProductCategoryManagementScreen.routeName}/$childRouteName';

  @override
  State<OutletProductCategoryCreationScreen> createState() =>
      _OutletProductCategoryCreationScreenState();
}

class _OutletProductCategoryCreationScreenState
    extends State<OutletProductCategoryCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final textEditingControllerProductCategoryName = TextEditingController();
  bool active = true;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (widget.data == null) {
      InstanceDB.insertProductCategory(
          name: textEditingControllerProductCategoryName.text);
    } else {
      InstanceDB.updateProductCategory(
        category: widget.data!,
        name: textEditingControllerProductCategoryName.text,
        active: active,
      );
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    if (widget.data != null) {
      textEditingControllerProductCategoryName.text = widget.data!.name;
      active = widget.data!.active;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OutletManagementCreationTemplate(
      title: t.add_arg(text: t.product_category),
      isCreation: widget.data == null,
      submit: _submit,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ModifiedTextFormField(
              controller: textEditingControllerProductCategoryName,
              labelName: t.product_category_name,
              isCreation: widget.data == null,
              value: widget.data?.name,
              validator: ((value) => value?.isNotEmpty ?? false
                  ? null
                  : t.modified_text_form_widget.alert.cannot_be_empty),
            ),
            const SizedBox(height: 20),
            if (widget.data != null)
              SwitchFormField(
                initialValue: active,
                onChanged: (val) => active = val,
                description: t.active,
              )
          ],
        ),
      ),
    );
  }
}

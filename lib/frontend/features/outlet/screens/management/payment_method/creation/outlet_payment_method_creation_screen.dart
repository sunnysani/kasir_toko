import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/payment_method/outlet_payment_method_management_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_management_creation_template.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/modified_text_form_field.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/switch_form_field.dart';

class OutletPaymentMethodCreationScreen extends StatefulWidget {
  const OutletPaymentMethodCreationScreen({super.key, this.data});

  final DriftEntityPaymentMethodData? data;

  static const childRouteName = 'creation';
  static const routeName =
      '${OutletPaymentMethodManagementScreen.routeName}/$childRouteName';

  @override
  State<OutletPaymentMethodCreationScreen> createState() =>
      _OutletPaymentMethodCreationScreenState();
}

class _OutletPaymentMethodCreationScreenState
    extends State<OutletPaymentMethodCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final textEditingControllerPaymentMethodName = TextEditingController();
  bool sameAsAmount = true;
  bool active = true;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (widget.data == null) {
      InstanceDB.insertPaymentMethod(
          name: textEditingControllerPaymentMethodName.text,
          sameAsAmount: sameAsAmount);
    } else {
      InstanceDB.updatePaymentMethod(
        paymentMethod: widget.data!,
        name: textEditingControllerPaymentMethodName.text,
        sameAsAmount: sameAsAmount,
        active: active,
      );
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    if (widget.data != null) {
      textEditingControllerPaymentMethodName.text = widget.data!.name;
      setState(() {
        sameAsAmount = widget.data!.sameAsAmount;
        active = widget.data!.active;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OutletManagementCreationTemplate(
      title: 'Tambah Metode Pembayaran',
      isCreation: widget.data == null,
      submit: _submit,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ModifiedTextFormField(
              controller: textEditingControllerPaymentMethodName,
              labelName: 'Nama Metode Pembayaran',
              isCreation: widget.data == null,
              validator: ((value) =>
                  value?.isNotEmpty ?? false ? null : 'Salah'),
            ),
            const SizedBox(height: 20),
            SwitchFormField(
              initialValue: sameAsAmount,
              description: "Sama dengan Jumlah yang Dibelanjakan",
              onChanged: (val) => sameAsAmount = val,
            ),
            const SizedBox(height: 20),
            if (widget.data != null)
              SwitchFormField(
                initialValue: active,
                onChanged: (val) => active = val,
                description: 'Aktif',
              ),
          ],
        ),
      ),
    );
  }
}

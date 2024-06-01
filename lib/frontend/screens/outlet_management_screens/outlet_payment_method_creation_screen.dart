import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/db/function.db.dart';
import 'package:kasir_toko/backend/models/payment_method.dart';
import 'package:kasir_toko/frontend/widgets/common/modified_text_form_field.dart';
import 'package:kasir_toko/frontend/widgets/common/switch_form_field.dart';
import 'package:kasir_toko/frontend/widgets/outlet_management/outlet_management_creation_template.dart';

class OutletPaymentMethodCreationScreen extends StatefulWidget {
  const OutletPaymentMethodCreationScreen({super.key});

  static const routeName = '/outlet/management/payment-method/creation';

  @override
  State<OutletPaymentMethodCreationScreen> createState() =>
      _OutletPaymentMethodCreationScreenState();
}

class _OutletPaymentMethodCreationScreenState
    extends State<OutletPaymentMethodCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final textEditingControllerPaymentMethodName = TextEditingController();
  bool sameAsAmount = true;
  late PaymentMethod? args;
  bool active = true;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (args == null) {
      DBFunction.createPaymentMethod(
        name: textEditingControllerPaymentMethodName.text,
        sameAsAmount: sameAsAmount,
      );
    } else {
      DBFunction.editPaymentMethod(
        paymentMethod: args!,
        name: textEditingControllerPaymentMethodName.text,
        sameAsAmount: sameAsAmount,
        active: active,
      );
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as PaymentMethod?;
    if (args != null) {
      textEditingControllerPaymentMethodName.text = args!.name;
      setState(() {
        sameAsAmount = args!.sameAsAmount;
        active = args!.active;
      });
    }

    return OutletManagementCreationTemplate(
      title: 'Tambah Metode Pembayaran',
      isCreation: args == null,
      submit: _submit,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ModifiedTextFormField(
              controller: textEditingControllerPaymentMethodName,
              labelName: 'Nama Metode Pembayaran',
              isCreation: args == null,
              validator: ((value) =>
                  value?.isNotEmpty ?? false ? null : 'Salah'),
            ),
            const SizedBox(height: 20),
            SwitchFormField(
              value: sameAsAmount,
              description: "Sama dengan Jumlah yang Dibelanjakan",
              onChanged: (val) => setState(() {
                sameAsAmount = val;
                if (args != null) args!.sameAsAmount = val;
              }),
            ),
            const SizedBox(height: 20),
            if (args != null)
              SwitchFormField(
                  value: active,
                  onChanged: (val) =>
                      setState(() => active = args!.active = val),
                  description: 'Aktif'),
          ],
        ),
      ),
    );
  }
}

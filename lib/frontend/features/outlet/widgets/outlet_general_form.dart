import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/modified_text_form_field.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';

class OutletGeneralForm extends StatefulWidget {
  const OutletGeneralForm({super.key, this.hideHeaderTitle = false});

  final bool hideHeaderTitle;

  @override
  State<OutletGeneralForm> createState() => _OutletGeneralFormState();
}

class _OutletGeneralFormState extends State<OutletGeneralForm> {
  final textEditingControllerName =
      TextEditingController(text: InstanceDB.outlet.name);

  final textEditingControllerAddress =
      TextEditingController(text: InstanceDB.outlet.address);

  final textEditingControllerPhoneNumber =
      TextEditingController(text: InstanceDB.outlet.phoneNumber);

  final textEditingControllerReceiptMessage =
      TextEditingController(text: InstanceDB.outlet.receiptMessage);

  final textEditingControllerCurrencySymbol =
      TextEditingController(text: InstanceDB.outlet.currency);

  void _submit() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      currentName = textEditingControllerName.text;
      currentAddress = textEditingControllerAddress.text;
      currentPhoneNumber = textEditingControllerPhoneNumber.text;
      currentReceiptMessage = textEditingControllerReceiptMessage.text;
      currentCurrencySymbol = textEditingControllerCurrencySymbol.text;
    });

    InstanceDB.updateOutlet(
      name: textEditingControllerName.text,
      address: textEditingControllerAddress.text,
      phoneNumber: textEditingControllerPhoneNumber.text,
      receiptMessage: textEditingControllerReceiptMessage.text,
      currencySymbol: textEditingControllerCurrencySymbol.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(t.configuration_successfully_saved),
        backgroundColor: AppColors.positiveColor,
      ),
    );
  }

  String? currentName = InstanceDB.outlet.name;
  String? currentAddress = InstanceDB.outlet.address;
  String? currentPhoneNumber = InstanceDB.outlet.phoneNumber;
  String? currentReceiptMessage = InstanceDB.outlet.receiptMessage;
  String? currentCurrencySymbol = InstanceDB.outlet.currency;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!widget.hideHeaderTitle)
          Text(
            t.general_information,
            style: TextStyle(
                fontFamily: 'Montserrat', wordSpacing: 10, fontSize: 20),
          ),
        const SizedBox(height: 16),
        Form(
          child: Column(
            children: [
              ModifiedTextFormField(
                controller: textEditingControllerName,
                labelName: t.outlet_name,
                isOkEmpty: false,
                value: InstanceDB.outlet.name,
                isCreation: false,
              ),
              const SizedBox(height: 16),
              ModifiedTextFormField(
                controller: textEditingControllerAddress,
                labelName: t.outlet_addess,
                isOkEmpty: false,
                isCreation: false,
                value: InstanceDB.outlet.address,
              ),
              const SizedBox(height: 16),
              ModifiedTextFormField(
                controller: textEditingControllerPhoneNumber,
                labelName: t.outlet_phone_number,
                isOkEmpty: false,
                isCreation: false,
                value: InstanceDB.outlet.phoneNumber,
              ),
              const SizedBox(height: 16),
              ModifiedTextFormField(
                controller: textEditingControllerReceiptMessage,
                labelName: t.outlet_receipt_message,
                isOkEmpty: true,
                isCreation: false,
                maxLines: 3,
                value: InstanceDB.outlet.receiptMessage,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 16),
              ModifiedTextFormField(
                controller: textEditingControllerCurrencySymbol,
                labelName: t.currency_symbol,
                isOkEmpty: false,
                isCreation: false,
                value: InstanceDB.outlet.currency,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _submit,
          child: Text(t.save_general_information),
        ),
      ],
    );
  }
}

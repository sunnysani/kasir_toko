import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/db/function.db.dart';
import 'package:kasir_toko/frontend/widgets/common/modified_text_form_field.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

class OutletGeneralForm extends StatefulWidget {
  const OutletGeneralForm({super.key, this.hideHeaderTitle = false});

  final bool hideHeaderTitle;

  @override
  State<OutletGeneralForm> createState() => _OutletGeneralFormState();
}

class _OutletGeneralFormState extends State<OutletGeneralForm> {
  final textEditingControllerName =
      TextEditingController(text: StaticDB.outlet.name);

  final textEditingControllerAddress =
      TextEditingController(text: StaticDB.outlet.address);

  final textEditingControllerPhoneNumber =
      TextEditingController(text: StaticDB.outlet.phoneNumber);

  final textEditingControllerReceiptMessage =
      TextEditingController(text: StaticDB.outlet.receiptMessage);

  void _submit() {
    setState(() {
      currentName = textEditingControllerName.text;
      currentAddress = textEditingControllerAddress.text;
      currentPhoneNumber = textEditingControllerPhoneNumber.text;
      currentReceiptMessage = textEditingControllerReceiptMessage.text;
    });

    DBFunction.saveOutlet(
      name: textEditingControllerName.text,
      address: textEditingControllerAddress.text,
      phoneNumber: textEditingControllerPhoneNumber.text,
      receiptMessage: textEditingControllerReceiptMessage.text,
    );
  }

  String? currentName = StaticDB.outlet.name;
  String? currentAddress = StaticDB.outlet.address;
  String? currentPhoneNumber = StaticDB.outlet.phoneNumber;
  String? currentReceiptMessage = StaticDB.outlet.receiptMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!widget.hideHeaderTitle)
          const Text(
            'INFORMASI UMUM',
            style: TextStyle(
                fontFamily: 'Montserrat', wordSpacing: 10, fontSize: 20),
          ),
        const SizedBox(height: 20),
        Form(
          child: Column(
            children: [
              ModifiedTextFormField(
                controller: textEditingControllerName,
                labelName: 'Nama Toko',
                isOkEmpty: false,
                value: StaticDB.outlet.name ?? '',
                isCreation: false,
              ),
              const SizedBox(height: 20),
              ModifiedTextFormField(
                controller: textEditingControllerAddress,
                labelName: 'Alamat Toko',
                isOkEmpty: false,
                isCreation: false,
                value: StaticDB.outlet.address ?? '',
              ),
              const SizedBox(height: 20),
              ModifiedTextFormField(
                controller: textEditingControllerPhoneNumber,
                labelName: 'No. Telepon Toko',
                isOkEmpty: false,
                isCreation: false,
                value: StaticDB.outlet.phoneNumber ?? '',
              ),
              const SizedBox(height: 20),
              ModifiedTextFormField(
                controller: textEditingControllerReceiptMessage,
                labelName: 'Pesan di Struk',
                isOkEmpty: true,
                isCreation: false,
                maxLines: 3,
                value: StaticDB.outlet.receiptMessage ?? '',
                keyboardType: TextInputType.multiline,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Simpan Informasi Umum'),
        ),
      ],
    );
  }
}

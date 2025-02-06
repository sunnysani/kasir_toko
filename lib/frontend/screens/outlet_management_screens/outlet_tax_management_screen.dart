import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokkoo_pos_lite/backend/db/function.db.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/common/modified_text_form_field.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/common/switch_form_field.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/outlet_management/outlet_management_creation_template.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/static_db.dart';

class OutletTaxManagementScreen extends StatefulWidget {
  const OutletTaxManagementScreen({super.key});

  static const routeName = '/outlet/management/tax';

  @override
  State<OutletTaxManagementScreen> createState() =>
      _OutletTaxManagementScreenState();
}

class _OutletTaxManagementScreenState extends State<OutletTaxManagementScreen> {
  late bool active;
  final textEditingControllerTaxRate = TextEditingController();

  void setActive(bool newActive) => setState(() => active = newActive);

  void _submit() {
    DBFunction.saveOutlet(
        activeTax: active,
        taxPercentage: double.tryParse(textEditingControllerTaxRate.text));

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    setActive(StaticDB.outlet.activeTax);
    textEditingControllerTaxRate.text =
        StaticDB.outlet.taxPercentage.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OutletManagementCreationTemplate(
      title: 'Perpajakan',
      isCreation: false,
      submit: _submit,
      child: Column(
        children: [
          SwitchFormField(
            value: active,
            onChanged: setActive,
            description: 'Aktif',
          ),
          const SizedBox(height: 20),
          ModifiedTextFormField(
            controller: textEditingControllerTaxRate,
            keyboardType: TextInputType.number,
            labelName: 'Persenan Pajak',
            isCreation: false,
            validator: ((value) => value?.isNotEmpty ?? false ? null : 'Salah'),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,12}$')),
            ],
            suffix: '%',
          ),
        ],
      ),
    );
  }
}

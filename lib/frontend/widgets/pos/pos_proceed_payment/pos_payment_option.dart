import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/backend/models/payment_method.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

class PosPaymentOption extends StatefulWidget {
  const PosPaymentOption({
    super.key,
    required this.orderRow,
  });

  final OrderRow orderRow;

  @override
  State<PosPaymentOption> createState() => _PosPaymentOptionState();
}

class _PosPaymentOptionState extends State<PosPaymentOption> {
  PaymentMethod? paymentMethod;
  double change = 0;
  TextEditingController payAmountController = TextEditingController();

  void onChangedPaymentMethod(PaymentMethod? newPaymentMethod) {
    widget.orderRow.paymentMethod.target = newPaymentMethod;
    setState(() => paymentMethod = newPaymentMethod);

    if (newPaymentMethod?.sameAsAmount ?? false) {
      payAmountController.text = widget.orderRow.totalPrice.toString();
    }
  }

  void triggerPayAmountListener() {
    double currentPayAmount = payAmountController.text.isNotEmpty
        ? double.parse(payAmountController.text)
        : 0;
    setState(() => change = currentPayAmount - widget.orderRow.totalPrice);

    widget.orderRow.payAmount = currentPayAmount;
  }

  @override
  void initState() {
    triggerPayAmountListener();
    payAmountController.addListener(triggerPayAmountListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpaceEvenRow(description: 'Total', value: widget.orderRow.totalPrice),
        const SizedBox(height: 20),
        DropdownButtonFormField(
          // TODO: Does the color need to be adjusted?
          style: TextStyle(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
          decoration: const InputDecoration(labelText: 'Metode Pembayaran'),
          isExpanded: true,
          items: StaticDB.outlet
              .getAllActiveSortedPaymentMethods()
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
          onChanged: onChangedPaymentMethod,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: payAmountController,
          readOnly: paymentMethod?.sameAsAmount ?? false,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,12}$')),
          ],
          decoration: InputDecoration(
            prefix: const Text('Rp '),
            label: const Text('Pay Amount'),
            filled: paymentMethod?.sameAsAmount ?? false,
          ),
        ),
        const SizedBox(height: 20),
        SpaceEvenRow(description: 'Kembalian', value: change),
      ],
    );
  }
}

class SpaceEvenRow extends StatelessWidget {
  const SpaceEvenRow({
    super.key,
    required this.description,
    required this.value,
  });

  final String description;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          description,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
            .format(value))
      ],
    );
  }
}

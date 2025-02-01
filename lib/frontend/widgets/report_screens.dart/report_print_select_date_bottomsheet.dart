// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kasir_toko/backend/models/order_row.dart';
import 'package:kasir_toko/backend/provider/esc_printer.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/common/function.common.dart';
import 'package:provider/provider.dart';

enum ReportPrintType {
  eJournal,
  productSales,
}

class ReportPrintSelectDateBottomsheet extends StatefulWidget {
  const ReportPrintSelectDateBottomsheet(this.type, this.date, {super.key});

  final ReportPrintType type;
  final DateTime date;

  @override
  State<ReportPrintSelectDateBottomsheet> createState() =>
      _ReportPrintSelectDateBottomsheetState();
}

class _ReportPrintSelectDateBottomsheetState
    extends State<ReportPrintSelectDateBottomsheet> {
  TimeOfDay selectedStartTime = const TimeOfDay(hour: 7, minute: 0);
  TimeOfDay selectedEndTime = const TimeOfDay(hour: 18, minute: 0);

  TextEditingController selectedStartTimeEditor = TextEditingController();
  TextEditingController selectedEndTimeEditor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    selectedStartTimeEditor.text = selectedStartTime.format(context);
    selectedEndTimeEditor.text = selectedEndTime.format(context);

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
          horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
              maxWidth: 550, context: context),
          vertical: 32),
      children: [
        const Text(
          'Pilih Tanggal',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(
            child: TextField(
              controller: selectedStartTimeEditor,
              readOnly: true,
              onTap: () async {
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: selectedStartTime,
                  initialEntryMode: TimePickerEntryMode.dialOnly,
                );
                if (selectedTime != null) {
                  setState(() => selectedEndTime = selectedTime);
                }
              },
            ),
          ),
          const Text(' - ', style: TextStyle(fontSize: 24)),
          Expanded(
            child: TextField(
              controller: selectedEndTimeEditor,
              readOnly: true,
              onTap: () async {
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: selectedEndTime,
                  initialEntryMode: TimePickerEntryMode.dialOnly,
                );
                if (selectedTime != null) {
                  setState(() => selectedEndTime = selectedTime);
                }
              },
            ),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Status printer: '),
            TextButton(
              onPressed: () =>
                  CommonFunction.showEscPrinterConnectModal(context),
              child: Text(
                  '${Provider.of<EscPrinter>(context).selectedDevice?.name ?? 'Tidak Terhubung'} (${Provider.of<EscPrinter>(context).printing ? 'Mencetak' : 'Diam'})'),
            )
          ],
        ),
        ElevatedButton(
          onPressed: () {
            if (selectedEndTime.compareTo(selectedStartTime) <= 0) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Waktu Selesai > Waktu Mulai'),
                  backgroundColor: AppColors.negativeColor,
                ),
              );
            }

            switch (widget.type) {
              case ReportPrintType.eJournal:
                Provider.of<EscPrinter>(context, listen: false).printEJournal(
                    context, widget.date, selectedStartTime, selectedEndTime);
                break;
              case ReportPrintType.productSales:
                Provider.of<EscPrinter>(context, listen: false)
                    .printProudctSales(context, widget.date, selectedStartTime,
                        selectedEndTime);
                break;
            }
          },
          style: ButtonTextStyle.secondaryButtonStyle,
          child: const Text('Cetak'),
        )
      ],
    );
  }
}

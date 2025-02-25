// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokkoo_pos_lite/backend/provider/esc_printer.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/providers/pos_state.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/printer_status.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';
import 'package:provider/provider.dart';

enum ReportPrintType {
  eJournal,
  productSales,
}

class ReportPrintSelectDateBottomsheet extends ConsumerStatefulWidget {
  const ReportPrintSelectDateBottomsheet(
      this.type, this.startDate, this.endDate,
      {super.key});

  final ReportPrintType type;
  final DateTime startDate;
  final DateTime endDate;

  @override
  ConsumerState<ReportPrintSelectDateBottomsheet> createState() =>
      _ReportPrintSelectDateBottomsheetState();
}

class _ReportPrintSelectDateBottomsheetState
    extends ConsumerState<ReportPrintSelectDateBottomsheet> {
  TimeOfDay selectedStartTime = const TimeOfDay(hour: 6, minute: 30);
  TimeOfDay selectedEndTime = const TimeOfDay(hour: 22, minute: 0);

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
                  setState(() => selectedStartTime = selectedTime);
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
        const PrinterStatus(),
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
                ref.read(escPrinterProvider.notifier).printEJournal(
                      context,
                      widget.startDate,
                      widget.endDate,
                      selectedStartTime,
                      selectedEndTime,
                    );
                break;
              case ReportPrintType.productSales:
                ref.read(escPrinterProvider.notifier).printProudctSales(
                      context,
                      widget.startDate,
                      widget.endDate,
                      selectedStartTime,
                      selectedEndTime,
                    );
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

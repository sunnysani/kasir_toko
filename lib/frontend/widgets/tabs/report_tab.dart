import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir_toko/frontend/screens/report_screens/report_main_screen.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/common/function.common.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({super.key});

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  DateTime? selectedDate;
  TextEditingController textFieldDateSelectorController =
      TextEditingController();
  TextEditingController textFieldCodeAccessController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime.now());

    setState(() => selectedDate = newSelectedDate);
    textFieldDateSelectorController.text = newSelectedDate == null
        ? ""
        : DateFormat('yyyy MM dd').format(newSelectedDate);
  }

  Future<void> seeReport(BuildContext context) async {
    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pilihan tanggal kosong'),
          backgroundColor: AppColors.negativeColor,
        ),
      );
      return;
    }
    await showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          shrinkWrap: true,
          children: [
            const Text(
              'Konfirmasi Kode',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.05,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: textFieldCodeAccessController,
              decoration: const InputDecoration(
                labelText: 'Kode Akses',
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (textFieldCodeAccessController.text ==
                      'LaporanTinuk2019') {
                    Navigator.of(ctx).pop();
                    Navigator.of(context).pushNamed(ReportMainScreen.routeName,
                        arguments: selectedDate!);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Kode Salah!'),
                        backgroundColor: AppColors.negativeColor,
                      ),
                    );
                    Navigator.of(ctx).pop();
                  }
                },
                child: const Text('Konfirmasi Kode'))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Make below component reusable as in pos_tab
    return Center(
        child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
            maxWidth: 550, context: context),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Icon(Icons.calendar_month,
                size: 200, color: AppColors.mainColor),
            InkWell(
              onTap: () => selectDate(context),
              child: TextField(
                controller: textFieldDateSelectorController,
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Pilih Tanggal',
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.accentColor),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => seeReport(context),
              child: const Text('Lihat Laporan'),
            )
          ],
        ),
      ),
    ));
  }
}

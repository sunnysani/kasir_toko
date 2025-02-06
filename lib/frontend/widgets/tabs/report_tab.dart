import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tokkoo_pos_lite/frontend/screens/report_screens/report_main_screen.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/common/hideable_text_form_field.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_settings.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({super.key});

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  DateTime selectedDate = DateTime.now();
  TextEditingController textFieldDateSelectorController = TextEditingController(
      text: DateFormat('yyyy MM dd').format(DateTime.now()));
  TextEditingController textFieldCodeAccessController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime.now());

    if (newSelectedDate == null) return;

    setState(() => selectedDate = newSelectedDate);
    // ignore: unnecessary_null_comparison
    textFieldDateSelectorController.text =
        DateFormat('yyyy MM dd').format(newSelectedDate);
  }

  Future<void> seeReport(BuildContext context) async {
    final reportAccessKey =
        AppSettings.sharedPreferences.getString("REPORT_ACCESS_KEY");

    if (reportAccessKey == null || reportAccessKey.isEmpty) {
      Navigator.of(context)
          .pushNamed(ReportMainScreen.routeName, arguments: selectedDate);
    } else {
      await showDialog(
        context: context,
        builder: (ctx) => Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
              HideableTextFormField(
                controller: textFieldCodeAccessController,
                labelText: 'Kode Akses',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (textFieldCodeAccessController.text == reportAccessKey) {
                      Navigator.of(ctx).pop();
                      Navigator.of(context).pushNamed(
                          ReportMainScreen.routeName,
                          arguments: selectedDate);
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
  }

  @override
  Widget build(BuildContext context) {
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
                readOnly: true,
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

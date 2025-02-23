import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tokkoo_pos_lite/frontend/features/report/screens/report_main_screen.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/hideable_text_form_field.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_settings.dart';

class ReportTabScreen extends StatefulWidget {
  const ReportTabScreen({super.key});
  static const routeName = '/report';

  @override
  State<ReportTabScreen> createState() => _ReportTabScreenState();
}

class _ReportTabScreenState extends State<ReportTabScreen> {
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  TextEditingController textFieldDateSelectorController = TextEditingController(
      text: DateFormat('yyyy MM dd').format(DateTime.now()));
  TextEditingController textFieldCodeAccessController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final newSelectedDate = await showDateRangePicker(
        context: context,
        currentDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime.now());

    if (newSelectedDate == null) return;

    setState(() {
      selectedStartDate = newSelectedDate.start;
      selectedEndDate = newSelectedDate.end;
    });
    // ignore: unnecessary_null_comparison
    if (CommonFunction.sameDayDateTime(
        newSelectedDate.start, newSelectedDate.end)) {
      textFieldDateSelectorController.text =
          DateFormat('yyyy MM dd').format(newSelectedDate.start);
    } else {
      textFieldDateSelectorController.text =
          "${DateFormat('yyyy MM dd').format(newSelectedDate.start)} - ${DateFormat('yyyy MM dd').format(newSelectedDate.end)}";
    }
  }

  Future<void> seeReport(BuildContext context) async {
    final reportAccessKey =
        AppSettings.sharedPreferences.getString("REPORT_ACCESS_KEY");

    if (reportAccessKey == null || reportAccessKey.isEmpty) {
      context.push(
        ReportMainScreen.routeName,
        extra: ReportMainScreenParam(
            startTime: selectedStartDate, endTime: selectedEndDate),
      );
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
                      context.push(
                        ReportMainScreen.routeName,
                        extra: ReportMainScreenParam(
                            startTime: selectedStartDate,
                            endTime: selectedEndDate),
                      );
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
            TextField(
              controller: textFieldDateSelectorController,
              readOnly: true,
              onTap: () => selectDate(context),
              decoration: InputDecoration(
                labelText: 'Pilih Tanggal',
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.accentColor),
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

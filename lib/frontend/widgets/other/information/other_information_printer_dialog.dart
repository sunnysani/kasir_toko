import 'package:app_settings/app_settings.dart' as app_settings_lib;
import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/backend/provider/esc_printer.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/common/carousel_with_dot_navigator.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/common/printer_status.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:provider/provider.dart';

class OtherInformationPrinterDialogItemBottomAction {
  final String label;
  final VoidCallback onTap;

  OtherInformationPrinterDialogItemBottomAction({
    required this.label,
    required this.onTap,
  });
}

class OtherInformationPrinterDialogItem {
  final Widget header;
  final String title;
  final Widget? titleTrailing;
  final Widget description;
  final dynamic bottomAction;

  OtherInformationPrinterDialogItem({
    required this.header,
    required this.title,
    this.titleTrailing,
    required this.description,
    this.bottomAction,
  });
}

class OtherInformationPrinterDialog extends StatelessWidget {
  const OtherInformationPrinterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Panduan Koneksi Printer',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Divider(),
              ],
            ),
          ),
          const SizedBox(height: 8),
          CarouselWithDotNavigator(
              height: 420,
              items: [
                OtherInformationPrinterDialogItem(
                  header: Image.asset("assets/images/printer-tutorial-1.jpeg"),
                  title: "1. Sediakan Perangkat",
                  description: const Text(
                      'Perangkat yang dibutuhkan adalah Thermal Printer yang memiliki fitur Bluetooth dengan lebar kertas 58mm'),
                ),
                OtherInformationPrinterDialogItem(
                  header: Image.asset("assets/images/printer-tutorial-2.jpeg"),
                  title: "2. Hubungkan Perangkat",
                  description: const Text(
                      'Buka pengaturan dan pasangkan dengan perangkat Thermal Printer'),
                  bottomAction: OtherInformationPrinterDialogItemBottomAction(
                    label: 'Buka Pengaturan Bluetooth',
                    onTap: () => app_settings_lib.AppSettings.openAppSettings(
                        type: app_settings_lib.AppSettingsType.bluetooth),
                  ),
                ),
                OtherInformationPrinterDialogItem(
                  header: Image.asset("assets/images/printer-tutorial-3.jpeg"),
                  title: "3. Hubungkan Printer",
                  description: const Text(
                      'Klik tombol teks "Tidak Terhubung (Diam)". Untuk menghubungkan'),
                  bottomAction: const PrinterStatus(),
                ),
                OtherInformationPrinterDialogItem(
                  header: Image.asset("assets/images/printer-tutorial-4.jpeg"),
                  title: "4. Pilih perangkat",
                  description: const Text(
                      'Pilih perangkat sesuai dengan nama dan MacAddress'),
                  bottomAction: const PrinterStatus(),
                ),
                OtherInformationPrinterDialogItem(
                    header:
                        Image.asset("assets/images/printer-tutorial-5.jpeg"),
                    title: "5. Perangkat berhasil terhubung",
                    description: const Text(
                        'Saat status printer menampilkan nama, perangkat berhasil terhubung. Klik tombol "Cetak" untuk mencetak'),
                    bottomAction: Column(
                      children: [
                        const PrinterStatus(),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () =>
                                Provider.of<EscPrinter>(context, listen: false)
                                    .printTesting(context),
                            style: ButtonTextStyle.secondaryButtonStyle,
                            child: const Text('Tes Cetak'),
                          ),
                        ),
                      ],
                    )),
              ]
                  .map((item) => ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          SizedBox(height: 200, child: item.header),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              if (item.titleTrailing != null)
                                item.titleTrailing!,
                            ],
                          ),
                          item.description,
                          if (item.bottomAction is Widget)
                            item.bottomAction
                          else if (item.bottomAction
                              is OtherInformationPrinterDialogItemBottomAction)
                            TextButton(
                              onPressed: item.bottomAction!.onTap,
                              child: Text(item.bottomAction!.label),
                            )
                        ],
                      ))
                  .toList()),
        ],
      ),
    );
  }
}

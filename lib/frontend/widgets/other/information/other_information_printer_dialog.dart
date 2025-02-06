import 'package:app_settings/app_settings.dart' as appSetting;
import 'package:flutter/material.dart';
import 'package:kasir_toko/frontend/widgets/common/carousel_with_dot_navigator.dart';

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
  final OtherInformationPrinterDialogItemBottomAction? bottomAction;

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
              height: 380,
              items: [
                OtherInformationPrinterDialogItem(
                  header: Image.asset("assets/images/printers.jpg"),
                  title: "Sediakan Perangkat",
                  description: const Text(
                      'Perangkat yang dibutuhkan adalah Thermal Printer yang memiliki fitur Bluetooth dengan lebar kertas 58mm'),
                ),
                OtherInformationPrinterDialogItem(
                  header: Image.asset(
                      "assets/images/printers-pairing-bluetooth.jpg"),
                  title: "Hubungkan Perangkat",
                  description: const Text(
                      'Buka pengaturan dan pasangkan dengan perangkat Thermal Printer'),
                  bottomAction: OtherInformationPrinterDialogItemBottomAction(
                    label: 'Buka Pengaturan Bluetooth',
                    onTap: () => appSetting.AppSettings.openAppSettings(
                        type: appSetting.AppSettingsType.bluetooth),
                  ),
                ),
              ]
                  .map((item) => ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          SizedBox(height: 240, child: item.header),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              if (item.titleTrailing != null)
                                item.titleTrailing!,
                            ],
                          ),
                          item.description,
                          if (item.bottomAction != null)
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

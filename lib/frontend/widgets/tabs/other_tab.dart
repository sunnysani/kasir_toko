import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/other/information/other_information_printer_dialog.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/other/information/other_information_usage_dialog.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/other/setting/other_setting_manage_data_access_code_dialog.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class OtherTabItem {
  final IconData iconData;
  final String label;
  final List<OtherTabItemChild> children;

  OtherTabItem({
    required this.iconData,
    required this.label,
    required this.children,
  });
}

class OtherTabItemChild {
  final String label;
  final VoidCallback onTap;

  OtherTabItemChild({
    required this.label,
    required this.onTap,
  });
}

class OtherTab extends StatelessWidget {
  const OtherTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
              maxWidth: 550,
              context: context,
            )),
        children: [
          OtherTabItem(
            iconData: Icons.settings_outlined,
            label: "Pengaturan",
            children: [
              OtherTabItemChild(
                label: "Atur Kode Akses Data Penjualan",
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          const OtherSettingManageDataAccessCodeDialog());
                },
              ),
            ],
          ),
          OtherTabItem(
            iconData: Icons.book_outlined,
            label: "Informasi",
            children: [
              OtherTabItemChild(
                  label: "Panduan Penggunaan Aplikasi",
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            const OtherInformationUsageDialog());
                  }),
              OtherTabItemChild(
                  label: "Panduan Koneksi Printer",
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            const OtherInformationPrinterDialog());
                  }),
              OtherTabItemChild(
                  label: "Website",
                  onTap: () {
                    // launchUrl(Uri.parse('https://tokkoopos.com'));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Website belum tersedia'),
                        backgroundColor: AppColors.warningColor,
                      ),
                    );
                  }),
            ],
          ),
        ]
            .map((item) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: [
                      Icon(item.iconData),
                      const SizedBox(width: 16),
                      Text(item.label),
                    ]),
                    const Divider(),
                    for (final child in item.children)
                      ListTile(
                        title: Text(
                          child.label,
                          style: const TextStyle(fontSize: 14),
                        ),
                        onTap: child.onTap,
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    const SizedBox(height: 16)
                  ],
                ))
            .toList(),
      ),
    );
  }
}

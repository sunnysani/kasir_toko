import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/features/other/widgets/information/other_information_printer_dialog.dart';
import 'package:tokkoo_pos_lite/frontend/features/other/widgets/information/other_information_usage_dialog.dart';
import 'package:tokkoo_pos_lite/frontend/features/other/widgets/setting/other_setting_manage_data_access_code_dialog.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';

class OtherTabScreenItem {
  final IconData iconData;
  final String label;
  final List<OtherTabScreenItemChild> children;

  OtherTabScreenItem({
    required this.iconData,
    required this.label,
    required this.children,
  });
}

class OtherTabScreenItemChild {
  final String label;
  final VoidCallback onTap;

  OtherTabScreenItemChild({
    required this.label,
    required this.onTap,
  });
}

class OtherTabScreen extends StatelessWidget {
  const OtherTabScreen({super.key});
  static const routeName = '/other';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: LayoutMaxWidth(
          verticalPadding: 16,
          child: Column(
            children: [
              OtherTabScreenItem(
                iconData: Icons.settings_outlined,
                label: "Pengaturan",
                children: [
                  OtherTabScreenItemChild(
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
              OtherTabScreenItem(
                iconData: Icons.book_outlined,
                label: "Informasi",
                children: [
                  OtherTabScreenItemChild(
                      label: "Panduan Penggunaan Aplikasi",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                const OtherInformationUsageDialog());
                      }),
                  OtherTabScreenItemChild(
                      label: "Panduan Koneksi Printer",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                const OtherInformationPrinterDialog());
                      }),
                  OtherTabScreenItemChild(
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/common/hideable_text_form_field.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_settings.dart';

class OtherSettingManageDataAccessCodeDialog extends StatefulWidget {
  const OtherSettingManageDataAccessCodeDialog({super.key});

  @override
  State<OtherSettingManageDataAccessCodeDialog> createState() =>
      _OtherSettingManageDataAccessCodeDialogState();
}

class _OtherSettingManageDataAccessCodeDialogState
    extends State<OtherSettingManageDataAccessCodeDialog> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController removeConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final accessKey =
        AppSettings.sharedPreferences.getString("REPORT_ACCESS_KEY");

    return Dialog(
        child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      children: [
        const Text('Atur Kode Akses',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const Divider(),
        const SizedBox(height: 8),
        if (accessKey == null || accessKey.isEmpty) ...[
          const Text('Tidak ada kode akses data penjualan'),
          const SizedBox(height: 8),
          const Text('Kode akses digunakan untuk mengakses data penjualan'),
          const SizedBox(height: 16),
          HideableTextFormField(
            controller: passwordController,
            labelText: "Tambah Kode Akses",
          ),
          const SizedBox(height: 8),
          FilledButton(
              onPressed: () {
                if (passwordController.text == "") return;
                AppSettings.sharedPreferences
                    .setString("REPORT_ACCESS_KEY", passwordController.text);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Password berhasil disimpan'),
                    backgroundColor: AppColors.positiveColor,
                  ),
                );
              },
              child: const Text('Simpan'))
        ] else ...[
          const Text('Kode akses sudah diatur'),
          const SizedBox(height: 8),
          const Text(
              'Jika anda lupa, Anda dapat menghilangkan kode akses dengan mengetik "reset code" di bawah dan klik Reset'),
          const SizedBox(height: 16),
          TextField(
            controller: removeConfirmationController,
            decoration: const InputDecoration(labelText: "Kofirmasi"),
          ),
          const SizedBox(height: 8),
          FilledButton(
              onPressed: () {
                if (removeConfirmationController.text != "reset code") return;
                AppSettings.sharedPreferences.remove("REPORT_ACCESS_KEY");
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Password berhasil direset'),
                    backgroundColor: AppColors.positiveColor,
                  ),
                );
              },
              child: const Text('Reset'))
        ]
      ],
    ));
  }
}

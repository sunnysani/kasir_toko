import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/hideable_text_form_field.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
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

  int _resetTapCount = 0;
  Timer? _timer;

  void _handleResetAccessCodeTap() {
    _resetTapCount++;

    // Reset after 500ms if no more taps
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: 500), () {
      _resetTapCount = 0;
    });

    if (_resetTapCount == 3) {
      _timer?.cancel(); // Stop timer after success
      _resetTapCount = 0;
      AppSettings.sharedPreferences.remove("REPORT_ACCESS_KEY");
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.feature_others.access_code_has_been_reset),
          backgroundColor: AppColors.positiveColor,
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accessKey =
        AppSettings.sharedPreferences.getString("REPORT_ACCESS_KEY");

    return LayoutMaxWidth(
      child: Dialog(
          child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          Text(t.feature_others.manage_accesss_code,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Divider(),
          const SizedBox(height: 8),
          if (accessKey == null || accessKey.isEmpty) ...[
            Text(t.feature_others.access_code_has_not_been_setup),
            const SizedBox(height: 8),
            Text(t.feature_others
                .access_code_used_to_access_privillaged_data_and_setting),
            const SizedBox(height: 16),
            HideableTextFormField(
              controller: passwordController,
              labelText: t.feature_others.add_access_code,
            ),
            const SizedBox(height: 8),
            FilledButton(
                onPressed: () {
                  if (passwordController.text == "") return;
                  AppSettings.sharedPreferences
                      .setString("REPORT_ACCESS_KEY", passwordController.text);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text(t.feature_others.access_code_successfully_saved),
                      backgroundColor: AppColors.positiveColor,
                    ),
                  );
                },
                child: Text(t.save))
          ] else ...[
            Text(t.feature_others.access_code_is_configured),
            const SizedBox(height: 8),
            Text(t.feature_others.access_code_reset_text),
            const SizedBox(height: 8),
            FilledButton(
                onPressed: _handleResetAccessCodeTap,
                child: Text(t.feature_others.access_code_reset_button))
          ]
        ],
      )),
    );
  }
}

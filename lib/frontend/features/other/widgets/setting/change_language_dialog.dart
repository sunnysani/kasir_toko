import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_locale_conf.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({super.key});

  String _getFlag(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return '🇺🇸';
      case AppLocale.id:
        return '🇮🇩';
    }
  }

  String _getLanguageName(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return 'English';
      case AppLocale.id:
        return 'Bahasa Indonesia';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutMaxWidth(
      child: Dialog(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 16),
          shrinkWrap: true,
          children: [
            Text(
              t.feature_others.change_language,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            ...AppLocale.values.map((locale) {
              return ListTile(
                leading: Text(_getFlag(locale)),
                title: Text(_getLanguageName(locale)),
                onTap: () {
                  AppLocaleConf.changeLanguage(locale);
                  context.pop();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

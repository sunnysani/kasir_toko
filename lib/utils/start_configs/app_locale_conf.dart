import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/main.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_settings.dart';

class AppLocaleConf {
  static Future<void> start() async {
    final prefLang =
        AppSettings.sharedPreferences.getString('PREFERRED_LANGUAGE');

    if (prefLang != null && AppLocale.values.any((e) => e.name == prefLang)) {
      LocaleSettings.setLocale(AppLocale.values.byName(prefLang));
    } else {
      LocaleSettings.setLocale(AppLocale.en); // fallback if missing or invalid
    }
  }

  static changeLanguage(AppLocale appLocale) {
    AppSettings.sharedPreferences
        .setString('PREFERRED_LANGUAGE', appLocale.name);
    LocaleSettings.setLocale(appLocale);

    if (rootNavigatorKey.currentContext != null) {
      RestartWidget.restartApp(rootNavigatorKey.currentContext!);
    }
  }
}

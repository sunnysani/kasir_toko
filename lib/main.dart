import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kasir_toko/backend/provider/esc_printer.dart';
import 'package:kasir_toko/backend/provider/preferred_language.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_payment_method_creation_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_payment_method_management_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_product_category_creation_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_product_category_management_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_product_creation_screen.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_product_management.dart';
import 'package:kasir_toko/frontend/screens/outlet_management_screens/outlet_tax_management_screen.dart';
import 'package:kasir_toko/frontend/screens/pos_screens/pos_main_screen.dart';
import 'package:kasir_toko/frontend/screens/pos_screens/pos_proceed_payment_screen.dart';
import 'package:kasir_toko/frontend/screens/pos_screens/pos_proceed_receipt_screen.dart';
import 'package:kasir_toko/frontend/screens/report_screens/report_main_screen.dart';
import 'package:kasir_toko/frontend/screens/tab_screen/tab_screen.dart';
import 'package:kasir_toko/l10n/l10n.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/start_configs/app_info.dart';
import 'package:kasir_toko/utils/start_configs/app_settings.dart';
import 'package:kasir_toko/utils/start_configs/device_info.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';
import 'package:provider/provider.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppSettings.start();
    await AppInfo.start();
    await DeviceInfo.start();
    await StaticDB.start();

    // Change the status bar color
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.mainColor));

    runApp(const MyApp());
  }, (error, stack) {
    print(error);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EscPrinter()),
        ChangeNotifierProvider(create: (_) => PreferredLanguage()),
      ],
      builder: (context, child) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kasir Toko',
          theme: ThemeData(
            fontFamily: 'Roboto',
            brightness: Brightness.light,
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: AppColors.mainColor,
              onPrimary: Colors.white,
              secondary: AppColors.accentColor,
              onSecondary: Colors.white,
              error: AppColors.negativeColor,
              onError: Colors.white,
              background: AppColors.backgroundBaseColor,
              onBackground: Colors.black,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.mainColor,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
              foregroundColor: Colors.white,
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: AppColors.mainColor,
              foregroundColor: Colors.white,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.mainColor),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(500, 50),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              suffixIconColor: AppColors.mainColor,
              focusColor: AppColors.mainColor,
              fillColor: const Color.fromARGB(30, 124, 146, 153),
              labelStyle:
                  const TextStyle(fontSize: 14, color: AppColors.inactiveColor),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.inactiveColor)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.mainColor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            cardTheme: const CardTheme(
              surfaceTintColor: Colors.white,
              elevation: 2,
            ),
            dataTableTheme: const DataTableThemeData(
              columnSpacing: 30,
              horizontalMargin: BorderSide.strokeAlignOutside,
            ),
          ),
          routes: {
            TabScreen.routeName: (ctx) => const TabScreen(),
            OutletProductCategoryCreationScreen.routeName: (ctx) =>
                const OutletProductCategoryCreationScreen(),
            OutletProductCategoryManagementScreen.routeName: (ctx) =>
                const OutletProductCategoryManagementScreen(),
            OutletProductCreationScreen.routeName: (ctx) =>
                const OutletProductCreationScreen(),
            OutletProductManagementScreen.routeName: (ctx) =>
                const OutletProductManagementScreen(),
            OutletPaymentMethodCreationScreen.routeName: (ctx) =>
                const OutletPaymentMethodCreationScreen(),
            OutletPaymentMethodManagementScreen.routeName: (ctx) =>
                const OutletPaymentMethodManagementScreen(),
            OutletTaxManagementScreen.routeName: (ctx) =>
                const OutletTaxManagementScreen(),
            PosMainScreen.routeName: (ctx) => const PosMainScreen(),
            PosProceedPaymentScreen.routeName: (ctx) =>
                const PosProceedPaymentScreen(),
            PosProceedReceiptScreen.routeName: (ctx) =>
                const PosProceedReceiptScreen(),
            ReportMainScreen.routeName: (ctx) => const ReportMainScreen(),
          },
          supportedLocales: L10n.supportedLanguages,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: L10n.stringLocaleMap[
              Provider.of<PreferredLanguage>(context).selectedLanguage],
          home: const TabScreen(),
        ),
      ),
    );
  }
}

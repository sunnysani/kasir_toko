import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tokkoo_pos_lite/app_router.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_info.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_locale_conf.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_settings.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/device_info.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppSettings.start();
    await AppInfo.start();
    await DeviceInfo.start();
    await InstanceDB.start();
    await AppLocaleConf.start();

    // Change the status bar color
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.mainColor));

    runApp(GlobalLoaderOverlay(
      overlayWidgetBuilder: (_) => Center(
        child: CircularProgressIndicator(color: AppColors.mainColor),
      ),
      child: const MainWidget(),
    ));
  }, (error, stack) {
    debugPrint(error.toString(), wrapWidth: 4);
    debugPrintStack(stackTrace: stack);
  });
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: TranslationProvider(
        child: RestartWidget(
          child: MaterialApp.router(
            key: rootNavigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Tokkoo PoS',
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
                surface: AppColors.backgroundBaseColor,
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
                  textStyle: WidgetStateProperty.all<TextStyle>(
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.mainColor),
                  minimumSize: WidgetStateProperty.all<Size>(
                    const Size(500, 50),
                  ),
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIconColor: AppColors.mainColor,
                focusColor: AppColors.mainColor,
                fillColor: const Color.fromARGB(30, 124, 146, 153),
                labelStyle: const TextStyle(
                    fontSize: 14, color: AppColors.inactiveColor),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppColors.inactiveColor)),
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
              dividerColor: AppColors.inactiveColor,
            ),
            routerConfig: appRouter,
          ),
        ),
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  final Widget child;

  const RestartWidget({super.key, required this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  State<RestartWidget> createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey(); // triggers rebuild of the entire subtree
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

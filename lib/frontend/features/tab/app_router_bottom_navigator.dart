import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tokkoo_pos_lite/frontend/features/other/widgets/information/other_information_usage_dialog.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_settings.dart';

class AppRouterBottomNavigator extends StatefulWidget {
  const AppRouterBottomNavigator({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<AppRouterBottomNavigator> createState() =>
      _AppRouterBottomNavigatorState();
}

class _AppRouterBottomNavigatorState extends State<AppRouterBottomNavigator> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!await CommonFunction.outletValidationConfigured() ||
          !await CommonFunction.outletValidationAtLeastOneProduct() ||
          !await CommonFunction.outletValidationAtLeastOnePaymentMethod()) {
        widget.navigationShell.goBranch(0);
      } else {
        widget.navigationShell.goBranch(1);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final firstTimeStart =
          AppSettings.sharedPreferences.getBool("FIRST_TIME_START");
      if (firstTimeStart == true) return;

      AppSettings.sharedPreferences.setBool("FIRST_TIME_START", true);

      showDialog(
          context: context,
          builder: (context) => Dialog(
                child: ListView(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  children: [
                    const Text('Selamat Datang',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const Divider(),
                    const SizedBox(height: 8),
                    const Text(
                        'Halo! Terima kasih telah mengunduh Tokkoo PoS. Kami siap membantu Anda mendapatkan pengalaman terbaik. Mari mulai!'),
                    const SizedBox(height: 16),
                    FilledButton(
                        onPressed: () {
                          widget.navigationShell.goBranch(3);
                          Navigator.of(context).pop();

                          showDialog(
                              context: context,
                              builder: (context) =>
                                  const OtherInformationUsageDialog());
                        },
                        child: const Text('Pelajar Aplikasi'))
                  ],
                ),
              ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.navigationShell.currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.inactiveColor,
        onTap: (newIndex) {
          FocusScope.of(context).unfocus();
          widget.navigationShell.goBranch(
            newIndex,
            initialLocation: newIndex == widget.navigationShell.currentIndex,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'Toko',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale),
            label: 'Kasir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.query_stats),
            label: 'Data Penjualan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Lainnya',
          ),
        ],
      ),
    );
  }
}

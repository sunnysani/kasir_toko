import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/other/information/other_information_usage_dialog.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/tabs/other_tab.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/tabs/outlet_tab.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/tabs/pos_tab.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/tabs/report_tab.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/app_settings.dart';
import 'package:tokkoo_pos_lite/utils/start_configs/static_db.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const routeName = '';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = const [
    OutletTab(),
    PosTab(),
    ReportTab(),
    OtherTab(),
  ];
  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    if (StaticDB.outlet.isValid()) {
      _selectPage(1);
    } else {
      _selectPage(0);
    }

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
                          _selectPage(3);
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
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.inactiveColor,
        onTap: _selectPage,
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

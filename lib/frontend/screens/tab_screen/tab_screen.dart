import 'package:flutter/material.dart';
import 'package:kasir_toko/frontend/widgets/tabs/other_tab.dart';
import 'package:kasir_toko/frontend/widgets/tabs/outlet_tab.dart';
import 'package:kasir_toko/frontend/widgets/tabs/pos_tab.dart';
import 'package:kasir_toko/frontend/widgets/tabs/report_tab.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';
import 'package:kasir_toko/utils/start_configs/static_db.dart';

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

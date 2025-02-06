import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/tabs/outlet_tab/outlet_general_form.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class OutletManagementScreen extends StatelessWidget {
  const OutletManagementScreen({super.key});

  static const routeName = '/outlet/management/outlet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manajemen Outlet"),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
              maxWidth: 550,
              context: context,
            ),
          ),
          children: const [
            OutletGeneralForm(hideHeaderTitle: true),
          ],
        ),
      ),
    );
  }
}

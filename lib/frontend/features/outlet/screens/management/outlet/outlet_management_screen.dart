import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_general_form.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';

class OutletManagementScreen extends StatelessWidget {
  const OutletManagementScreen({super.key});

  static const routeName = '/outlet/management';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manajemen Outlet"),
      ),
      body: SafeArea(
        child: LayoutMaxWidth(
          child: ListView(
            children: const [
              OutletGeneralForm(hideHeaderTitle: true),
            ],
          ),
        ),
      ),
    );
  }
}

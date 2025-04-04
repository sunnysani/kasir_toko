import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_general_form.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';

class OutletManagementScreen extends StatelessWidget {
  const OutletManagementScreen({super.key});

  static const routeName = '/outlet/management';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.outlet_management),
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

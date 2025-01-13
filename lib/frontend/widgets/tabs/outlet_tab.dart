import 'package:flutter/material.dart';
import 'package:kasir_toko/frontend/widgets/tabs/outlet_tab/outlet_general_form.dart';
import 'package:kasir_toko/frontend/widgets/tabs/outlet_tab/outlet_management_list.dart';
import 'package:kasir_toko/utils/common/function.common.dart';

class OutletTab extends StatefulWidget {
  const OutletTab({super.key});

  @override
  State<OutletTab> createState() => _OutletTabState();
}

class _OutletTabState extends State<OutletTab> {
  final ScrollController scrollController = ScrollController();

  bool onTop = true;

  void scrollJump(double position) {
    scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > 0 && onTop == true) {
        setState(() => onTop = false);
      } else {
        if (scrollController.offset <= 0) {
          setState(() => onTop = true);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Build Outlet Tab');
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CommonFunction.getHorizontalPaddingForMaxWidth(
                maxWidth: 550,
                context: context,
              ),
            ),
            child: const Column(
              children: [
                SizedBox(height: 20),
                OutletGeneralForm(),
                SizedBox(height: 40),
                OutletManagementList(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onTop
              ? scrollJump(scrollController.position.maxScrollExtent)
              : scrollJump(0);
        },
        child: onTop
            ? const Icon(Icons.keyboard_arrow_down)
            : const Icon(Icons.keyboard_arrow_up_outlined),
      ),
    );
  }
}

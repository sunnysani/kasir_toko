import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_general_form.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/widgets/outlet_management_list.dart';
import 'package:tokkoo_pos_lite/utils/common/function.common.dart';

class OutletTabScreen extends StatefulWidget {
  const OutletTabScreen({super.key});
  static const routeName = '/outlet';

  @override
  State<OutletTabScreen> createState() => _OutletTabScreenState();
}

class _OutletTabScreenState extends State<OutletTabScreen> {
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

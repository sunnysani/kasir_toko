import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';

class LayoutMaxWidth extends StatelessWidget {
  const LayoutMaxWidth(
      {super.key, required this.child, this.verticalPadding = 0});

  final Widget child;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: AppSize.maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: verticalPadding,
          ),
          child: child,
        ),
      ),
    );
  }
}

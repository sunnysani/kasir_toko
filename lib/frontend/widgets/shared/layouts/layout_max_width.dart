import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';

class LayoutMaxWidth extends StatelessWidget {
  const LayoutMaxWidth({
    super.key,
    required this.child,
    this.verticalPadding = 0,
    this.maxWidth = AppSize.maxWidth,
  });

  final Widget child;
  final double verticalPadding;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
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

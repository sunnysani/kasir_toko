import 'package:flutter/material.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';

enum TextAlertType {
  ok,
  error,
  warning,
}

class TextAlert extends StatelessWidget {
  const TextAlert({super.key, required this.message, required this.type});
  final String message;
  final TextAlertType type;

  Color getColorType() {
    if (type == TextAlertType.ok) {
      return AppColors.positiveColor;
    } else if (type == TextAlertType.error) {
      return AppColors.negativeColor;
    } else if (type == TextAlertType.warning) {
      return AppColors.warningColor;
    }

    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (type == TextAlertType.ok)
          Icon(Icons.check_circle, color: getColorType())
        else if (type == TextAlertType.error)
          Icon(Icons.cancel_outlined, color: getColorType())
        else if (type == TextAlertType.warning)
          Icon(Icons.warning_amber, color: getColorType()),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            message,
            style: TextStyle(
              color: getColorType(),
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}

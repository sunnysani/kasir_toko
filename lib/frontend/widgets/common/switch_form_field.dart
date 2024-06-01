import 'package:flutter/material.dart';
import 'package:kasir_toko/utils/common/constant.common.dart';

class SwitchFormField extends StatelessWidget {
  const SwitchFormField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.description,
  });

  final String description;
  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 550),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.inactiveColor)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Switch.adaptive(value: value, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}

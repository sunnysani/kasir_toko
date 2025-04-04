import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';

class SwitchFormField extends StatefulWidget {
  const SwitchFormField({
    super.key,
    this.initialValue,
    required this.onChanged,
    required this.description,
  });

  final String description;
  final bool? initialValue;
  final void Function(bool) onChanged;

  @override
  State<SwitchFormField> createState() => _SwitchFormFieldState();
}

class _SwitchFormFieldState extends State<SwitchFormField> {
  late bool value;

  @override
  void initState() {
    value = widget.initialValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 550),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.inactiveColor)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Switch.adaptive(
                value: value,
                onChanged: (newVal) {
                  setState(() => value = newVal);
                  widget.onChanged(newVal);
                }),
          ],
        ),
      ),
    );
  }
}

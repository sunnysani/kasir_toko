import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/common/text_alert.dart';

class ModifiedTextFormField extends StatefulWidget {
  const ModifiedTextFormField({
    super.key,
    required this.controller,
    required this.labelName,
    this.maxLines = 1,
    this.value,
    this.isOkEmpty = false,
    this.okEmptyMessage,
    this.isCreation = false,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.prefix,
    this.suffix,
  });
  final TextEditingController controller;
  final String labelName;
  final int maxLines;
  final String? value;
  final bool isOkEmpty;
  final String? okEmptyMessage;
  final bool isCreation;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefix;
  final String? suffix;

  @override
  State<ModifiedTextFormField> createState() => _ModifiedTextFormFieldState();
}

class _ModifiedTextFormFieldState extends State<ModifiedTextFormField> {
  TextAlertType textAlertType = TextAlertType.error;
  String textAlertMessage = '';

  void controllerListener() {
    if (widget.controller.text.isEmpty) {
      if (widget.isOkEmpty) {
        setState(() {
          textAlertType = TextAlertType.ok;
          textAlertMessage =
              widget.okEmptyMessage ?? '${widget.labelName} kosong';
        });
      } else {
        setState(() {
          textAlertType = TextAlertType.error;
          textAlertMessage = '${widget.labelName} belum terisi';
        });
      }
    } else {
      if (widget.value == null || widget.controller.text == widget.value) {
        setState(() {
          textAlertType = TextAlertType.ok;
          textAlertMessage = widget.isCreation
              ? '${widget.labelName} sudah terisi'
              : '${widget.labelName} sudah tersimpan';
        });
      } else {
        setState(() {
          textAlertType = TextAlertType.warning;
          textAlertMessage = widget.isCreation
              ? '${widget.labelName} belum terisi'
              : '${widget.labelName} belum tersimpan';
        });
      }
    }
  }

  @override
  void initState() {
    widget.controller.addListener(controllerListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerListener();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 550),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                prefixText: widget.prefix,
                prefixStyle: const TextStyle(fontWeight: FontWeight.normal),
                suffixText: widget.suffix,
                suffixStyle: const TextStyle(fontWeight: FontWeight.normal),
                labelText: widget.labelName,
                errorStyle: const TextStyle(fontSize: 0)),
            controller: widget.controller,
            maxLines: widget.maxLines,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
          ),
          const SizedBox(height: 5),
          TextAlert(
            message: textAlertMessage,
            type: textAlertType,
          ),
        ],
      ),
    );
  }
}

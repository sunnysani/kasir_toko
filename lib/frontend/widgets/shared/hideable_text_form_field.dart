import 'package:flutter/material.dart';

class HideableTextFormField extends StatefulWidget {
  const HideableTextFormField(
      {super.key, required this.controller, required this.labelText});

  final TextEditingController controller;
  final String? labelText;

  @override
  State<HideableTextFormField> createState() => _HideableTextFormFieldState();
}

class _HideableTextFormFieldState extends State<HideableTextFormField> {
  bool hideText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: "Tambah Kode Akses",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GestureDetector(
            onTap: () => setState(() => hideText = !hideText),
            child: Icon(
              hideText ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
            )),
      ),
      obscureText: hideText,
      autocorrect: false,
      enableSuggestions: false,
    );
  }
}

import 'package:flutter/material.dart';

class Customtextform extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? valid;
  final TextEditingController controller;

  Customtextform({
    super.key,
    required this.labelText,
    required this.controller,
    this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: valid,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        labelText: labelText,
      ),
    );
  }
}

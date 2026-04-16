import 'package:flutter/material.dart';

class Customtextform extends StatelessWidget {
final String labelText;
final TextEditingController controller;

   Customtextform({super.key, required this.labelText,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border:const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        labelText:labelText,
        
      ),
    );
  }
}
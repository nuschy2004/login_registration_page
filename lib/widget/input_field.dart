import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labeltext;
  final String hintText;
  final Widget prefixIcon;
  final String? Function(String?) validator;
  final bool obscureText;

  const InputField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.labeltext,
    required this.prefixIcon,
    required this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,

      decoration: InputDecoration(
        labelText: labeltext,
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),

      validator: validator,
    );
  }
}

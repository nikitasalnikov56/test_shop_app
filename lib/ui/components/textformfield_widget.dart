import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.onChanged,
    required this.hintText,
    required this.errorText,
    required this.controller,
    this.obscureText = false,
  });
  final Function(String)? onChanged;
  final bool obscureText;
  final String hintText;
  final String? errorText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        errorText: errorText,
      ),
      onChanged: onChanged,
    );
  }
}

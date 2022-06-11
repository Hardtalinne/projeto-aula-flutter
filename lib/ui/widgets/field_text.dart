import 'package:flutter/material.dart';

class FieldText extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String? prefix;
  final TextInputType? keyboard;

  const FieldText({
    required this.controller,
    required this.text,
    this.prefix,
    this.keyboard,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        keyboardType: keyboard ?? TextInputType.number,
        decoration: InputDecoration(
            labelText: text,
            prefixText: prefix,
            border: const OutlineInputBorder()),
      ),
    );
  }
}

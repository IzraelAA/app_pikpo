import 'package:flutter/material.dart';
import 'package:pikpo/utils/app_text_style.dart';

class PikPoTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const PikPoTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppTextStyle().lemonRegulerGrey(fontSize: 16),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: AppTextStyle().lemonRegulerGrey(fontSize: 16),
      ),
    );
  }
}

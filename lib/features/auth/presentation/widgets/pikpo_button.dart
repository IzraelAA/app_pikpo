import 'package:flutter/material.dart';
import 'package:pikpo/utils/app_color.dart';
import 'package:pikpo/utils/app_text_style.dart';

class PikpoButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  const PikpoButton(
      {super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColor.purleButton,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            textButton,
            style: AppTextStyle().lemonTitle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

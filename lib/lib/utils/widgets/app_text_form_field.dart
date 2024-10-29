import 'package:flutter/material.dart';
import 'package:pikpo/utils/app_color.dart';
import 'package:pikpo/utils/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final double borderRadius;
  final bool enabled;
  final double elevation;

  const AppTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.textStyle,
    this.hintStyle,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.borderRadius = 1,
    this.enabled = true,
    this.elevation = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: AppColor.greyColor)),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        validator: validator,
        onChanged: onChanged,
        style: textStyle ??
            AppTextStyle().pretendardTitle(color: AppColor.blackColor),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: AppTextStyle().pretendardBody(color: AppColor.blackColor),
          hintText: hintText,
          hintStyle: AppTextStyle()
              .pretendardTitle(fontSize: 16, color: AppColor.greyColor),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          prefixIcon: prefix,
          suffixIcon: suffix,
          enabled: enabled,
        ),
      ),
    );
  }
}

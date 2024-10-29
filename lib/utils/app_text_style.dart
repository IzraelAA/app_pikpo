import 'package:flutter/material.dart';
import 'package:pikpo/utils/app_color.dart';

class AppTextStyle {
  //Lemon Milk Pro styles
  TextStyle lemonTitle({double? fontSize}) => TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: AppColor.textWhite);
  TextStyle lemonRegulerGrey({double? fontSize}) => TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: AppColor.textGrey);
  TextStyle lemonReguler({double? fontSize, Color? color}) => TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: color ?? AppColor.textWhite);

  TextStyle lemonHeading({double? fontSize, Color? color}) => TextStyle(
      fontSize: fontSize??16,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.textWhite);

  // Pretendard styles
  TextStyle pretendardBody(
          {Color? color, double? fontSize, TextDecoration? textDecoration}) =>
      TextStyle(
          color: color,
          fontSize: fontSize ?? 12,
          // Ubah ukuran font menjadi 12
          fontWeight: FontWeight.w400,
          fontFamily: 'assets/fonts/Pretendard-Regular.otf');

  TextStyle pretendardHeading(
          {Color? color, double? fontSize, TextDecoration? textDecoration}) =>
      TextStyle(
          color: color,
          fontSize: fontSize ?? 18,
          // Ubah ukuran font menjadi 18
          fontWeight: FontWeight.bold,
          fontFamily: 'assets/fonts/Pretendard-Bold.otf');

  TextStyle pretendardTitle(
          {Color? color, double? fontSize, TextDecoration? textDecoration}) =>
      TextStyle(
          color: color,
          fontSize: fontSize ?? 16,
          // Ubah ukuran font menjadi 16
          fontWeight: FontWeight.w600,
          decoration: textDecoration,
          fontFamily: 'assets/fonts/Pretendard-SemiBold.otf');

  TextStyle pretendardSubtitle(
          {Color? color, double? fontSize, TextDecoration? textDecoration}) =>
      TextStyle(
          color: color,
          fontSize: fontSize ?? 14,
          // Ubah ukuran font menjadi 14
          fontWeight: FontWeight.w500,
          decoration: textDecoration,
          fontFamily: ' assets/fonts/Pretendard-Medium.otf');

  TextStyle pretendardDescription(
          {Color? color, TextDecoration? textDecoration}) =>
      TextStyle(
          color: color,
          fontSize: 10,
          // Ubah ukuran font menjadi 10
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          decoration: textDecoration,
          fontFamily: 'assets/fonts/Pretendard-Light.otf');
}

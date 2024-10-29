import 'package:flutter/material.dart';
import 'package:pikpo/utils/app_color.dart';
import 'package:pikpo/utils/app_text_style.dart';

class ProfilePerson extends StatelessWidget {
  final String name;
  final String imagePath;

  const ProfilePerson({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: AppTextStyle().pretendardTitle(
            fontSize: 12,
            color: AppColor.textWhite,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Image.asset(
          imagePath,
        )
      ],
    );
  }
}

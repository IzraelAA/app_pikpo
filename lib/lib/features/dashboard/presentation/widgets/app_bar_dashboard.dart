import 'package:flutter/material.dart';
import 'package:pikpo/features/auth/presentation/pages/login_page.dart';
import 'package:pikpo/utils/app_color.dart';
import 'package:pikpo/utils/app_text_style.dart';

class AppBarDashboard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String subtitle;

  const AppBarDashboard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath, // Replace with your asset image path
            width: 24.0,
            height: 24.0,
            fit: BoxFit.cover, // Makes sure the image covers the entire circle
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle().pretendardTitle(
                  fontSize: 12,
                  color: AppColor.textWhite,
                ),
              ),
              Text(
                subtitle,
                style: AppTextStyle().pretendardDescription(
                  color: AppColor.natural4,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const LoginPage(),
                ));
          },
          child: Icon(
            Icons.logout,
            color: AppColor.textWhite,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pikpo/utils/app_color.dart';
import 'package:pikpo/utils/app_text_style.dart';

class TranscriptTile extends StatelessWidget {
  final String profile;
  final String name;
  final String transcript;
  const TranscriptTile(
      {super.key,
      required this.profile,
      required this.name,
      required this.transcript});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Image.asset(
        profile,
        width: 25,
        height: 43,
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          name,
          style:
              AppTextStyle().lemonReguler(color: AppColor.teal, fontSize: 16),
        ),
      ),
      subtitle: Text(
        transcript,
        style: AppTextStyle().lemonReguler(fontSize: 14),
      ),
    );
  }
}

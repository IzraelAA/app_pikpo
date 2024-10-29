import 'package:flutter/material.dart';
import 'package:pikpo/features/transcript/presentation/widgets/transcript_tile.dart';
import 'package:pikpo/features/transcript/presentation/pages/transcript_page.dart';
import 'package:pikpo/utils/app_color.dart';
import 'package:pikpo/utils/app_text_style.dart';

class BoxTranscript extends StatelessWidget {
  final String transcript;
  final String name;
  final String text;
  final String profile;
  final int itemCount;
  const BoxTranscript(
      {super.key,
      required this.transcript,
      required this.name,
      required this.text,
      required this.profile,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
          color: AppColor.backgroundTranscript,
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17, top: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transcript',
                      style: AppTextStyle()
                          .lemonReguler(color: AppColor.lightTeal, fontSize: 9),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const TranscriptPage()));
                      },
                      child: Image.asset(
                        'assets/png/maximaze.png',
                        width: 11.87,
                        height: 12.16,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    transcript,
                    style: AppTextStyle().lemonReguler(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          TranscriptTile(profile: profile, name: name, transcript: text)
        ],
      ),
    );
  }
}

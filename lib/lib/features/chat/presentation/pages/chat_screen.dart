import 'package:flutter/material.dart';
import 'package:pikpo/utils/app_color.dart';
import 'package:pikpo/utils/app_text_style.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: List.generate(3, (i) => content()),
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      image: AssetImage("assets/png/video_female.png"),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Gaby",
                            style: AppTextStyle()
                                .lemonHeading(color: AppColor.blackColor),
                          ),
                        ),
                        Text(
                          "· 12:15PM",
                          style: AppTextStyle().lemonRegulerGrey(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Love the background view.",
                      style: AppTextStyle()
                          .lemonReguler(color: AppColor.blackColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(),
        Text("👍 +1")
      ],
    );
  }
}

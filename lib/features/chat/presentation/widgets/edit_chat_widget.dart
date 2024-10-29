import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pikpo/utils/app_color.dart';
import 'package:pikpo/utils/app_text_style.dart';

class EditChatWidget extends StatelessWidget {
  final Function() onTap;

  const EditChatWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Write a message...',
                    hintStyle: AppTextStyle().lemonReguler(
                      color: AppColor.natural4,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset("assets/svg/maximize.svg")),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            children: [
              SvgPicture.asset("assets/svg/camera.svg"),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset("assets/svg/image.svg"),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset("assets/svg/transfer.svg"),
              const Expanded(child: SizedBox()),
              SvgPicture.asset("assets/svg/send.svg"),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

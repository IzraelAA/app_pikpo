import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pikpo/features/dashboard/presentation/widgets/app_bar_dashboard.dart';
import 'package:pikpo/features/dashboard/presentation/widgets/call_controls.dart';
import 'package:pikpo/features/dashboard/presentation/widgets/profile_person.dart';
import 'package:pikpo/features/transcript/presentation/widgets/box_transcript.dart';
import 'package:pikpo/utils/app_color.dart';
import 'package:pikpo/utils/widgets/background_gradient.dart';

class ScreenSharePage extends StatefulWidget {
  const ScreenSharePage({super.key});

  @override
  State<ScreenSharePage> createState() => _ScreenSharePageState();
}

class _ScreenSharePageState extends State<ScreenSharePage> {
  final String text =
      'How was the experience working in the live broadcast department on the Olympics? Must be nerve wrecking?';
  final String name = 'Jeannette Lau';
  final String profile = 'assets/png/person_female.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BackgroundGradient(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _header(),
                    const SizedBox(
                      height: 27,
                    ),
                    //screen share
                    _screenShare(),
                    const SizedBox(
                      height: 15,
                    ),
                    //video
                    _video(),
                    const SizedBox(
                      height: 7.0,
                    ),
                    BoxTranscript(
                        transcript: 'it was my privilege.',
                        name: name,
                        text: text,
                        profile: profile,
                        itemCount: 1)
                  ],
                ),
              ),
              const CallControls()
            ],
          ),
        ),
      )),
    );
  }

  Widget _header() {
    return const AppBarDashboard(
      title: "Maria Lopez",
      imagePath: "assets/png/person_female.png",
      subtitle: "@marialopez.design",
    );
  }

  Widget _screenShare() {
    return Stack(
      children: [
        Image.asset('assets/png/screen_share.png'),
        Positioned(
            top: 9,
            right: 9,
            child: GestureDetector(
                onTap: () {
                  //maximize function
                },
                child: Image.asset('assets/png/button_background.png'))),
      ],
    );
  }

  Widget _video() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 20),
      decoration: BoxDecoration(
          color: AppColor.backgroundTranscript,
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfilePerson(
            name: "Yaya Touré",
            imagePath: "assets/png/video_male.png",
          ),
          const SizedBox(
            width: 7,
          ),
          SvgPicture.asset(
            "assets/svg/noice.svg",
            colorFilter: ColorFilter.mode(AppColor.teal, BlendMode.srcIn),
          ),
          const SizedBox(
            width: 7,
          ),
          const ProfilePerson(
            name: "Maria Lopez",
            imagePath: "assets/png/video_female.png",
          ),
        ],
      ),
    );
  }
}

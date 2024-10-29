import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pikpo/features/transcript/presentation/widgets/box_transcript.dart';
import 'package:pikpo/utils/app_color.dart';
import 'package:pikpo/utils/widgets/background_gradient.dart';
import 'package:pikpo/features/dashboard/presentation/widgets/app_bar_dashboard.dart';
import 'package:pikpo/features/dashboard/presentation/widgets/call_controls.dart';
import 'package:pikpo/features/dashboard/presentation/widgets/profile_person.dart';

enum StatusDashboard { oneOnOne, group, transcript }

class DashboardPage extends StatelessWidget {
  final StatusDashboard statusDashboard;
  final StatusDashboard? isWithTranscript;

  const DashboardPage({
    super.key,
    required this.statusDashboard,
    this.isWithTranscript,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BackgroundGradient(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarDashboard(
                    title: statusDashboard == StatusDashboard.group
                        ? "Maria Lopez"
                        : "On Air Studios",
                    imagePath: statusDashboard == StatusDashboard.group
                        ? "assets/png/person_female.png"
                        : "assets/png/profile.png",
                    subtitle: statusDashboard == StatusDashboard.group
                        ? "@marialopez.design"
                        : "+broadcast.org",
                  ),
                  _body(
                      isGroup: statusDashboard == StatusDashboard.group,
                      isWithTranscript:
                      isWithTranscript == StatusDashboard.transcript),
                  const CallControls()
                ],
              ),
            ),
          ),
        ));
  }

  Widget _body({required bool isGroup, required bool isWithTranscript}) {
    const String text =
        'How was the experience working in the live broadcast department on the Olympics? Must be nerve wrecking?';
    const String name = 'Jeannette Lau';
    const String profile = 'assets/png/person_female.png';
    return Expanded(
      child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isGroup) ...[
                SvgPicture.asset("assets/svg/noice.svg"),
                const SizedBox(
                  height: 14,
                ),
              ],
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfilePerson(
                        name: "Yaya Touré",
                        imagePath: "assets/png/male.png",
                      ),
                      if (isGroup) ...[
                        const SizedBox(
                          width: 7,
                        ),
                        SvgPicture.asset(
                          "assets/svg/noice.svg",
                          colorFilter: ColorFilter.mode(
                              isWithTranscript
                                  ? AppColor.teal
                                  : AppColor.lightGrey,
                              BlendMode.srcIn),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const ProfilePerson(
                          name: "Maria Lopez",
                          imagePath: "assets/png/person_female.png",
                        ),
                      ],
                    ],
                  ),
                  if (isGroup && isWithTranscript) ...[
                    const SizedBox(
                      height: 25,
                    ),
                    const BoxTranscript(
                        itemCount: 1,
                        transcript: 'it was my previlage.',
                        name: name,
                        text: text,
                        profile: profile)
                  ]
                ],
              ),
            ],
          )),
    );
  }
}

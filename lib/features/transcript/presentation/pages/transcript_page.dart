import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pikpo/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:pikpo/features/dashboard/presentation/widgets/profile_person.dart';
import 'package:pikpo/features/transcript/presentation/widgets/transcript_tile.dart';
import 'package:pikpo/features/transcript/domain/entities/transcript.dart';
import 'package:pikpo/utils/app_color.dart';
import 'package:pikpo/utils/app_text_style.dart';
import 'package:pikpo/utils/widgets/background_gradient.dart';
import 'package:pikpo/features/dashboard/presentation/widgets/call_controls.dart';

class TranscriptPage extends StatelessWidget {
  const TranscriptPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Transcript> data = [
      Transcript(
          profile: 'assets/png/male.png',
          name: 'Yaya Toure',
          text:
              'It was a good experience, I enjoyed my time there. How’s things back at the office?'),
      Transcript(
          profile: 'assets/png/person_female.png',
          name: 'Jeannette Lau',
          text:
              'A lot it’s going on a the moment and i need you to help me with a few things that’s why this call.'),
      Transcript(
          profile: 'assets/png/person_female.png',
          name: 'Jeannette Lau',
          text:
              'I will need your help to do a couple of interviews with a couple of sponsored Athletes that client has identified such as...'),
    ];
    const String transcript =
        'How was the experience working in the live broadcast department on the Olympics? Must be nerve wrecking?';
    return Scaffold(
      backgroundColor: Colors.black,
      body: BackgroundGradient(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    //header
                    Row(
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
                          colorFilter:
                              ColorFilter.mode(AppColor.teal, BlendMode.srcIn),
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
                    //list of transcript
                    const SizedBox(height: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 17, right: 17, top: 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Transcript',
                                    style: AppTextStyle().lemonReguler(
                                        color: AppColor.lightTeal, fontSize: 9),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const DashboardPage(
                                                    statusDashboard:
                                                        StatusDashboard.group,
                                                    isWithTranscript:
                                                        StatusDashboard
                                                            .transcript,
                                                  )));
                                    },
                                    child: Image.asset(
                                      'assets/png/minimize.png',
                                      width: 13.47,
                                      height: 13.49,
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
                                  style:
                                      AppTextStyle().lemonReguler(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            itemCount: data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final transcript = data[index];
                              return TranscriptTile(
                                  profile: transcript.profile,
                                  name: transcript.name,
                                  transcript: transcript.text);
                            }),
                      ],
                    ),
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
}

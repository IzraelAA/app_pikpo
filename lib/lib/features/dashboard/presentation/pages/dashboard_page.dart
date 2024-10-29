import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:pikpo/core/di/service_locator.dart';
import 'package:pikpo/features/dashboard/presentation/manager/dashboard_cubit.dart';
import 'package:pikpo/features/dashboard/presentation/widgets/app_bar_dashboard.dart';
import 'package:pikpo/features/dashboard/presentation/widgets/call_controls.dart';
import 'package:pikpo/features/dashboard/presentation/widgets/profile_person.dart';
import 'package:pikpo/utils/app_text_style.dart';
import 'package:pikpo/utils/widgets/background_gradient.dart';

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
                Expanded(
                  child: _body(
                    isGroup: statusDashboard == StatusDashboard.group,
                    isWithTranscript:
                        isWithTranscript == StatusDashboard.transcript,
                    context: context,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _body({
    required bool isGroup,
    required bool isWithTranscript,
    required BuildContext context,
  }) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state.isConnected) {
          if (state.localParticipant != null) {
            return Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      state.isVideoEnable
                          ? Expanded(
                              child: VideoWidget(
                                videoTrack: state.localParticipant!
                                    .videoTrackPublications.last.track!,
                              ),
                            )
                          : const PlaceholderImage(),
                      state.remoteParticipant != null
                          ? state.remoteParticipant!.videoTrackPublications !=
                                  []
                              ? Expanded(
                                  child: VideoWidget(
                                    videoTrack: state.remoteParticipant!
                                        .videoTrackPublications.last.track!,
                                  ),
                                )
                              : const PlaceholderImage()
                          : const PlaceholderImage(),
                    ],
                  ),
                ),
                CallControls(
                  onVideoToggle: () {
                    getIt<DashboardCubit>().enableVideo(
                        !state.isVideoEnable);
                  },
                  onAudioToggle: () {
                    getIt<DashboardCubit>().enableAudio(
                        !state.isAudioEnable);
                  },
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                "No participants connected.",
                style: AppTextStyle().lemonReguler(),
              ),
            );
          }
        }
        if (state.errorMessage != null) {
          return Center(child: Text(state.errorMessage!));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class VideoWidget extends StatelessWidget {
  final VideoTrack videoTrack;

  const VideoWidget({super.key, required this.videoTrack});

  @override
  Widget build(BuildContext context) {
    return VideoTrackRenderer(videoTrack);
  }
}

class PlaceholderImage extends StatelessWidget {
  const PlaceholderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfilePerson(
      name: "Yaya Touré",
      imagePath: "assets/png/male.png",
    );
  }
}

// Widget _connectedBody(DashboardCubit cubit,
//     {required bool isGroup, required bool isWithTranscript}) {
//   const String text =
//       'How was the experience working in the live broadcast department on the Olympics? Must be nerve wrecking?';
//   const String name = 'Jeannette Lau';
//   const String profile = 'assets/png/person_female.png';
//
//   return Expanded(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         if (!isGroup) ...[
//           SvgPicture.asset("assets/svg/noice.svg"),
//           const SizedBox(height: 14),
//         ],
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const ProfilePerson(
//               name: "Yaya Touré",
//               imagePath: "assets/png/male.png",
//             ),
//             if (isGroup) ...[
//               const SizedBox(width: 7),
//               SvgPicture.asset(
//                 "assets/svg/noice.svg",
//                 colorFilter: ColorFilter.mode(
//                     isWithTranscript ? AppColor.teal : AppColor.lightGrey,
//                     BlendMode.srcIn),
//               ),
//               const SizedBox(width: 7),
//               const ProfilePerson(
//                 name: "Maria Lopez",
//                 imagePath: "assets/png/person_female.png",
//               ),
//             ],
//           ],
//         ),
//         if (isGroup && isWithTranscript) ...[
//           const SizedBox(height: 25),
//           const BoxTranscript(
//               itemCount: 1,
//               transcript: 'it was my privilege.',
//               name: name,
//               text: text,
//               profile: profile)
//         ]
//       ],
//     ),
//   );
// }

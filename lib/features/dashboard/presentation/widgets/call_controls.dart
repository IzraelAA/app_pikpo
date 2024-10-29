import 'package:flutter/material.dart';
import 'package:pikpo/features/chat/presentation/pages/chat_screen.dart';
import 'package:pikpo/features/chat/presentation/widgets/edit_chat_widget.dart';
import 'package:pikpo/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:pikpo/features/screen_sharing/presentation/pages/screen_share_page.dart';
import 'package:pikpo/utils/app_color.dart';

class CallControls extends StatefulWidget {
  const CallControls({super.key});

  @override
  State<CallControls> createState() => _CallControlsState();
}

class _CallControlsState extends State<CallControls> {
  int _bottomSheetState = 1;

  void _changeBottomSheetState(bool isMaximized) {
    setState(() {
      if (isMaximized == true) {
        _bottomSheetState = 3;
      } else {
        _bottomSheetState = 2;
      }

      _showBottomSheet(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Mic
        GestureDetector(
          onTap: () {
            // Add mic button functionality here
          },
          child: Image.asset(
            'assets/png/mic.png',
            width: 32,
            height: 32,
          ),
        ),
        const SizedBox(width: 45),

        // Video
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ScreenSharePage()));
          },
          child: Image.asset(
            'assets/png/video.png',
            width: 32,
            height: 32,
          ),
        ),
        const SizedBox(width: 45),

        // Caption
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const DashboardPage(
                          statusDashboard: StatusDashboard.group,
                          isWithTranscript: StatusDashboard.transcript,
                        )));
          },
          child: Image.asset(
            'assets/png/caption.png',
            width: 32,
            height: 32,
          ),
        ),
        const SizedBox(width: 45),

        // Message
        GestureDetector(
          onTap: () {
            _changeBottomSheetState(false);
          },
          child: Image.asset(
            'assets/png/message.png',
            width: 32,
            height: 32,
          ),
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            height: _bottomSheetState == 1
                ? 0.0
                : (_bottomSheetState == 2
                    ? MediaQuery.of(context).size.height * 0.2
                    : MediaQuery.of(context).size.height * 0.5),
            child: Column(
              children: [
                const SizedBox(
                  height: 6,
                ),
                Container(
                  width: 36,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(70)),
                    color: AppColor.natural3,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                if (_bottomSheetState == 3) const ChatScreen(),
                EditChatWidget(
                  onTap: () {
                    Navigator.pop(context);
                    _changeBottomSheetState(_bottomSheetState == 2);
                  },
                ),
              ],
            ));
      },
    );
  }
}

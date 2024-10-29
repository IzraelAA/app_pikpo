import 'package:flutter/material.dart';
import 'package:pikpo/utils/widgets/background_gradient.dart';
import 'package:pikpo/features/auth/presentation/widgets/pikpo_button.dart';
import 'package:pikpo/features/auth/presentation/widgets/pikpo_text_field.dart';
import 'package:pikpo/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:pikpo/utils/app_text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //username controller
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BackgroundGradient(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Username',
                      style: AppTextStyle().lemonTitle(fontSize: 28)),
                  const SizedBox(height: 25),
                  PikPoTextField(
                      controller: userNameController,
                      hintText: 'Your Username'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //one on one call
                      Expanded(
                          child: PikpoButton(
                              textButton: '1-1',
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DashboardPage(
                                              statusDashboard:
                                                  StatusDashboard.oneOnOne,
                                            )));
                              })),
                      const SizedBox(
                        width: 20,
                      ), //group call
                      Expanded(
                          child: PikpoButton(
                              textButton: 'Group',
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DashboardPage(
                                              statusDashboard:
                                                  StatusDashboard.group,
                                            )));
                              }))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

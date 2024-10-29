import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikpo/features/auth/presentation/manager/login_cubit.dart';
import 'package:pikpo/features/dashboard/presentation/manager/dashboard_cubit.dart';
import 'package:pikpo/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:pikpo/utils/app_text_style.dart';
import 'package:pikpo/utils/widgets/background_gradient.dart';
import 'package:pikpo/utils/widgets/pikpo_button.dart';
import 'package:pikpo/utils/widgets/pikpo_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Username controller
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context
                  .read<DashboardCubit>()
                  .connectToLiveKit(state.liveKitUrl, state.token);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardPage(
                    statusDashboard: StatusDashboard.group,
                  ),
                ),
              );
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: BackgroundGradient(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
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
                        // One-on-one call
                        Expanded(
                          child: PikpoButton(
                            textButton: '1-1',
                            onPressed: () {
                              context.read<LoginCubit>().connectToRoom(
                                  'one-on-one-room', userNameController.text);
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Group call
                        Expanded(
                          child: PikpoButton(
                            textButton: 'Group',
                            onPressed: () {
                              context.read<LoginCubit>().connectToRoom(
                                  'group-room', userNameController.text);
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

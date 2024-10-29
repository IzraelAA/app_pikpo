import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikpo/core/di/service_locator.dart';
import 'package:pikpo/features/auth/presentation/pages/login_page.dart';
import 'package:pikpo/features/dashboard/presentation/manager/dashboard_cubit.dart';

Future<void> main() async {

  configureDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => getIt<DashboardCubit>()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lemon Milk Pro',
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

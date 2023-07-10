import 'package:demo_application/UI/screen/home_screen.dart';
import 'package:demo_application/UI/screen/login_screen.dart';
import 'package:demo_application/logic/login_cubit.dart';
import 'package:demo_application/route/route_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.grey[50]),
          primarySwatch: Colors.grey,
          fontFamily: 'NotoSansJP',
          textTheme: TextTheme(
            titleLarge: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            titleMedium: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
            bodyLarge: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            bodyMedium: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
          if (state is LoginVerified) {
            return const HomeScreen();
          } else {
            return const LoginScreen(title: 'セキュリティーコード');
          }
        }),
      ),
    );
  }
}

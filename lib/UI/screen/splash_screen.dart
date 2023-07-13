import 'package:demo_application/logic/authenticate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticateCubit, AuthenticateState>(
      listener: (context, state) {
        if (state is Authenticated) {
          print('========NAVIGATE');
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is Unauthenticated) {
          print("========NOT LOGIN");
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: const [
              Text('Initializing'),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

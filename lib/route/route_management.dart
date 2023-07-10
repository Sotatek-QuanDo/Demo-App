import 'package:demo_application/UI/screen/home_screen.dart';
import 'package:demo_application/UI/screen/login_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(title: 'セキュリティーコード'),
        );
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return null;
    }
  }
}

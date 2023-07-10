import 'package:flutter/material.dart';

import 'package:demo_application/UI/widget/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String loginText = 'ご登録の電話番号にセキュリティーコードをお送りし\nました。\n認証コードの6桁の番号を入力してください。';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          centerTitle: true,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white.withOpacity(0.5),
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                loginText,
                style: const TextStyle(
                  fontFamily: 'Noto Sans JP',
                  fontSize: 14,
                  height: 20.27 / 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}

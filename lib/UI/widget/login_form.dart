import 'package:demo_application/data/models/user_account.dart';
import 'package:demo_application/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final UserAccount _user = UserAccount(userName: '', userPassword: '');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginVerified) {
            Navigator.of(context).pushReplacementNamed('/home');
          }
        },
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              onSaved: (value) {
                _user.userName = value!;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) {
                _user.userPassword = value!;
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context
                      .read<LoginCubit>()
                      .verifyLogin(_user.userName, _user.userPassword);
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

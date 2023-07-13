part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoggedIn extends LoginState {
  String username;
  String password;
  String accessToken = '';
  LoggedIn({required this.username, required this.password});
}

class LoginFailed extends LoginState {}

class LoggedOut extends LoginState {}

part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class Logging extends LoginState {
  String username;
  String password;
  Logging({required this.username, required this.password});
}

class LoggedIn extends LoginState {}

class LoginFailed extends LoginState {}

class LoggedOut extends LoginState {}

class LoggedCheck extends LoginState {}

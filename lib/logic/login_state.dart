part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoggedIn extends LoginState {
  String accessToken;
  LoggedIn({required this.accessToken});
}

class LoginFailed extends LoginState {}

class LoggedOut extends LoginState {}

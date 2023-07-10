part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginVerifying extends LoginState {}

class LoginVerified extends LoginState {}

class LoginFailed extends LoginState {}

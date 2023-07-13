part of 'authenticate_cubit.dart';

@immutable
abstract class AuthenticateState {}

class AuthenticateInitial extends AuthenticateState {}

class Authenticating extends AuthenticateState {}

class Authenticated extends AuthenticateState {
  String accessToken;
  Authenticated({required this.accessToken});
}

class AuthenticaingFailed extends AuthenticateState {}

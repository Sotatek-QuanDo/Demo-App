part of 'authenticate_cubit.dart';

abstract class AuthenticateState {}

class AuthenticateInitial extends AuthenticateState {}

class Authenticating extends AuthenticateState {}

class Authenticated extends AuthenticateState {
  String accessToken = '';
  Authenticated({required this.accessToken});
}

class Unauthenticated extends AuthenticateState {}

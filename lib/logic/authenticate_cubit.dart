import 'dart:async';

import 'package:demo_application/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authenticate_state.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  late StreamSubscription loginStreamSubcription;
  LoginCubit loginCubit;

  late SharedPreferences pref;

  AuthenticateCubit({required this.loginCubit}) : super(AuthenticateInitial()) {
    checkLogin();
    authenticate();
  }

  StreamSubscription<LoginState> authenticate() {
    return loginStreamSubcription = loginCubit.stream.listen((loginState) {
      if (loginState is LoggedIn) {
        print('======= DA LOGGED IN');
        emit(Authenticated(accessToken: loginState.accessToken));
        print('======= DA emit');
      } else if (loginState is LoggedOut) {
        emit(Unauthenticated());
      }
    });
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('userToken') == '123456') {
      emit(Authenticated(accessToken: pref.getString('userToken')!));
    } else {
      emit(Unauthenticated());
    }
  }
}

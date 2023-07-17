import 'dart:async';

import 'package:demo_application/logic/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authenticate_state.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  late StreamSubscription loginStreamSubcription;
  LoginCubit loginCubit;
  final SharedPreferences pref = GetIt.instance.get();

  AuthenticateCubit({required this.loginCubit}) : super(AuthenticateInitial()) {
    checkLogin();
    authenticate();
  }

  StreamSubscription<LoginState> authenticate() {
    return loginStreamSubcription = loginCubit.stream.listen((loginState) {
      if (loginState is LoggedIn) {
        emit(Authenticated(accessToken: '123456'));
      } else if (loginState is LoggedOut) {
        emit(Unauthenticated());
      }
    });
  }

  void checkLogin() {
    if (pref.getString('userToken') == '123456') {
      emit(Authenticated(accessToken: '123456'));
    } else {
      emit(Unauthenticated());
    }
  }
}

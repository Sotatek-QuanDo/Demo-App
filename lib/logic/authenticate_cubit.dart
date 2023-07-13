import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_application/logic/login_cubit.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authenticate_state.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  late StreamSubscription loginStreamSubcription;
  LoginCubit loginCubit;

  AuthenticateCubit({required this.loginCubit}) : super(AuthenticateInitial()) {
    authenticate();
  }

  StreamSubscription<LoginState> authenticate() {
    return loginStreamSubcription = loginCubit.stream.listen((loginState) {
      if (loginState is LoggedIn) {
        if (loginState.accessToken != '123456') {
          firstAuthentication(loginState.username, loginState.password);
        } else {
          emit(Authenticated(accessToken: loginState.accessToken));
        }
      } else if (loginState is LoginFailed || loginState is LoggedOut) {
        emit(AuthenticaingFailed());
      }
    });
  }

  void firstAuthentication(String username, String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String accessToken = '123456';
    pref.setString('username', username); // This is the response of the server
    pref.setString('userToken', accessToken);
    pref.setString('password', password);
    emit(Authenticated(accessToken: accessToken));
  }
}

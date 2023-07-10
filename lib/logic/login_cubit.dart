import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    checkLoginState();
  }
  late SharedPreferences pref;
  late bool isLogged;

  void logOut() {
    pref.setBool('login', false);
    emit(LoggedOut());
  }

  Future<void> checkLoginState() async {
    print('=======CheckLogin');
    pref = await SharedPreferences.getInstance();
    print('======AWAIT');
    isLogged = (pref.getBool('login') ?? false);
    print(pref.getBool('login'));

    if (isLogged) {
      emit(LoginVerified());
    }
  }

  Future<void> verifyLogin(String username, String password) async {
    print('=======Pressed');
    emit(LoginVerifying());
    if (username == 'quan2710' && password == '2710') {
      pref.setBool('login', true);
      emit(LoginVerified());
    } else {
      emit(LoginFailed());
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    loggedCheck();
  }
  late SharedPreferences pref;

  void checkLogin(String username, String password) async {
    if (username == 'quan2710' && password == '2710') {
      pref = await SharedPreferences.getInstance();
      pref.setBool('logged', true);
      emit(LoggedIn(username: username, password: password));
    } else {
      emit(LoginFailed());
    }
  }

  void loggedCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('password') == '2710') {
      emit(LoggedIn(username: pref.getString('username')!, password: '2710'));
    } else {
      emit(LoggedOut());
    }
  }

  void logOut() async {
    emit(LoggedOut());
    pref.setBool('logged', false);
    pref.remove(pref.getString('username')!);
    pref.remove(pref.getString('password')!);
  }
}

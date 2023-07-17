import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {}
  final SharedPreferences pref = GetIt.instance.get();

  void checkLogin(String username, String password) async {
    if (username == 'quan2710' && password == '2710') {
      pref.setBool('logged', true);
      emit(LoggedIn(accessToken: '123456'));
    } else {
      emit(LoginFailed());
    }
  }

  void logOut() async {
    pref.setBool('logged', false);
    emit(LoggedOut());
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    loggedCheck();
  }

  void loggingIn(String username, String password) {
    emit(Logging(username: username, password: password));
  }

  void loggedCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLogged = pref.getBool('logged') ?? false;
    if (isLogged) {
      emit(LoggedCheck());
    } else {
      emit(LoggedOut());
    }
  }

  void logOut() async {
    emit(LoggedOut());
  }

  void authenticateComplete() {
    emit(LoggedIn());
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authenticate_state.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  AuthenticateCubit() : super(AuthenticateInitial());
  late SharedPreferences pref;

  void authenticating(String username, String password) async {
    pref = await SharedPreferences.getInstance();
    if (username == 'quan2710' && password == '2710') {
      String accessToken = '123456'; // This is the response of the server
      pref.setBool('logged', true);
      print('========SET Logged is true');
      pref.setStringList('user', [username, password, accessToken]);
      emit(Authenticated());
    } else {
      emit(AuthenticaingFailed());
    }
  }

  void checkAlreadyLogIn() async {
    print('==========THIS DOES RUN');
    pref = await SharedPreferences.getInstance();
    List<String> user = pref.getStringList('user') ?? [];
    if (user[0] == 'quan2710' && user[1] == '2710' && user[2] == '123456') {
      emit(Authenticated());
    } else {
      emit(AuthenticaingFailed());
    }
  }

  void logout() async {
    pref = await SharedPreferences.getInstance();
    await pref.remove('accessToken');
    await pref.setBool('logged', false);
    print('======LOG OUT IN AUTHENTICATE CUBIT');
  }
}

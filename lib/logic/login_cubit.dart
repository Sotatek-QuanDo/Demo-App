import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> verifyLogin(String username, String password) async {
    emit(LoginVerifying());
    if (username == 'quan2710' && password == '2710') {
      emit(LoginVerified());
    } else {
      emit(LoginFailed());
    }
  }
}

import 'package:cookyt_app/src/blocs/managers/auth_manager.dart';
import 'package:cookyt_app/src/blocs/managers/login_form_manager.dart';
import 'package:cookyt_app/src/blocs/managers/reset_password_manager.dart';
import 'package:cookyt_app/src/blocs/managers/signup_form_manager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(LoginFormManager, LoginFormManager());
    register(SignUpFormManager, SignUpFormManager());
    register(ResetPasswordManager, ResetPasswordManager());
    register(AuthManager, AuthManager());
  }

  void register(name, object) {
    repository[name] = object;
  }

  dynamic fetch(name) => repository[name];
}

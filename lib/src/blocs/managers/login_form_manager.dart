import 'package:cookyt_app/src/blocs/mixins/form_validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class LoginFormManager with FormValidatorMixin {
  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(emailValidator);
  Function(String) get setEmail => _email.sink.add;

  final _password = BehaviorSubject<String>();
  Stream<String> get password$ => _password.stream.transform(passwordValidator);
  Function(String) get setPassword => _password.sink.add;

  Stream<bool> get isFormValid$ =>
      CombineLatestStream.combine2<String, String, bool>(email$, password$,
          (email, password) {
        if (email == _email.value && password == _password.value) {
          return true;
        } else
          return false;
      });

  void submit() {
    print(_email.value);
    print(_password.value);
  }

  void dispose() {
    _email.close();
    _password.close();
  }
}

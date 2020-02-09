import 'package:cookyt_app/src/blocs/mixins/form_validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class LoginFormManager with FormValidatorMixin {
  //Subjects
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //Streams
  Stream<String> get email$ => _email.stream.transform(emailValidator);
  Stream<String> get password$ =>
      _password.stream.transform(passwordValidator);
  Stream<bool> get isFormValid$ =>
      CombineLatestStream.combine2<String, String, bool>(email$, password$,
          (email, password) {
        if (email == _email.value &&
            password == _password.value) {
          return true;
        } else {
          return false;
        }
      });

  //Sinks
  Function(String) get setEmail => _email.sink.add;
  Function(String) get setPassword => _password.sink.add;

  //Values
  String get emailValue => _email.value;
  String get passwordValue => _password.value;

  void dispose() {
    _email.close();
    _password.close();
  }
}

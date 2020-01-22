import 'package:cookyt_app/src/blocs/mixins/form_validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class SignUpFormManager with FormValidatorMixin {
  final _name = BehaviorSubject<String>();
  Stream<String> get name$ => _password.stream.transform(nameValidator);
  Function(String) get setName => _password.sink.add;

  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(emailValidator);
  Function(String) get setEmail => _email.sink.add;

  final _password = BehaviorSubject<String>();
  Stream<String> get password$ => _password.stream.transform(passwordValidator);
  Function(String) get setPassword => _password.sink.add;

  Stream<bool> get isFormValid$ =>
      CombineLatestStream([name$ ,email$, password$], (values) => true);

  void submit() {
    print(_name);
    print(_email.value);
    print(_password.value);
  }

  void dispose() {
    _name.close();
    _email.close();
    _password.close();
  }
}

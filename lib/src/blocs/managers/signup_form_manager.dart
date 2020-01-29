import 'package:cookyt_app/src/blocs/mixins/form_validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class SignUpFormManager with FormValidatorMixin {
  final _name = BehaviorSubject<String>();
  Stream<String> get name$ => _name.stream.transform(nameValidator);
  Function(String) get setName => _name.sink.add;

  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(emailValidator);
  Function(String) get setEmail => _email.sink.add;

  final _password = BehaviorSubject<String>();
  Stream<String> get password$ => _password.stream.transform(passwordValidator);
  Function(String) get setPassword => _password.sink.add;

  Stream<bool> get isFormValid$ =>
      CombineLatestStream.combine3(name$ ,email$, password$, (name, email, password){
        if ( name == _name.value && email == _email.value && password == _password.value) {
          return true;
        } else
          return false;
      });

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

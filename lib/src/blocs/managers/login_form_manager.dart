import 'package:cookyt_app/src/blocs/mixins/form_validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class LoginFormManager with FormValidatorMixin{
  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(emailValidator);
  Function(String) get setEmail => _email.sink.add;

  final _password = BehaviorSubject<String>();
  Stream<String> get password$ => _password.stream.transform(passwordValidator);
  Function(String) get setPassword => _password.sink.add;

  Stream<bool> get isFormValid$ => CombineLatestStream([email$, password$], (values) => true);

  void submit(){
    print(_email.value);
    print(_password.value);
  }

  void dispose(){
    _email.close();
    _password.close();
  }
}
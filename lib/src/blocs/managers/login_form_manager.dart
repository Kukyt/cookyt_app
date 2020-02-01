import 'package:cookyt_app/src/blocs/mixins/form_validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class LoginFormManager with FormValidatorMixin {
  //Subjects
  final _emailFetcher = BehaviorSubject<String>();
  final _passwordFetcher = BehaviorSubject<String>();
  final _isButtonPressed = BehaviorSubject<bool>();

  final _emailOut = PublishSubject<String>();
  final _passwordOut = PublishSubject<String>();

  //Streams
  Stream<String> get email$ => _emailOut.stream.transform(emailValidator);
  Stream<String> get password$ => _passwordOut.stream.transform(passwordValidator);
  Stream<bool> get buttonState$ => _isButtonPressed.stream;
  Stream<bool> get isFormValid$ =>
      CombineLatestStream.combine3<String, String, bool,bool>(email$, password$, buttonState$ ,
          (email, password, buttonPressed) {
        if (email == _emailFetcher.value && password == _passwordFetcher.value && !buttonPressed)
          return true;
        else
          return false;
      });

  //Sinks
  Function(String) get setEmail => _emailFetcher.sink.add;
  Function(String) get setPassword => _passwordFetcher.sink.add;
  Function(bool) get buttonPressed => _isButtonPressed.sink.add;

  //Values
  String get emailValue => _emailFetcher.value;
  String get passwordValue => _passwordFetcher.value;

  LoginFormManager(){
    _isButtonPressed.add(false);
    _emailFetcher.pipe(_emailOut);
    _passwordFetcher.pipe(_passwordOut);
  }

  void dispose() {
    _emailOut.close();
    _passwordOut.close();
    _emailFetcher.close();
    _passwordFetcher.close();
    _isButtonPressed.close();
  }
}

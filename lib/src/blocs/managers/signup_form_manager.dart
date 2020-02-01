import 'package:cookyt_app/src/blocs/mixins/form_validator_mixin.dart';
import 'package:rxdart/rxdart.dart';

class SignUpFormManager with FormValidatorMixin {
  //Subjects
  final _nameFetcher = BehaviorSubject<String>();
  final _emailFetcher = BehaviorSubject<String>();
  final _passwordFetcher = BehaviorSubject<String>();
  final _nameOut = PublishSubject<String>();
  final _emailOut = PublishSubject<String>();
  final _passwordOut = PublishSubject<String>();

  //Streams
  Stream<String> get name$ => _nameOut.stream.transform(nameValidator);
  Stream<String> get email$ => _emailOut.stream.transform(emailValidator);
  Stream<String> get password$ =>
      _passwordOut.stream.transform(passwordValidator);
  Stream<bool> get isFormValid$ =>
      CombineLatestStream.combine3(name$, email$, password$,
          (name, email, password) {
        if (name == _nameFetcher.value &&
            email == _emailFetcher.value &&
            password == _passwordFetcher.value) {
          return true;
        } else {
          return false;
        }
      });

  //Sinks
  Function(String) get setName => _nameFetcher.sink.add;
  Function(String) get setEmail => _emailFetcher.sink.add;
  Function(String) get setPassword => _passwordFetcher.sink.add;

  //Values
  String get nameValue => _nameFetcher.value;
  String get emailValue => _emailFetcher.value;
  String get passwordValue => _passwordFetcher.value;

  SignUpFormManager() {
    _nameFetcher.pipe(_nameOut);
    _emailFetcher.pipe(_emailOut);
    _passwordFetcher.pipe(_passwordOut);
  }

  void dispose() {
    _nameOut.close();
    _emailOut.close();
    _passwordOut.close();
    _nameFetcher.close();
    _emailFetcher.close();
    _passwordFetcher.close();
  }
}

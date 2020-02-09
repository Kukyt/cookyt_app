import 'package:rxdart/rxdart.dart';

import '../mixins/form_validator_mixin.dart';

class ResetPasswordManager with FormValidatorMixin {
  final BehaviorSubject _emailFetcher = BehaviorSubject<String>();
  final PublishSubject _emailOut = PublishSubject<String>();

  Stream<String> get email$ => _emailOut.stream.transform(emailValidator);

  Function(String) get setEmail => _emailFetcher.sink.add;

  String get email => _emailFetcher.value;

  ResetPasswordManager(){
    _emailFetcher.pipe(_emailOut);
  }

  dispose(){
    _emailFetcher.close();
    _emailOut.close();
  }
}

import 'dart:async';

mixin FormValidatorMixin {
  static final RegExp _validEmail = RegExp(
      r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static final RegExp _validPassword =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');

  StreamTransformer<String, String> emailValidator =
      StreamTransformer.fromHandlers(handleData: (value, sink) {
    if (_validEmail.hasMatch(value))
      sink.add(value);
    else
      sink.addError('Invalid email');
  });

  StreamTransformer<String, String> passwordValidator =
      StreamTransformer.fromHandlers(handleData: (value, sink) {
    if (_validPassword.hasMatch(value))
      sink.add(value);
    else
      sink.addError('The password must be at least 8 characters long including 1 lower case, 1 upper case and 1 number.');
  });

  StreamTransformer<String, String> nameValidator =
      StreamTransformer.fromHandlers(handleData: (value, sink) {
    if (value.trim().isEmpty) {
      sink.addError("Enter a valid name");
    } else {
      sink.add(value);
    }
  });
}

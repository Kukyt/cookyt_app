import 'dart:async';

mixin FormValidatorMixin {
  StreamTransformer<String, String> emailValidator = StreamTransformer.fromHandlers(
    handleData: (value, sink){
      if(value.contains('@') && !value.contains(' '))
        sink.add(value);
      else  
        sink.addError('Invalid email');
    }
  );

  StreamTransformer<String, String> passwordValidator = StreamTransformer.fromHandlers(
    handleData: (value, sink){
      if(value.length <= 5)
        sink.addError('password too short');
      else  
        sink.add(value);
    }
  );

  StreamTransformer<String, String> nameValidator = StreamTransformer.fromHandlers(
    handleData: (value, sink){
      if(value.trim().isEmpty){
        sink.addError("Enter a valid name");
      }else{
        sink.add(value);
      }
    }
  );  
}


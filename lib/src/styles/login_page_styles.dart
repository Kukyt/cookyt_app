import 'package:flutter/material.dart';

InputDecoration textFieldDecoration(name) {
  return InputDecoration(
    errorStyle: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 15.0 ),
    filled: true,
    fillColor: Colors.white,
    hintText: name,
    contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
    focusedBorder: _textFieldBorder,
    enabledBorder: _textFieldBorder,
    errorBorder: _textFieldBorder,
    border: _textFieldBorder,
  );
}

final _textFieldBorder = UnderlineInputBorder(
  borderSide: BorderSide(color: Colors.white),
  borderRadius: BorderRadius.circular(25.7),
);

final loginTextStyle = TextStyle(
  fontFamily: 'Satisfy',
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

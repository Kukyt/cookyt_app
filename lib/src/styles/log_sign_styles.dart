import 'package:flutter/material.dart';

InputDecoration textFieldDecoration(name) {
  return InputDecoration(
    errorStyle: TextStyle(
        fontFamily: 'Baloo Bhai',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 17.0),
    filled: true,
    fillColor: Colors.white,
    hintText: name,
    contentPadding: const EdgeInsets.only(left: 14.0),
    focusedBorder: _textFieldBorder,
    enabledBorder: _textFieldBorder,
    errorBorder: _textFieldBorder,
    border: _textFieldBorder,
  );
}

final hintTextStyle = TextStyle(
  fontFamily: 'Baloo Bhai',
  fontSize: 22.0,
  color: Color(0xFFbdc6cf),
);

final _textFieldBorder = UnderlineInputBorder(
  borderSide: BorderSide(color: Colors.white),
  borderRadius: BorderRadius.circular(10),
);

TextStyle loginTextStyle({bool underline = false}) {
  var decoration = TextDecoration.none;
  if (underline == true) {
    decoration = TextDecoration.underline;
  }
  return TextStyle(
    fontFamily: 'Baloo Bhai',
    decoration: decoration,
    decorationThickness: 2.0,
    color: Colors.white,
    fontSize: 23.0,
    fontWeight: FontWeight.bold,
  );
}
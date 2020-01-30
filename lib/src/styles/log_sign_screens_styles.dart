import 'package:flutter/material.dart';

InputDecoration rxTextFieldDecoration({String hintText}) {
  return InputDecoration(
    errorStyle: TextStyle(
        fontFamily: 'Baloo Bhai',
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 17.0),
        errorMaxLines: 5,
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintMaxLines: 2,
    contentPadding: const EdgeInsets.only(left: 14.0),
    focusedBorder: _textFieldBorder,
    focusedErrorBorder: _textFieldBorder,
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
  borderRadius: BorderRadius.circular(8),
);

TextStyle loginTextStyle({TextDecoration decoration = TextDecoration.none}) {
  return TextStyle(
    fontFamily: 'Baloo Bhai',
    decoration: decoration,
    decorationThickness: 2.0,
    color: Colors.white,
    fontSize: 23.0,
    fontWeight: FontWeight.bold,
  );
}

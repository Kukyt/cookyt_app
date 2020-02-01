import 'package:flutter/material.dart';

TextStyle textStyle({TextDecoration decoration = TextDecoration.none}) {
  return TextStyle(
    fontFamily: 'Baloo Bhai',
    decoration: decoration,
    decorationThickness: 2.0,
    color: Colors.white,
    fontSize: 23.0,
    fontWeight: FontWeight.bold,
  );
}

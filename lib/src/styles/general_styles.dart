import 'package:flutter/material.dart';

TextStyle textStyle({TextDecoration decoration = TextDecoration.none, double fontSize}) {
  return TextStyle(
    fontFamily: 'Baloo Bhai',
    decoration: decoration,
    decorationThickness: 2.0,
    color: Colors.white,
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
  );
}

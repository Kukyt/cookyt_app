import 'package:cookyt_app/src/styles/splash_screen_styles.dart';
import 'package:flutter/material.dart';

class CookitTitle extends StatelessWidget {
  const CookitTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Text('Cookit', style: cookytLogoStyle),
    );
  }
}

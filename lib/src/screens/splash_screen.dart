import 'dart:async';
import 'package:cookyt_app/src/Widgets/login_sign_widgets/cookit_title.dart';
import 'package:cookyt_app/src/Widgets/login_sign_widgets/positioned_background.dart';
import 'package:cookyt_app/src/styles/splash_screen_styles.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const id = 'splash_screen';

  SplashScreen(BuildContext context){
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(
        context,
        LoginScreen.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        positionedBackground,
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CookitTitle(),
              Text('Cook your life', style: brandPhraseStyle),
            ],
          ),
        ),
      ]),
    );
  }
}

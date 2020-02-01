import 'dart:async';
import 'package:cookyt_app/src/Widgets/login_sign_widgets/cookit_title.dart';
import 'package:cookyt_app/src/styles/background_decorations.dart/bg_decorations.dart';
import 'package:cookyt_app/src/styles/splash_screen_styles.dart';
import 'package:flutter/material.dart';

import 'landing_screen.dart';

class SplashScreen extends StatelessWidget {
  static const id = 'splash_screen';

  SplashScreen(BuildContext context) {
    Timer(Duration(seconds: 2), () {
     Navigator.pushReplacementNamed(context, LandingScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BgDecorations.tealDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CookitTitle(),
            Text('Cook your life', style: brandPhraseStyle),
          ],
        ),
      ),
    );
  }
}

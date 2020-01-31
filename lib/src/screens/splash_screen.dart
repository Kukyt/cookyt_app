import 'dart:async';
import 'package:cookyt_app/settings/provider.dart';
import 'package:cookyt_app/src/Widgets/login_sign_widgets/cookit_title.dart';
import 'package:cookyt_app/src/blocs/managers/auth_manager.dart';
import 'package:cookyt_app/src/screens/feed_screen.dart';
import 'package:cookyt_app/src/styles/background_decorations.dart/bg_decorations.dart';
import 'package:cookyt_app/src/styles/splash_screen_styles.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const id = 'splash_screen';

  SplashScreen(BuildContext context) {
    final AuthManager auth = Provider.of(context).fetch(AuthManager);
    Timer(Duration(seconds: 2), () async {
      if (await auth.isLogged()) {
        Navigator.pushReplacementNamed(context, FeedScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, LoginScreen.id);
      }
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

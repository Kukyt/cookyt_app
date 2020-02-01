import 'package:cookyt_app/settings/provider.dart';
import 'package:cookyt_app/src/blocs/managers/auth_manager.dart';
import 'package:cookyt_app/src/screens/email_validation_screen.dart';
import 'package:cookyt_app/src/screens/feed_screen.dart';
import 'package:cookyt_app/src/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  static const String id = 'langind_screen';
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthManager auth = Provider.of(context).fetch(AuthManager);
    return StreamBuilder<FirebaseUser>(
      stream: auth.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          final FirebaseUser user = snapshot.data;
          if (user.isEmailVerified)
            return FeedScreen();
          else
            return EmailValidationScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}

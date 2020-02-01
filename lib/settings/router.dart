import 'package:cookyt_app/settings/provider.dart';
import 'package:cookyt_app/src/blocs/managers/signup_form_manager.dart';
import 'package:cookyt_app/src/screens/feed_screen.dart';
import 'package:cookyt_app/src/screens/landing_screen.dart';
import 'package:cookyt_app/src/screens/profile_screen.dart';
import 'package:cookyt_app/src/screens/signup_screen.dart';
import 'package:cookyt_app/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LandingScreen.id:
      return MaterialPageRoute(builder: (_) => LandingScreen());

      case FeedScreen.id:
        return MaterialPageRoute(builder: (_) => FeedScreen());
        
      case ProfileScreen.id:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case SignupScreen.id:
        return MaterialPageRoute(builder: (context) {
          final SignUpFormManager manager = Provider.of(context).fetch(SignUpFormManager);
          manager.buttonPressed(false);
          return SignupScreen();
        });
        
      case SplashScreen.id:
        return MaterialPageRoute(builder: (context) => SplashScreen(context));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

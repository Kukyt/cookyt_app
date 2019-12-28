import 'package:cookyt_app/src/screens/feed_screen.dart';
import 'package:cookyt_app/src/screens/login_screen.dart';
import 'package:cookyt_app/src/screens/profile_screen.dart';
import 'package:cookyt_app/src/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case FeedScreen.id:
        return MaterialPageRoute(builder: (_) => FeedScreen());

      case LoginScreen.id:
        return PageTransition(
          child: LoginScreen(),
          type: PageTransitionType.fade,
        );

      case ProfileScreen.id:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case SignupScreen.id:
        return PageTransition(
          child: SignupScreen(),
          type: PageTransitionType.fade,
        );

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

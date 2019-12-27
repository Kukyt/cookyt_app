import 'package:cookyt_app/src/screens/feed_screen.dart';
import 'package:cookyt_app/src/screens/login_screen.dart';
import 'package:cookyt_app/src/screens/profile_screen.dart';
import 'package:cookyt_app/src/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case FeedScreen.id:
        return MaterialPageRoute(builder: (_) => FeedScreen());
      case LoginScreen.id:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case ProfileScreen.id:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case SignupScreen.id:
        return MaterialPageRoute(builder: (_) => SignupScreen());
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

import 'package:cookyt_app/src/models/router.dart';
import 'package:cookyt_app/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kukyt App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[200],
        splashColor: Colors.greenAccent,
        accentColor: Colors.green[50],
      ),
      home: SplashScreen(),
      onGenerateRoute: Router.generateRoute,
    );
  }
}

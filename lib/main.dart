import 'package:cookyt_app/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'src/provider.dart';
import 'src/router.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: "Kukyt App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green[200],
          splashColor: Colors.greenAccent,
          accentColor: Colors.green[50],
        ),
        home: SplashScreen(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

import 'package:cookyt_app/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'settings/provider.dart';
import 'settings/router.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: "Kukyt App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.teal,
          splashColor: Colors.greenAccent,
          accentColor: Colors.tealAccent,
        ),
        initialRoute: SplashScreen.id,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

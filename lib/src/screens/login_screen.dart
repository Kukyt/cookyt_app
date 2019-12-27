import 'package:flutter/material.dart';
import 'feed_screen.dart';

class LoginScreen extends StatefulWidget {

  static const String id = 'login_screen';

  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Login Screen',
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              color: Colors.cyan,
              child: Text('Go to Feed Screen'),
              onPressed: () => Navigator.pushNamed(context, FeedScreen.id),
            ),
          ],
        ),
      ),
    );
  }
}
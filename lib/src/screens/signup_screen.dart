import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {

  static const String id = 'signup_screen';

  SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Signup Screen'),
      ),
    );
  }
}
import 'package:cookyt_app/src/Widgets/cool_background.dart';
import 'package:cookyt_app/src/Widgets/signup_with_button.dart';
import 'package:cookyt_app/src/screens/feed_screen.dart';
import 'package:cookyt_app/src/screens/signup_screen.dart';
import 'package:cookyt_app/src/styles/log_sign_styles.dart';
import 'package:cookyt_app/src/styles/splash_screen_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  void _submit() {
    if (_formKey.currentState.validate()) {
      print(_email);
      print(_password);
      Navigator.pushReplacementNamed(context, FeedScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0.0,
          child: CoolBackground(),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      'Cookit',
                      style: cookytLogoStyle,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      children: <Widget>[
                        Hero(
                          tag: 'email_field',
                          child: Material(
                            type: MaterialType.transparency,
                            child: TextFormField(
                              keyboardAppearance: Brightness.dark,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: hintTextStyle,
                              decoration: textFieldDecoration('Email'),
                              validator: (input) => !input.contains('@')
                                  ? 'Please enter a valid email'
                                  : null,
                              onSaved: (input) => _email = input,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Hero(
                          tag: 'pwd_field',
                          child: Material(
                            type: MaterialType.transparency,
                            child: TextFormField(
                              autofocus: false,
                              obscureText: true,
                              keyboardAppearance: Brightness.dark,
                              keyboardType: TextInputType.visiblePassword,
                              style: hintTextStyle,
                              decoration: textFieldDecoration('Password'),
                              validator: (input) => (input.length < 6)
                                  ? 'Please enter a valid password'
                                  : null,
                              onSaved: (input) => _password = input,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Hero(
                          tag: 'button',
                          child: Material(
                            type: MaterialType.transparency,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60.0, vertical: 5.0),
                              child: Text(
                                'Login',
                                style: loginTextStyle(),
                              ),
                              color: Colors.tealAccent,
                              onPressed: _submit,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('New?', style: loginTextStyle()),
                            SizedBox(width: 10.0),
                            InkWell(
                              child: Text(
                                'Signup here',
                                style: loginTextStyle(underline: true),
                                softWrap: true,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, SignupScreen.id),
                            )
                          ],
                        ),
                        Text('─  OR  ─', style: loginTextStyle()),
                        Text('Signup with', style: loginTextStyle()),
                        SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SignUpWithButton(
                              imagePath: 'assets/images/logos/google.png',
                              onTap: null,
                            ),
                            SignUpWithButton(
                              imagePath: 'assets/images/logos/facebook.png',
                              onTap: null,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

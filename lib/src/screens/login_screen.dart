import 'package:cookyt_app/src/screens/feed_screen.dart';
import 'package:cookyt_app/src/screens/signup_screen.dart';
import 'package:cookyt_app/src/styles/login_page_styles.dart';
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
          right: 0.0,
          left: 0.0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/rock_background.jpg'),
              ),
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Cookyt',
                  style: cookytLogoStyle,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        TextFormField(
                          keyboardAppearance: Brightness.dark,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          style: TextStyle(
                              fontSize: 22.0, color: Color(0xFFbdc6cf)),
                          decoration: textFieldDecoration('Email'),
                          validator: (input) => !input.contains('@')
                              ? 'Please enter a valid email'
                              : null,
                          onSaved: (input) => _email = input,
                        ),
                        SizedBox(height: 30.0),
                        TextFormField(
                          autofocus: false,
                          obscureText: true,
                          keyboardAppearance: Brightness.dark,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Color(0xFFbdc6cf),
                          ),
                          decoration: textFieldDecoration('Password'),
                          validator: (input) => (input.length < 6)
                              ? 'Please enter a valid password'
                              : null,
                          onSaved: (input) => _password = input,
                        ),
                        SizedBox(height: 20.0),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 5.0),
                          child: Text(
                            'Login',
                            style: loginTextStyle,
                          ),
                          color: Colors.tealAccent,
                          onPressed: _submit,
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('New here?', style: loginTextStyle),
                            SizedBox(width: 10.0),
                            InkWell(
                              child: Text('Signup', style: loginTextStyle),
                              onTap: () =>
                                  Navigator.pushNamed(context, SignupScreen.id),
                            )
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Text('----  Or  ----', style: loginTextStyle),
                        SizedBox(height: 5.0),
                        Text('Register with', style: loginTextStyle),
                        SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                width: 58.0,
                                height: 58.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/logos/google.png'))),
                              ),
                              onTap: () => null,
                            ),
                            GestureDetector(
                              child: Container(
                                width: 58.0,
                                height: 58.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/logos/facebook.png'),
                                  ),
                                ),
                              ),
                              onTap: () => null,
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

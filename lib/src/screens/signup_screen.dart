import 'package:cookyt_app/src/Widgets/cool_background.dart';
import 'package:cookyt_app/src/styles/log_sign_styles.dart';
import 'package:cookyt_app/src/styles/splash_screen_styles.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static const String id = 'signup_screen';

  SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _formKey = GlobalKey<FormState>();
  String _name;
  String _email;
  String _password;

  void _submit() {
    if (_formKey.currentState.validate()) {
      print(_name);
      print(_email);
      print(_password);
      Navigator.pop(context);
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
                  transitionOnUserGestures: true,
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
                        TextFormField(
                          keyboardAppearance: Brightness.dark,
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          style: hintTextStyle,
                          decoration: textFieldDecoration('Name'),
                          validator: (input) => input.isEmpty
                              ? 'Please enter a valid name'
                              : null,
                          onSaved: (input) => _name = input,
                        ),
                        SizedBox(height: 20.0),
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
                        SizedBox(height: 20.0),
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
                        SizedBox(height: 20.0),
                        Hero(
                          tag: 'button',
                          child: Material(
                            type: MaterialType.transparency,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                                vertical: 5.0,
                              ),
                              child: Text(
                                'Signup',
                                style: loginTextStyle(),
                              ),
                              color: Colors.tealAccent,
                              onPressed: _submit,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        InkWell(
                          child: Text(
                            'Back to login',
                            style: loginTextStyle(underline: true),
                          ),
                          onTap: () => Navigator.pop(context),
                        )
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

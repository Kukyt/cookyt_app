import 'package:cookyt_app/src/Widgets/smooth_background.dart';
import 'package:cookyt_app/src/Widgets/rx_text_field.dart';
import 'package:cookyt_app/src/blocs/managers/signup_form_manager.dart';
import 'package:cookyt_app/src/provider.dart';
import 'package:cookyt_app/src/screens/feed_screen.dart';
import 'package:cookyt_app/src/styles/log_sign_styles.dart';
import 'package:cookyt_app/src/styles/splash_screen_styles.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  static const String id = 'signup_screen';

  @override
  Widget build(BuildContext context) {
    final SignUpFormManager manager =
        Provider.of(context).fetch(SignUpFormManager);
    final Size mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(overflow: Overflow.visible, children: [
        Positioned(
          top: 0.0,
          child: SmoothBackground(),
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: mediaSize.height*0.16),
                child: Hero(
                  tag: 'logo',
                  transitionOnUserGestures: true,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text('Cookit', style: cookytLogoStyle),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(mediaSize.width*0.12, 0.0, mediaSize.width*0.12, 0.0),
                child: RxTextField(
                  suscribe: manager.name$,
                  dispatch: manager.setName,
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  style: hintTextStyle,
                  decoration: textFieldDecoration('Name'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(mediaSize.width*0.12, 40.0, mediaSize.width*0.12, 40.0),
                child: RxTextField(
                  suscribe: manager.email$,
                  dispatch: manager.setEmail,
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  style: hintTextStyle,
                  decoration: textFieldDecoration('Email'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(mediaSize.width*0.12, 0.0, mediaSize.width*0.12, 30.0),
                child: RxTextField(
                  suscribe: manager.password$,
                  dispatch: manager.setPassword,
                  autofocus: false,
                  obscureText: true,
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.visiblePassword,
                  style: hintTextStyle,
                  decoration: textFieldDecoration('Password'),
                ),
              ),
              StreamBuilder<Object>(
                  stream: manager.isFormValid$,
                  builder: (context, snapshot) {
                    return RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 5.0,
                        ),
                        child: Text('Signup', style: loginTextStyle()),
                        color: Colors.tealAccent,
                        onPressed: !snapshot.hasData
                            ? null
                            : () {
                                manager.submit();
                                Navigator.pushReplacementNamed(
                                    context, FeedScreen.id);
                              });
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InkWell(
                  child: Text(
                    'Back to login',
                    style: loginTextStyle(underline: true),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

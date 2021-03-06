import 'package:cookyt_app/src/Widgets/login_sign_widgets/cookit_title.dart';
import 'package:cookyt_app/src/Widgets/login_sign_widgets/cupertino_dialog.dart';
import 'package:cookyt_app/src/Widgets/login_sign_widgets/signupwith_button.dart';
import 'package:cookyt_app/src/Widgets/rx_widgets/rx_raised_button.dart';
import 'package:cookyt_app/src/Widgets/rx_widgets/rx_text_field.dart';
import 'package:cookyt_app/src/blocs/managers/auth_manager.dart';
import 'package:cookyt_app/src/blocs/managers/login_form_manager.dart';
import 'package:cookyt_app/settings/provider.dart';
import 'package:cookyt_app/src/screens/recover_password_screen.dart';
import 'package:cookyt_app/src/screens/signup_screen.dart';
import 'package:cookyt_app/src/styles/background_decorations.dart/bg_decorations.dart';
import 'package:cookyt_app/src/styles/general_styles.dart';
import 'package:cookyt_app/src/styles/log_sign_screens_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';

  /// The submit function try to login the user into the app
  Future _login(
      context, LoginFormManager manager, AuthManager authManager) async {
    try {
      await authManager.signIn(manager.emailValue, manager.passwordValue);
    } catch (err) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoDialogSingleAction(
            content: err.message,
            onPressed: () => Navigator.pop(context),
          );
        },
      );
    }
  }

  Future _signInWithGoogle(
      BuildContext context, AuthManager authManager) async {
    try {
      await authManager.signInWithGoogle();
    } catch (err) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoDialogSingleAction(
            content: err.message,
            onPressed: () => Navigator.pop(context),
          );
        },
      );
    }
  }

  Future _signInWithFacebook(
      BuildContext context, AuthManager authManager) async {
    try {
      await authManager.signInWithFacebook();
      await authManager.sendVerificationEmail();
    } catch (err) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoDialogSingleAction(
            content: err.message,
            onPressed: () => Navigator.pop(context),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final LoginFormManager manager =
        Provider.of(context).fetch(LoginFormManager);
    final AuthManager authManager = Provider.of(context).fetch(AuthManager);
    final Size mediaSize = MediaQuery.of(context).size;
    final double _textSize = mediaSize.width * 0.05;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BgDecorations.tealDecoration,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ///The cookit title
              Padding(
                padding: EdgeInsets.only(top: mediaSize.height * 0.05),
                child: Hero(
                  tag: 'logo',
                  child: CookitTitle(),
                ),
              ),

              ///Reactive text fields
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaSize.width * 0.12),
                child: RxTextField(
                  suscribe: manager.email$,
                  dispatch: manager.setEmail,
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  style: hintTextStyle,
                  decoration: textFieldDecoration(hintText: 'Email'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    mediaSize.width * 0.12,
                    mediaSize.height * 0.05,
                    mediaSize.width * 0.12,
                    mediaSize.height * 0.02),
                child: RxTextField(
                  suscribe: manager.password$,
                  dispatch: manager.setPassword,
                  autofocus: false,
                  obscureText: true,
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.visiblePassword,
                  style: hintTextStyle,
                  decoration: textFieldDecoration(hintText: 'Password'),
                ),
              ),

              InkWell(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: 10.0, right: mediaSize.width * 0.15),
                  alignment: Alignment.centerRight,
                  child: Text("Forgot your password?",
                      style: textStyle(decoration: TextDecoration.underline, fontSize: _textSize)
                          ),
                ),
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pushNamed(context, RecoverPasswordScreen.id);
                },
              ),

              ///Reactive Login button
              RxRaisedButton(
                  suscribe: manager.isFormValid$,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60.0,
                    vertical: 5.0,
                  ),
                  child: Text('Login', style: textStyle(fontSize: _textSize)),
                  color: Theme.of(context).accentColor,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    await _login(context, manager, authManager);
                  }),

              ///Go to Signup Page for signup
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Text('New?',
                          style: textStyle(fontSize: _textSize)),
                    ),
                    InkWell(
                        child: Text(
                          'Signup here',
                          style: textStyle(decoration: TextDecoration.underline)
                              .copyWith(fontSize: _textSize),
                          softWrap: true,
                        ),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushNamed(context, SignupScreen.id);
                        })
                  ],
                ),
              ),

              ///RegisterWith Buttons
              Text('─  OR  ─',
                  style:
                      textStyle(fontSize: _textSize)),
              Text('Signup with',
                  style:
                      textStyle(fontSize: _textSize)),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SignUpWithButton(
                      imagePath: 'assets/images/logos/google.png',
                      onTap: () => _signInWithGoogle(context, authManager),
                    ),
                    SignUpWithButton(
                      imagePath: 'assets/images/logos/facebook.png',
                      onTap: () => _signInWithFacebook(context, authManager),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

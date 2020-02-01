import 'package:cookyt_app/src/Widgets/login_sign_widgets/cookit_title.dart';
import 'package:cookyt_app/src/Widgets/login_sign_widgets/cupertino_dialog.dart';
import 'package:cookyt_app/src/Widgets/rx_widgets/rx_raised_button.dart';
import 'package:cookyt_app/src/Widgets/rx_widgets/rx_text_field.dart';
import 'package:cookyt_app/src/blocs/managers/auth_manager.dart';
import 'package:cookyt_app/src/blocs/managers/signup_form_manager.dart';
import 'package:cookyt_app/settings/provider.dart';
import 'package:cookyt_app/src/styles/background_decorations.dart/bg_decorations.dart';
import 'package:cookyt_app/src/styles/general_styles.dart';
import 'package:cookyt_app/src/styles/log_sign_screens_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  static const String id = 'signup_screen';

  /// The submit function try to register a user into firebase
  Future _signUp(
      context, SignUpFormManager manager, AuthManager authManager) async {
    try {
      await authManager.signup(
          manager.nameValue, manager.emailValue, manager.passwordValue);
      await authManager.sendVerificationEmail();
      Navigator.pop(context);
    } catch (err) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoDialogSingleAction(
              content: err.message,
              onPressed: () => Navigator.pop(context),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final SignUpFormManager manager =
        Provider.of(context).fetch(SignUpFormManager);
    final AuthManager authManager = Provider.of(context).fetch(AuthManager);
    final Size mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BgDecorations.tealDecoration,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ///The cookit title
              Hero(
                tag: 'logo',
                child: CookitTitle(),
              ),

              ///Reactive text Fields
              Padding(
                padding: EdgeInsets.fromLTRB(
                    mediaSize.width * 0.12, 0.0, mediaSize.width * 0.12, 0.0),
                child: RxTextField(
                  suscribe: manager.name$,
                  dispatch: manager.setName,
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  style: hintTextStyle,
                  decoration: textFieldDecoration(hintText: 'Name'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    mediaSize.width * 0.12, 35.0, mediaSize.width * 0.12, 35.0),
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
                    mediaSize.width * 0.12, 0.0, mediaSize.width * 0.12, 30.0),
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

              ///Reactive raised button
              RxRaisedButton(
                  suscribe: manager.isFormValid$,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 5.0,
                  ),
                  child: Text('Signup', style: textStyle()),
                  color: Colors.tealAccent,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    await _signUp(context, manager, authManager);
                  }),

              ///Back to login InkWell
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InkWell(
                  child: Text(
                    'Back to login',
                    style: textStyle(decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

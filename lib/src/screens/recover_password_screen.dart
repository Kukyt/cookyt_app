import 'package:cookyt_app/settings/provider.dart';
import 'package:cookyt_app/src/Widgets/login_sign_widgets/cupertino_dialog.dart';
import 'package:cookyt_app/src/blocs/managers/auth_manager.dart';
import 'package:cookyt_app/src/blocs/managers/reset_password_manager.dart';
import 'package:cookyt_app/src/styles/background_decorations.dart/bg_decorations.dart';
import 'package:cookyt_app/src/styles/general_styles.dart';
import 'package:cookyt_app/src/styles/log_sign_screens_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/rx_widgets/rx_raised_button.dart';
import '../Widgets/rx_widgets/rx_text_field.dart';

class RecoverPasswordScreen extends StatelessWidget {
  static const String id = 'recover_passoword_screen';

  const RecoverPasswordScreen({Key key}) : super(key: key);

  Future<void> _sendResetPasswordEmail(
      BuildContext context, AuthManager auth, String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoDialogSingleAction(
            content: "Password reset email send! Please check your inbox^^",
            onPressed: () => Navigator.pop(context),
          );
        },
      );
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
    Size mediaSize = MediaQuery.of(context).size;
    AuthManager auth = Provider.of(context).fetch(AuthManager);
    ResetPasswordManager manager =
        Provider.of(context).fetch(ResetPasswordManager);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () => Navigator.pop(context),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BgDecorations.tealDecoration,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaSize.width * 0.08, vertical: 10.0),
                child: Text(
                  "To reset your password type your email and press the button below!^^",
                  style: textStyle(fontSize: mediaSize.width * 0.055),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    mediaSize.width * 0.12, 0.0, mediaSize.width * 0.12, 30.0),
                child: RxTextField(
                  suscribe: manager.email$,
                  dispatch: manager.setEmail,
                  decoration: textFieldDecoration(hintText: "Email"),
                  style: hintTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: RxRaisedButton(
                    suscribe: manager.email$,
                    child: Text("Send reset email",
                        style: textStyle(fontSize: mediaSize.width * 0.05)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 5.0,
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _sendResetPasswordEmail(context, auth, manager.email);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

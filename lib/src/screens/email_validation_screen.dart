import 'package:cookyt_app/settings/provider.dart';
import 'package:cookyt_app/src/Widgets/login_sign_widgets/cupertino_dialog.dart';
import 'package:cookyt_app/src/blocs/managers/auth_manager.dart';
import 'package:cookyt_app/src/styles/background_decorations.dart/bg_decorations.dart';
import 'package:cookyt_app/src/styles/general_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailValidationScreen extends StatelessWidget {
  const EmailValidationScreen({Key key}) : super(key: key);

  Future<void> _resendEmail(BuildContext context, AuthManager auth) async {
    try {
      await auth.sendVerificationEmail();
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
    final AuthManager auth = Provider.of(context).fetch(AuthManager);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "SignOut",
          style: textStyle(),
        ),
        onPressed: () => auth.signOut(),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BgDecorations.tealDecoration,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.07,
                    vertical: 20.0),
                child: Text(
                  "We send you a verification email, please check your inbox!\n If you haven't received any email, press the button below",
                  style: textStyle(),
                ),
              ),
              RaisedButton(
                child: Text("Resend email", style: textStyle()),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5.0,
                ),
                color: Theme.of(context).accentColor,
                onPressed: () => _resendEmail(context, auth),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

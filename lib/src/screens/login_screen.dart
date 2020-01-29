import 'package:cookyt_app/src/Widgets/login_sign_widgets/cookit_title.dart';
import 'package:cookyt_app/src/Widgets/login_sign_widgets/signupwith_button.dart';
import 'package:cookyt_app/src/Widgets/login_sign_widgets/positioned_background.dart';
import 'package:cookyt_app/src/Widgets/rx_widgets/rx_raised_button.dart';
import 'package:cookyt_app/src/Widgets/rx_widgets/rx_text_field.dart';
import 'package:cookyt_app/src/blocs/managers/login_form_manager.dart';
import 'package:cookyt_app/settings/provider.dart';
import 'package:cookyt_app/src/screens/feed_screen.dart';
import 'package:cookyt_app/src/screens/signup_screen.dart';
import 'package:cookyt_app/src/styles/log_sign_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';

  /// The submit function try to login the user into the app
  _submit(context, manager) {
    manager.submit();
    Navigator.pushReplacementNamed(context, FeedScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    final LoginFormManager manager =
        Provider.of(context).fetch(LoginFormManager);
    final Size mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          ///The positioned object with the background image
          positionedBackground,

          ///All the main widget structure of this page
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ///The cookit title
                Padding(
                  padding: EdgeInsets.only(top: mediaSize.height * 0.16),
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
                    decoration: rxTextFieldDecoration(hintText: 'Email'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaSize.width * 0.12, vertical: 40.0),
                  child: RxTextField(
                    suscribe: manager.password$,
                    dispatch: manager.setPassword,
                    autofocus: false,
                    obscureText: true,
                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.visiblePassword,
                    style: hintTextStyle,
                    decoration: rxTextFieldDecoration(hintText: 'Password'),
                  ),
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
                  child: Text('Login', style: loginTextStyle()),
                  color: Colors.tealAccent,
                  onPressed: () => _submit(context, manager),
                ),

                ///Go to Signup Page for signup
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: Text('New?', style: loginTextStyle()),
                      ),
                      InkWell(
                          child: Text(
                            'Signup here',
                            style: loginTextStyle(underline: true),
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
                Text('─  OR  ─', style: loginTextStyle()),
                Text('Signup with', style: loginTextStyle()),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SignUpWithButton(
                        imagePath: 'assets/images/logos/google.png',
                        onTap: () => print('Google was pressed'),
                      ),
                      SignUpWithButton(
                        imagePath: 'assets/images/logos/facebook.png',
                        onTap: () => print('Facebook was pressed'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin _facebookLogin = FacebookLogin();

  Stream<FirebaseUser> get onAuthStateChanged =>
      _firebaseAuth.onAuthStateChanged;

  Future<FirebaseUser> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  Future<FirebaseUser> signup(
      String username, String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  Future<FirebaseUser> signInWithGoogle() async {
    GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    if (googleAccount != null) {
      GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        AuthResult result = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        return result.user;
      } else {
        throw PlatformException(
          code: "ERROR_MISSING_GOOGLE_AUTH_TOKEN",
          message: "Missing google Auth token",
        );
      }
    } else {
      throw PlatformException(
        code: "ERROR_ABORTED_BY_USER",
        message: "Sign in aborted by user",
      );
    }
  }

  Future<FirebaseUser> signInWithFacebook() async {
    FacebookLoginResult result = await _facebookLogin
        .logInWithReadPermissions(['email', 'public_profile']);
    if (result != null) {
      AuthResult authResult = await _firebaseAuth.signInWithCredential(
        FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,
        ),
      );
      return authResult.user;
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'SignIn aborted by user',
      );
    }
  }

  Future<void> signOut() async {
    await _facebookLogin.logOut();
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  Future<void> sendVerificationEmail() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    await user.sendEmailVerification();
  }

  Future<void> sendPasswordResetEmail({@required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}

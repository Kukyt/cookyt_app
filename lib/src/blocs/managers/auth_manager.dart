import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookyt_app/src/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthManager {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _db = Firestore.instance;

  Future<void> login(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signup(String username, String email, String password) async {
    AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    String userId = authResult.user.uid;
    await _addUserToDb(uid: userId, username: username);
  }

  Future<void> logOut(context) async {
    await _firebaseAuth.signOut();
    Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  Future<bool> isLogged() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null;
  }

  Future<void> _addUserToDb({String username, String uid}) async {
    await _db.collection("users").document(uid).setData({
      "username": username,
    });
  }

  Future<bool> _usernameInUse({String username}) async {
    final result = await _db
        .collection("users")
        .where("username", isEqualTo: username)
        .getDocuments();
    return result.documents.isNotEmpty;
  }
}

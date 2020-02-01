import 'package:flutter/material.dart';

class User {
  final String uid;
  final String username;
  final String name;
  final String email;
  final String description;
  final String profilePhotoUrl;
  final int followers;
  final int following;
  final int recipes;

  User(
      {@required this.uid,
      @required this.username,
      @required this.name,
      this.email = "",
      this.description = "",
      this.profilePhotoUrl = "",
      this.followers = 0,
      this.following = 0,
      this.recipes = 0});
}

import 'package:flutter/material.dart';

class User {
  final String nickName;
  final String name;
  final String description;
  final String profilePhotoUrl;
  final int followers;
  final int following;
  final int recipes;

  User(
      {@required this.nickName,
      @required this.name,
      this.description,
      @required this.profilePhotoUrl,
      @required this.followers,
      @required this.following,
      @required this.recipes});
}

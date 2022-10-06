import 'dart:io';

import 'package:flutter/material.dart';

class UserModel {
  User user = User(id: "guest", name: "noname");

  UserModel() {
    _getUser();
  }

  bool isLogedIn() {
    return user.isGuest() ? false : true;
  }

  User _getUser() {
    _getSavedUserInfo();
    return user;
  }

  void _getSavedUserInfo() {
    // user = xxxx;
  }
}

class User {
  String id;
  String name;

  User({required this.id, required this.name});

  bool isGuest() {
    return id == 'guest' ? true : false;
  }
}

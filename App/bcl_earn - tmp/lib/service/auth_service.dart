import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  Stream<User> isLogin() {
    return FirebaseAuth.instance.userChanges();
  }
}

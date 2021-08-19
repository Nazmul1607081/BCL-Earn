import 'package:bcl_earn/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpService {
  Future<User> signUp(email, password) async {
    User user;
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      user = value.user;
    });
    return user;
  }

  Future<void> createUser(MyUser myUser) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(myUser.uid)
        .set(myUser.toMap());
  }
}

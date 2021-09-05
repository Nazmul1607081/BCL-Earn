import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  Future<UserCredential> login(email, password) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}

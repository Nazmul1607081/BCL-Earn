import 'package:bcl_earn/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  Stream<MyUser> getCurrentUserStream() {
    var stream = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .snapshots();
    return stream.map((event) => MyUser.toObj(event));
  }

  Stream<List<MyUser>> getAllUsers() {
    var stream = FirebaseFirestore.instance
        .collection('users')
        .orderBy('balance')
        .snapshots();
    return stream
        .map((event) => event.docs.map((e) => MyUser.toObj(e)).toList());
  }

  /*Future<MyUser> getCurrentUser() async {
    var user;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      user = MyUser.toObj(value);
    });
    return user;
  }*/

  Future updateUserBalance(int bal, MyUser user) async {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update(
        {'balance': user.balance + bal, 'dailyBonusDate': Timestamp.now()});
  }

  Future addRefer(String mobile, int bal) async {
    int returnCode = -1;
    FirebaseFirestore.instance
        .collection('users')
        .where('mobile', isEqualTo: mobile)
        .get()
        .then((qs) {
      if (qs.docs.length > 0) {
        var doc = qs.docs.first;

        FirebaseFirestore.instance
            .collection('users')
            .doc(doc.id)
            .get()
            .then((value) {
          var refUser = MyUser.toObj(value);
          FirebaseFirestore.instance.collection('users').doc(doc.id).update(
              {'refer': refUser.refer + 1, 'balance': refUser.balance + bal});
        });
      } else {
        returnCode = -1;
      }
    });

    return;
  }
}

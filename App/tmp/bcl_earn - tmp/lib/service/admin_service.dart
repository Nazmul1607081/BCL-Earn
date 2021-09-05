import 'package:bcl_earn/models/admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminService {
  Stream<MyAdmin> getAdmin() {
    var stream =
        FirebaseFirestore.instance.collection('admin').doc('admin').snapshots();
    return stream.map((event) => MyAdmin.toObj(event));
  }

  /*Future<MyAdmin> getAdmin2() async {
    var admin;
    await FirebaseFirestore.instance
        .collection('admin')
        .doc('admin')
        .get()
        .then((value) => admin = MyAdmin.toObj(value));
    return admin;
  }*/
}

import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/service/auth_service.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/widgets/inapp_webview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:bcl_earn/models/withdraw.dart';
import 'package:get/get.dart';

class MyWithdrawService {
  Future addToWithdraw(MyWithDraw myWithdraw) async {
    await FirebaseFirestore.instance
        .collection('withdraw')
        .add(myWithdraw.toMap());
  }

  Future cutBalance(amount, user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({'balance': user.balance - amount}).then((value) {
      /*UserService().getCurrentUser().then((user) {
        authController.myUser_.value = user;
      });*/
    });
  }

  Stream<List<MyWithDraw>> getWithdraws() {
    var stream = FirebaseFirestore.instance
        .collection('withdraw')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .limit(10)
        .snapshots();
    return stream.map((event) => event.docs
        .map((e) => MyWithDraw(
            e.data()['medium'],
            e.data()['number'],
            e.data()['amount'],
            e.data()['time'],
            e.data()['status'],
            e.data()['uid']))
        .toList());
  }
  /*Future<List<MyWithDraw>> getWithdraws() async {
    var stream = await FirebaseFirestore.instance
        .collection('withdraw')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .get();
    return stream.docs
        .map(
          (e) => MyWithDraw.toObj(e),
        )
        .toList();
  }*/
}

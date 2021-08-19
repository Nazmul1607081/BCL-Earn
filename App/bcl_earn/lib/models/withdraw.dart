import 'package:cloud_firestore/cloud_firestore.dart';

class MyWithDraw {
  final String medium;
  final int number;
  final int amount;
  final Timestamp time;
  final bool status;
  final String uid;

  MyWithDraw(
      this.medium, this.number, this.amount, this.time, this.status, this.uid);

  Map<String, dynamic> toMap() {
    return {
      'medium': medium,
      'number': number,
      'amount': amount,
      'time': time,
      'status': status,
      'uid': uid
    };
  }

  static MyWithDraw toObj(DocumentSnapshot documentSnapshot) {
    return MyWithDraw(
        documentSnapshot['medium'],
        documentSnapshot['number'],
        documentSnapshot['amount'],
        documentSnapshot['time'],
        documentSnapshot['status'],
        documentSnapshot['uid']);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Premium {
  final int amount;
  final String name;
  final String method;
  final String mobile;
  final String uid;
  final String country;
  final DateTime paymentDate;
  final String transactionNo;

  Premium(this.amount, this.name, this.method, this.mobile, this.uid,
      this.country, this.paymentDate, this.transactionNo);

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'name': name,
      'method': method,
      'mobile': mobile,
      'uid': uid,
      'country': country,
      'paymentDate': paymentDate,
      'transactionNo': transactionNo
    };
  }

  static Premium toObj(DocumentSnapshot documentSnapshot) {
    return Premium(
        documentSnapshot['amount'],
        documentSnapshot['name'],
        documentSnapshot['method'],
        documentSnapshot['mobile'],
        documentSnapshot['uid'],
        documentSnapshot['country'],
        DateTime.parse(documentSnapshot['dailyBonusDate'].toDate().toString()),
        documentSnapshot['transactionNo']);
  }
}

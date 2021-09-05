import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  final int balance;
  final String name;
  final String password;
  final String mobile;
  final String uid;
  final String country;
  final int refer;
  final DateTime LastDailyBonusDate;
  final String referralNumber;
  final String imageUrl;
  final int package;
  final int click;
  final String message;

  MyUser(
    this.balance,
    this.name,
    this.password,
    this.mobile,
    this.uid,
    this.country,
    this.refer,
    this.LastDailyBonusDate,
    this.referralNumber,
    this.imageUrl,
    this.package,
    this.click,
    this.message,
  );

  Map<String, dynamic> toMap() {
    return {
      'balance': balance,
      'name': name,
      'password': password,
      'mobile': mobile,
      'uid': uid,
      'country': country,
      'refer': refer,
      'LastDailyBonusDate': LastDailyBonusDate,
      'referralNumber': referralNumber,
      'imageUrl': imageUrl,
      'package': package,
      'click': click
    };
  }

  static MyUser toObj(DocumentSnapshot documentSnapshot) {
    String message = "";
    DateTime date;
    if (documentSnapshot.data().toString().contains('message')) {
      message = documentSnapshot['message'];
    }
    if (documentSnapshot['LastDailyBonusDate'] == null) {
      date = DateTime.now().subtract(Duration(days: 1));
    } else {
      date = DateTime.parse(
          documentSnapshot['LastDailyBonusDate'].toDate().toString());
    }
    return MyUser(
        documentSnapshot['balance'],
        documentSnapshot['name'],
        documentSnapshot['password'],
        documentSnapshot['mobile'],
        documentSnapshot['uid'],
        documentSnapshot['country'],
        documentSnapshot['refer'],
        date,
        documentSnapshot['referralNumber'],
        documentSnapshot['imageUrl'],
        documentSnapshot['package'],
        documentSnapshot['click'],
        message);
  }
}

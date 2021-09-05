import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  final int balance;
  final String name;
  final String password;
  final String mobile;
  final String uid;
  final String country;
  final int refer;
  final DateTime dailyBonusDate;
  final String referralNumber;
  final String image;
  final int package;
  final int click;
  final String message;
  final String device;

  MyUser(
    this.balance,
    this.name,
    this.password,
    this.mobile,
    this.uid,
    this.country,
    this.refer,
    this.dailyBonusDate,
    this.referralNumber,
    this.image,
    this.package,
    this.click,
    this.message,
    this.device,
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
      'dailyBonusDate': dailyBonusDate,
      'referralNumber': referralNumber,
      'image': image,
      'package': package,
      'click': click,
      'message': message,
      'device': device,
    };
  }

  static MyUser toObj(DocumentSnapshot documentSnapshot) {
    String message = "";
    if (documentSnapshot.data().toString().contains('message')) {
      message = documentSnapshot['message'];
    }
    return MyUser(
        documentSnapshot['balance'],
        documentSnapshot['name'],
        documentSnapshot['password'],
        documentSnapshot['mobile'],
        documentSnapshot['uid'],
        documentSnapshot['country'],
        documentSnapshot['refer'],
        DateTime.parse(documentSnapshot['dailyBonusDate'].toDate().toString()),
        documentSnapshot['referralNumber'],
        documentSnapshot['image'],
        documentSnapshot['package'],
        documentSnapshot['click'],
        message,
        documentSnapshot['device']);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class MyAdmin {
  final int totalTask;
  final int adTime;
  final int claimTime;
  final int claimPoint;
  final int dailyBonus;
  final int referralBonus;
  final int premiumPrice;
  final int click;
  final String notification;
  final String finalTask;
  final bool maintainMode;

  MyAdmin(
      this.totalTask,
      this.adTime,
      this.claimTime,
      this.dailyBonus,
      this.claimPoint,
      this.referralBonus,
      this.premiumPrice,
      this.click,
      this.notification,
      this.finalTask,
      this.maintainMode);

  Map<String, dynamic> toMap() {
    return {
      'totalTask': totalTask,
      'adTime': adTime,
      'claimTime': claimTime,
      'claimPoint': claimPoint,
      'dailyBonus': dailyBonus,
      'referralBonus': referralBonus,
      'premiumPrice': premiumPrice,
      'click': click,
      'notification': notification,
      'finalTask': finalTask,
      'maintainMode': maintainMode
    };
  }

  static MyAdmin toObj(DocumentSnapshot documentSnapshot) {
    return MyAdmin(
        documentSnapshot['totalTask'],
        documentSnapshot['adTime'],
        documentSnapshot['claimTime'],
        documentSnapshot['claimPoint'],
        documentSnapshot['dailyBonus'],
        documentSnapshot['referralBonus'],
        documentSnapshot['premiumPrice'],
        documentSnapshot['click'],
        documentSnapshot['notification'],
        documentSnapshot['finalTask'],
        documentSnapshot['maintain']);
  }

  /*static MyAdmin toObjFromQueryDocumentSnapshots(QueryDocumentSnapshot e) {
    return MyAdmin(
        e.data()['totalTask'],
        e.data()['adTime'],
        e.data()['claimTime'],
        e.data()['claimPoint'],
        e.data()['dailyBonus'],
        e.data()['referralBonus'],
        e.data()['premiumPrice'],
        e.data()['click'],
        e.data()['notification'],
        e.data()['finalTask'],
        e.data()['maintainMode']);
  }*/
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bcl_earn/models/premium.dart';

class PremiumService {
  Future addPayment(Premium premium) async {
    await FirebaseFirestore.instance
        .collection('payments')
        .doc(premium.uid)
        .set(premium.toMap());
  }
}

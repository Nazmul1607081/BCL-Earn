import 'package:bcl_earn/constants/payment_method.dart';
import 'package:bcl_earn/models/payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyPaymentService {
/*  Future<List<MyPayment>> getAllPaymentMethods() async {
    var docs = await FirebaseFirestore.instance.collection('methods').get();
    return docs.docs.map((e) => MyPayment.toObj(e)).toList();
  }*/

  Stream<List<MyPayment>> getAllPaymentMethods2() {
    var stream = FirebaseFirestore.instance.collection('methods').snapshots();
    return stream.map((event) => event.docs
        .map((e) =>
            MyPayment(e.data()['name'], e.data()['point'], e.data()['value']))
        .toList());
  }
}

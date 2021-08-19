import 'package:cloud_firestore/cloud_firestore.dart';

class MyPayment {
  final String name;
  final int point;
  final int value;

  MyPayment(this.name, this.point, this.value);

  Map<String, dynamic> toMap() {
    return {'name': name, 'point': point, 'value': value};
  }

  static MyPayment toObj(DocumentSnapshot documentSnapshot) {
    return MyPayment(documentSnapshot['name'], documentSnapshot['point'],
        documentSnapshot['value']);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class MyTask {
  final String url;
  final int time;
  final int sno;
  final String type;

  MyTask(this.url, this.time, this.sno, this.type);
  Map<String, dynamic> toMap() {
    return {'url': url, 'time': time, 'sno': sno, 'type': type};
  }

  static MyTask toObj(DocumentSnapshot documentSnapshot) {
    return MyTask(documentSnapshot['url'], documentSnapshot['time'],
        documentSnapshot['sno'], documentSnapshot['type']);
  }
}

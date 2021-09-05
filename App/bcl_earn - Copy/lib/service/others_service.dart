import 'package:bcl_earn/models/others.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OtherService {
  /*Future<String> getNotice(String doc) async {
    String notice = '';
    await FirebaseFirestore.instance
        .collection('others')
        .doc(doc)
        .get()
        .then((value) {
      notice = value.data()['$doc'];
    });
    return notice;
  }*/
  Stream<Others> getNoticeStream() {
    var stream = FirebaseFirestore.instance
        .collection('others')
        .doc('others')
        .snapshots();
    return stream.map((event) => Others.toObj(event));
  }
}

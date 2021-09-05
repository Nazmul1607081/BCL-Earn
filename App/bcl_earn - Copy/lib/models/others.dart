import 'package:cloud_firestore/cloud_firestore.dart';

class Others {
  final String tutorial;
  final String notice;
  final String support;
  final String about;

  Others(
    this.tutorial,
    this.notice,
    this.support,
    this.about,
  );
  Map<String, dynamic> toMap() {
    return {
      'tutorial': tutorial,
    };
  }

  static Others toObj(DocumentSnapshot documentSnapshot) {
    return Others(documentSnapshot['tutorial'], documentSnapshot['notice'],
        documentSnapshot['support'], documentSnapshot['about']);
  }
}

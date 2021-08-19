import 'package:bcl_earn/models/task.dart';
import 'package:bcl_earn/views/widgets/inapp_webview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskService {
  Stream<List<MyTask>> getAllTask() {
    var stream = FirebaseFirestore.instance
        .collection('tasks')
        .orderBy('sno')
        .snapshots();
    return stream.map((event) => event.docs
        .map((e) => MyTask(e.data()['url'], e.data()['time'], e.data()['sno'],
            e.data()['type']))
        .toList());
  }

/*  Future<List<MyTask>> getAllTask2() async {
    var stream = await FirebaseFirestore.instance
        .collection('tasks')
        .orderBy('sno')
        .get();
    return stream.docs
        .map(
          (e) => MyTask(e.data()['url'], e.data()['time'], e.data()['sno'],
              e.data()['type']),
        )
        .toList();
  }

  Future<List<Widget>> getAllViews() async {
    var stream = await FirebaseFirestore.instance.collection('tasks').get();
    return stream.docs
        .map(
          (e) => MyWebView(
            key: Key('${e.data()['url']}'),
            url: e.data()['url'],
          ),
        )
        .toList();
  }*/
}

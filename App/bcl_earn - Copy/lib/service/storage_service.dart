import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  Future<String> uploadFile(XFile xFile) async {
    String url = "";
    var ref = FirebaseStorage.instance.ref().child('images/${xFile.name}');
    var task = ref.putFile(File(xFile.path));
    await task.whenComplete(() async {
      print("File Uploaded");
      await ref.getDownloadURL().then((value) {
        url = value;
      });
    });
    return url;
  }
}

import 'package:bcl_earn/helper/device_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeviceService {
  Future<bool> checkDevice() async {
    bool isExist = false;

    await MyDeviceInfoHelper().getDeviceInfo().then((id) async {
      await FirebaseFirestore.instance.doc("devices/$id").get().then((doc) {
        isExist = doc.exists;
      });
    });

    return isExist;
  }

  Future addDevice(String mobile, String uid) async {
    await MyDeviceInfoHelper().getDeviceInfo().then((id) async {
      await FirebaseFirestore.instance.doc("devices/$id").set({
        'mobile': mobile,
        'uid': uid,
      });
    });
  }
}

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class MyDeviceInfoHelper {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  getDeviceInfo() async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print(androidInfo.androidId);
  }
}

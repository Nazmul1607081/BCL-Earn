import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class MyDeviceInfoHelper {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<String> getDeviceInfo() async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.id;
  }
}

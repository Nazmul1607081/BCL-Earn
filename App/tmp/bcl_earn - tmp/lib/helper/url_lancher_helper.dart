import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyUrlLauncher {
  static void launchURL(url) async => await canLaunch(url)
      ? await launch(url)
      : Get.showSnackbar(GetBar(
          messageText: MyText(
            label: "Fail to load",
            color: Colors.white,
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ));
}

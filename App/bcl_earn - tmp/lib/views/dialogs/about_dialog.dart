import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAboutDialog {
  showDialog(String content) {
    Get.dialog(AlertDialog(
      title: Text('About BCL Earn'),
      content: SingleChildScrollView(
        child: MyText(
          label: "$content",
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: MyText(
            label: "OK",
            fontWeight: FontWeight.bold,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ));
  }
}

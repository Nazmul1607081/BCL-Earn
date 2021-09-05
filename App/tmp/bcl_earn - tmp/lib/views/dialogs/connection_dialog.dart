import 'dart:io';

import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyConnectionDialog {
  static showDialog(data) {
    Get.dialog(AlertDialog(
      title: MyText(
        label: 'Connection Failed!',
        color: Colors.red,
        size: 25,
      ),
      content: MyText(
        label: "$data\nPlease Connect again",
      ),
      actions: <Widget>[
        TextButton(
          child: MyText(
            label: "OK",
            fontWeight: FontWeight.bold,
          ),
          onPressed: () {
            exit(0);
          },
        ),
      ],
    ));
  }
}

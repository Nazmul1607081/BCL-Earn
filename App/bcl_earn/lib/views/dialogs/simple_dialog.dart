import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySimpleDialog {
  final userController = Get.put(AuthController());
  showDialog() {
    Get.dialog(AlertDialog(
      title: Text('Daily Bonus'),
      content: MyText(
        label: "Do you want daily Bonus?",
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('NO'),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: MyText(
            label: "YES",
            fontWeight: FontWeight.bold,
          ),
          onPressed: () {
            Get.back();
            print(userController.myUser.name);
            userController.getDailyBalance();
          },
        ),
      ],
    ));
  }
}

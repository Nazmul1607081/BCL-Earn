import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/service/admin_service.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyNotificationDialog {
  showDialog() {
    Get.dialog(AlertDialog(
      title: MyText(
        label: 'Notifications!',
        size: 24,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: MyText(
                label: "${Get.find<AuthController>().myAdmin.notification}",
                size: 18,
              ),
            ),
          ],
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

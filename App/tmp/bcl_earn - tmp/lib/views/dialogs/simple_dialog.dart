import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/new/user_function.dart';
import 'package:bcl_earn/error/error.dart';
import 'package:bcl_earn/helper/date_difference.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/snackbar/success_bar.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySimpleDialog {
  static void dailyBonus(myUser, myAdmin) {
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

            UserFunctions.getDailyBonus(myUser, myAdmin);
          },
        ),
      ],
    ));
  }
}

import 'package:bcl_earn/helper/toast.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorHandler {
  static void handle(error) {
    switch (error) {
      case 'a':
        {
          // statements;
        }
        break;

      case 'constant_expr2':
        {
          //statements;
        }
        break;

      default:
        {
          print(error.runtimeType);
          if (error.runtimeType == FirebaseAuthException) {
            /*Get.showSnackbar(GetBar(
              messageText: MyText(
                label: ,
                color: Colors.white,
              ),
              duration: Duration(seconds: 4),
              backgroundColor: Colors.red,
            ));*/
            MyToast.fail(" " + error.toString().split(']')[1]);
          } else {
            /* Get.showSnackbar(GetBar(
              messageText: MyText(
                label: "Something Error:" + error.toString(),
                color: Colors.white,
              ),
              duration: Duration(seconds: 4),
              backgroundColor: Colors.red,
            ));*/
            MyToast.fail("Something Error:" + error.toString());
          }
        }

        break;
    }
  }
}

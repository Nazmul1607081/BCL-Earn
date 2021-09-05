import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/helper/toast.dart';
import 'package:bcl_earn/helper/url_lancher_helper.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyDeveloperDialog {
  final userController = Get.put(AuthController());
  showDialog() {
    Get.dialog(AlertDialog(
      title: Text('About Developer'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                MyText(
                  label: "Name: ",
                  color: Colors.green,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                Expanded(
                  child: MyText(
                    label: "Md. Nazmul Hasan",
                    color: Colors.black,
                    size: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            /*Row(
              children: [
                MyText(
                  label: "Number: ",
                  color: Colors.green,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                MyText(
                  label: "01404959603",
                  color: Colors.black,
                  size: 20,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),*/
            /*Row(
              children: [
                MyText(
                  label: "Email Address: ",
                  color: Colors.green,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: "nazmul81csekuet@gmail.com"));
                      MyToast.success("Copied");
                    },
                    child: MyText(
                      label: "nazmul81csekuet@gmail.com",
                      color: Colors.blueAccent,
                      size: 20,
                      fontWeight: FontWeight.normal,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),*/
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

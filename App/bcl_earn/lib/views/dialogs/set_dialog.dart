import 'package:bcl_earn/views/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySetDialog {
  final formKey = GlobalKey<FormState>();
  Future<void> showMyDialog(controller) async {
    Get.dialog(AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: ListBody(
            children: <Widget>[
              MyTextFormField(
                labelText: "Input Row Number",
                obscureText: false,
                isPass: false,
                onChange: (val) {
                  input = val;
                },
                validationMassage: 'Required',
              ),
              MyTextFormField(
                labelText: "Output Row Number",
                obscureText: false,
                isPass: false,
                onChange: (val) {
                  output = val;
                },
                validationMassage: 'Required',
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {},
        ),
      ],
    ));
  }

  String input = "";
  String output = "";
}

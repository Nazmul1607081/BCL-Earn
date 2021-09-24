import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/controllers/auth/signup_controller.dart';
import 'package:bcl_earn/views/widgets/form_field.dart';
import 'package:bcl_earn/views/widgets/login_button.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodeVerification extends StatelessWidget {
  CodeVerification({Key key}) : super(key: key);

  final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        centerTitle: true,
        title: MyText(
          label: MyStrings.appName,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              label: "Phone Number Verification",
              color: Colors.green,
              size: 30,
              textAlignment: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            MyTextFormField(
              controller: signUpController.smsCodeController,
              labelText: "Code",
              isPass: false,
              obscureText: false,
              onChange: () {},
            ),
            MyLoginButton(
              label: "OK",
              onClick: () {
                Get.back();
              },
              color: Colors.green,
              labelColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/images.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';

import 'package:bcl_earn/views/pages/signup/signup_page.dart';
import 'package:bcl_earn/views/widgets/form_field.dart';
import 'package:bcl_earn/views/widgets/login_button.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginCard extends StatelessWidget {
  final loginController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: Get.size.height / 16,
              ),
              Padding(
                padding: EdgeInsets.all(Get.size.height / 16),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Form(
                      key: loginController.formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.size.height / 16,
                          ),
                          MyTextFormField(
                            controller: loginController.mobileController,
                            labelText: 'Mobile Number',
                            onChange: (val) {},
                            obscureText: false,
                            isPass: false,
                            keyBoard: TextInputType.number,
                            validationMassage: "Mobile Number Required",
                          ),
                          MyTextFormField(
                            controller: loginController.passwordController,
                            labelText: 'Password',
                            onChange: (val) {},
                            obscureText: true,
                            isPass: true,
                            keyBoard: TextInputType.text,
                            validationMassage: "Password Required",
                          ),

                          ///button
                          Obx(() {
                            return (loginController.isLoading.value)
                                ? CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.red,
                                    ),
                                  )
                                : MyLoginButton(
                                    label: "LOGIN",
                                    onClick: () {
                                      loginController.login();
                                    },
                                    color: MyColors.appBarColor,
                                    labelColor: Colors.white,
                                  );
                          }),
                          InkWell(
                            onTap: () {
                              Get.to(() => MySignUpPage());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyText(
                                label: "Haven't an account?SignUp",
                                color: Colors.black,
                                size: 18.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          ///head
          Column(
            children: [
              SizedBox(
                height: Get.size.height / 16,
              ),
              Center(
                child: CircleAvatar(
                  radius: Get.height / 16 + 2,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: Get.height / 16,
                    backgroundImage: AssetImage(MyImages.loginPerson),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

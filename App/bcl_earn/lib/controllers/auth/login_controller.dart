import 'package:bcl_earn/error/error.dart';
import 'package:bcl_earn/root.dart';
import 'package:bcl_earn/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  login() {
    print(mobileController.text);
    isLoading.value = true;
    LoginService()
        .login(mobileController.text + '@gmail.com', passwordController.text)
        .then((user) {
      if (user.user != null) {
        isLoading.value = false;

        Get.to(() => MyRoot());
      }
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
      ErrorHandler.handle(e);
    });
  }

  @override
  void onClose() {
    mobileController.dispose();

    passwordController.dispose();
    super.onClose();
  }
}

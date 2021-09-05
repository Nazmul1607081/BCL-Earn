import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/error/error.dart';

import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/root.dart';
import 'package:bcl_earn/service/admin_service.dart';
import 'package:bcl_earn/service/auth_service.dart';
import 'package:bcl_earn/service/login_service.dart';
import 'package:bcl_earn/service/signup_service.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/pages/login/login_page.dart';
import 'package:bcl_earn/views/snackbar/success_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/helper/date_difference.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/helper/image_picker.dart';
import 'package:bcl_earn/service/storage_service.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final referralController = TextEditingController();
  String imageUrl = "";
  var image = "Upload Image".obs;
  XFile xFile;
  String country = "Bangladesh";
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  signUp() {
    isLoading.value = true;

    if (xFile == null) {
      SignUpService()
          .signUp(mobileController.text + "@gmail.com", passwordController.text)
          .then((user) {
        if (user != null) {
          var myUser = MyUser(
              0,
              nameController.text,
              passwordController.text,
              mobileController.text,
              user.uid,
              country,
              0,
              DateTime.now().subtract(Duration(days: 2)),
              mobileController.text,
              imageUrl,
              1,
              0,
              "");
          SignUpService().createUser(myUser).then((value) {
            isLoading.value = false;
            MySnackBar.show("Registration Successful");
            Get.to(() => MyLoginPage());
            if (referralController.text != null ||
                referralController.text != "") {
              UserService()
                  .addRefer(referralController.text,
                      Get.find<AuthController>().myAdmin.referralBonus)
                  .catchError((e) {
                MySnackBar.showFail("Refer Error :${e.toString()}");
              });
            }
          }).catchError((e) {
            isLoading.value = false;
            ErrorHandler.handle(e);
          });
        }
      }).catchError((e) {
        isLoading.value = false;
        ErrorHandler.handle(e);
      });
    } else {
      SignUpService()
          .signUp(mobileController.text + "@gmail.com", passwordController.text)
          .then((user) {
        if (user != null) {
          if (xFile != null) {
            image.value = xFile.name;
            StorageService().uploadFile(xFile).then((value) {
              imageUrl = value;
              var myUser = MyUser(
                  0,
                  nameController.text,
                  passwordController.text,
                  mobileController.text,
                  user.uid,
                  country,
                  0,
                  DateTime.now().subtract(Duration(days: 2)),
                  mobileController.text,
                  imageUrl,
                  1,
                  0,
                  "");
              SignUpService().createUser(myUser).then((value) {
                isLoading.value = false;

                MySnackBar.show("Registration Successful");
                Get.to(() => MyLoginPage());

                if (referralController.text != null ||
                    referralController.text != "") {
                  UserService()
                      .addRefer(referralController.text,
                          Get.find<AuthController>().myAdmin.referralBonus)
                      .catchError((e) {
                    MySnackBar.showFail("Refer Error :${e.toString()}");
                  });
                }
              }).catchError((e) {
                isLoading.value = false;
                ErrorHandler.handle(e);
              });
            }).catchError((e) {
              isLoading.value = false;
              ErrorHandler.handle(e);
            });
          }
        }
      }).catchError((e) {
        isLoading.value = false;
        ErrorHandler.handle(e);
      });
    }
  }

  imageUpload() {
    print("UPLOAD CLICK");
    MyImagePickerHelper().pickImageFromGallery().then((xfile) {
      if (xfile != null) {
        image.value = xfile.name;
        xFile = xfile;
      }
    }).catchError((e) {
      ErrorHandler.handle(e);
    });
  }

  @override
  void onClose() {
    confirmPasswordController.dispose();
    mobileController.dispose();
    referralController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

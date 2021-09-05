import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/images.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/error/error.dart';
import 'package:bcl_earn/helper/image_picker.dart';
import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/service/signup_service.dart';
import 'package:bcl_earn/service/storage_service.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/pages/login/login_page.dart';
import 'package:bcl_earn/views/snackbar/success_bar.dart';

import 'package:bcl_earn/views/widgets/country_picker.dart';
import 'package:bcl_earn/views/widgets/form_field.dart';
import 'package:bcl_earn/views/widgets/login_button.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/controllers/auth/signup_controller.dart';
import 'package:image_picker/image_picker.dart';

class SignUpCard extends StatefulWidget {
  @override
  _SignUpCardState createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  final formKeySignUp = GlobalKey<FormState>();
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
                      key: formKeySignUp,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.size.height / 16,
                          ),
                          MyTextFormField(
                            controller: nameController,
                            labelText: 'Name',
                            onChange: (val) {},
                            obscureText: false,
                            isPass: false,
                            keyBoard: TextInputType.name,
                            validationMassage: "Name Required",
                          ),
                          MyTextFormField(
                            controller: mobileController,
                            labelText: 'Mobile Number',
                            onChange: (val) {},
                            obscureText: false,
                            isPass: false,
                            keyBoard: TextInputType.number,
                            validationMassage: "Mobile Number Required",
                          ),
                          MyTextFormField(
                            controller: passwordController,
                            labelText: 'Create a Password',
                            onChange: (val) {},
                            obscureText: true,
                            isPass: true,
                            keyBoard: TextInputType.text,
                            validator: (String val) {
                              if (val.length < 8) {
                                return "Password at least 8 digit";
                              } else
                                return null;
                            },
                          ),
                          MyTextFormField(
                            controller: confirmPasswordController,
                            labelText: 'Confirm Password',
                            onChange: (val) {},
                            obscureText: true,
                            isPass: true,
                            validator: (String val) {
                              if (val != passwordController.text) {
                                return "Password is not Match";
                              } else
                                return null;
                            },
                          ),

                          MyTextFormField(
                            controller: referralController,
                            labelText: 'Referral Code',
                            onChange: (val) {},
                            obscureText: false,
                            isPass: false,
                            keyBoard: TextInputType.number,
                            validationMassage: null,
                          ),
                          MyCountryPicker(
                            onChange: (CountryCode countryCode) {
                              country = countryCode.name;
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(15),
                              child: InkWell(
                                onTap: () {
                                  imageUpload();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.file_upload),
                                    Obx(
                                      () => Expanded(
                                        child: MyText(
                                          label: '${image.value}',
                                          size: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                          ///button
                          Obx(() {
                            return (isLoading.value)
                                ? CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.red,
                                    ),
                                  )
                                : MyLoginButton(
                                    label: "SIGNUP",
                                    onClick: () {
                                      signUp();
                                    },
                                    color: MyColors.appBarColor,
                                    labelColor: Colors.white,
                                  );
                          }),
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

  signUp() {
    if (formKeySignUp.currentState.validate()) {
      isLoading.value = true;

      if (xFile == null) {
        SignUpService()
            .signUp(
                mobileController.text + "@gmail.com", passwordController.text)
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
            .signUp(
                mobileController.text + "@gmail.com", passwordController.text)
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
  void dispose() {
    confirmPasswordController.dispose();
    mobileController.dispose();
    referralController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

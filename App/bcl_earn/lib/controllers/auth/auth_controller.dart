import 'package:bcl_earn/error/error.dart';
import 'package:bcl_earn/models/admin.dart';
import 'package:bcl_earn/models/others.dart';
import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/root.dart';
import 'package:bcl_earn/service/admin_service.dart';
import 'package:bcl_earn/service/login_service.dart';
import 'package:bcl_earn/service/others_service.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/snackbar/success_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/helper/date_difference.dart';

class AuthController extends GetxController {
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  var allUser = <MyUser>[].obs;
  List<MyUser> get allUsers => allUser;

  Rx<MyUser> myUserRx = MyUser(
          -1,
          'Unknown',
          'Unknown',
          'Unknown',
          'Unknown',
          'Unknown',
          0,
          DateTime.now().subtract(Duration(days: 2)),
          "",
          "",
          1,
          0,
          "")
      .obs;
  MyUser get myUser => myUserRx.value;

  Rx<MyAdmin> _myAdmin =
      MyAdmin(-1, 5, 10, 20, 25, 20, 1000, 3, "Notification", "", false, "")
          .obs;
  MyAdmin get myAdmin => _myAdmin.value;

  Rx<Others> otherRX = Others("", "", "", "").obs;
  Others get other => otherRX.value;

  @override
  onInit() {
    otherRX.bindStream(OtherService().getNoticeStream());
    //allUser.bindStream(UserService().getAllUsers());
    if (FirebaseAuth.instance.currentUser != null) {
      //UserService().getCurrentUser().then((value) => myUserRx.value = value);
      myUserRx.bindStream(UserService().getCurrentUserStream());
    }
    _myAdmin.bindStream(AdminService().getAdmin());
    print(myUser.uid);
    print(myUser.name);
    /* MyStorage.init().then((value) => box = value);*/

    super.onInit();
  }

  getDailyBalance() {
    int val = DateDifference().days(myUser.LastDailyBonusDate);
    print('val');
    print(val);
    if (val != 0) {
      UserService()
          .updateUserBalance(myAdmin.dailyBonus * myUser.package, myUser)
          .then((value) {
        /* putData(
            FirebaseAuth.instance.currentUser.uid,
            getData(FirebaseAuth.instance.currentUser.uid) +
                myAdmin.dailyBonus * myUser.package);*/
        MySnackBar.show('Bonus Added Successfully');
      }).catchError((e) {
        ErrorHandler.handle(e);
      });
    } else {
      MySnackBar.showFail('Bonus Already taken');
    }
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

  /*var box;
  void putData(String uid, int balance) {
    if (box != null) {
      box.put(uid, balance);
    }
  }

  int getData(String uid) {
    return box.get(uid);
  }*/
}

/*class MyStorage {
  static Future init() async {
    return await Hive.openBox('balance');
  }
}*/

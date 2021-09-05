import 'package:bcl_earn/constants/payment_method.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/models/payment.dart';
import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/root.dart';
import 'package:bcl_earn/service/payment_service.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/snackbar/success_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/service/withdraw_service.dart';
import 'package:bcl_earn/models/withdraw.dart';

class MyWithDrawController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();

  var method = <MyPayment>[].obs;
  List<MyPayment> get methods => method;

  var medium = MyPayment("", 0, 0).obs;
  var amount = 0.obs;

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

  @override
  void onInit() {
    method.bindStream(MyPaymentService().getAllPaymentMethods2());
    if (FirebaseAuth.instance.currentUser != null) {
      //UserService().getCurrentUser().then((value) => myUserRx.value = value);
      myUserRx.bindStream(UserService().getCurrentUserStream());
    }
/*    MyStorage.init().then((value) => box = value);*/
    super.onInit();
  }

  onMediumChange(MyPayment myPayment) {
    medium.value = myPayment;
    amount.value = myPayment.point;
  }

  withdraw() {
    if (myUser.balance >= amount.value && amount.value > 0) {
      MyWithdrawService().cutBalance(amount.value, myUser).then((value) {
        MyWithdrawService()
            .addToWithdraw(MyWithDraw(
                medium.value.name,
                int.parse(mobileController.text),
                amount.value,
                Timestamp.now(),
                false,
                myUser.uid))
            .then((value) {
          MySnackBar.show("Withdraw Successful");

          /* putData(FirebaseAuth.instance.currentUser.uid,
              getData(FirebaseAuth.instance.currentUser.uid) + amount.value);*/
          Get.off(MyRoot());
        }).catchError((e) {
          MySnackBar.showFail(e.toString());
        });
      });
    } else {
      MySnackBar.showFail("Not Enough Balance or Something Error");
    }
  }

/*  var box;
  void putData(String uid, int balance) {
    if (box != null) {
      box.put(uid, balance);
    }
  }

  int getData(String uid) {
    return box.get(uid);
  }*/
}

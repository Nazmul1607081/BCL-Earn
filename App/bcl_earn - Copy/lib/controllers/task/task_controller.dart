import 'dart:async';
import 'dart:math';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/error/error.dart';
import 'package:bcl_earn/helper/toast.dart';
import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/service/invalid_click_service.dart';
import 'package:bcl_earn/views/snackbar/success_bar.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/models/admin.dart';
import 'package:bcl_earn/models/task.dart';
import 'package:bcl_earn/service/admin_service.dart';
import 'package:bcl_earn/service/task_service.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/ads/final_task.dart';

class TaskController extends GetxController {
  Rx<MyAdmin> _myAdmin =
      MyAdmin(-1, 5, 10, 20, 25, 20, 1000, 3, "Notification", "", true).obs;
  MyAdmin get myAdmin => _myAdmin.value;

  var completedTask = 0.obs;

  var isWebViewBottom = false.obs;
  var isTimeCompleted = false.obs;
  var timer = 0.obs;

  var tasks = <MyTask>[].obs;
  List<MyTask> get task => tasks;

  var views = <Widget>[].obs;
  List<Widget> get view => views;

  var isWebViewLoading = false.obs;
  var isEnd = false.obs;

  var url = "";

  var isInsideFinalTask = false.obs;

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
          "",
          "")
      .obs;
  MyUser get myUser => myUserRx.value;

  @override
  void onInit() {
    _myAdmin.bindStream(AdminService().getAdmin());
    tasks.bindStream(TaskService().getAllTask());
    if (FirebaseAuth.instance.currentUser != null) {
      //UserService().getCurrentUser().then((value) => myUserRx.value = value);
      myUserRx.bindStream(UserService().getCurrentUserStream());
    }
    /*AdminService().getAdmin2().then((admin) {
      _myAdmin.value = admin;
      TaskService().getAllTask2().then((value) {
        tasks.value = value;
        setTimer();
        setTime();
      });
    });*/

    super.onInit();
  }

  next() {
    if (completedTask.value + 1 >= min(myAdmin.totalTask, task.length) * 2) {
      print("OK");

      Get.off(() => MyFinalPage());
    } else {
      isEnd.value = false;
      completedTask.value++;
      //adController.showInterstitialAd();
      /*Future.delayed(Duration(seconds: 2)).then((value) => Navigator.push(
        Get.context, MaterialPageRoute(builder: (context) => MyTaskPage())));*/
      setTime();
      setTimer();
    }
  }

  setTimer() {
    var time;
    if (completedTask.value % 2 == 0) {
      time = task[completedTask.value ~/ 2].time;
    } else {
      print("OK");
      time = myAdmin.adTime; //should controlled changed two place
    }
    timer.value = time;
    Timer.periodic(Duration(seconds: 1), (t) {
      if (timer.value <= 1) {
        t.cancel();
      }

      timer.value--;
    });
  }

  setTime() {
    isTimeCompleted.value = false;
    isWebViewBottom.value = false;
    var time;
    if (completedTask.value % 2 == 0) {
      time = task[completedTask.value ~/ 2].time;
    } else {
      print("OK");
      time = myAdmin.adTime; //should controlled changed two place
    }
    Future.delayed(Duration(seconds: time)).then((value) {
      isTimeCompleted.value = true;
    });
  }

  Future<int> addToBalance() async {
    var code = -1;
    if (FirebaseAuth.instance.currentUser != null) {
      await UserService()
          .updateUserBalance(myAdmin.claimPoint * myUser.package, myUser)
          .then((value) async {
        code = 1;
        MySnackBar.show('Bonus Added Successfully');
      });
      return code;
    } else {
      return code;
    }
  }

  click() {
    print("INVALID CLICK");

    MyToast.fail("INVALID CLICK");
    ClickService().addToClick(myUser.click);
  }

  @override
  void onClose() {
    print("DISPOSE");
    super.onClose();
  }
}

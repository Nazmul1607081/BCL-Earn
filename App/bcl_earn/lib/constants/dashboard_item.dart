import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/helper/url_lancher_helper.dart';
import 'package:bcl_earn/models/admin.dart';
import 'package:bcl_earn/models/dashboard_item.dart';
import 'package:bcl_earn/service/admin_service.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/dialogs/simple_dialog.dart';
import 'package:bcl_earn/views/pages/history/history_page.dart';
import 'package:bcl_earn/views/pages/leaderboard/leaderboard_page.dart';
import 'package:bcl_earn/views/pages/profile/profile_page.dart';
import 'package:bcl_earn/views/pages/task/task_page.dart';
import 'package:bcl_earn/views/pages/withdraw/withdraw_page.dart';
import 'package:bcl_earn/views/snackbar/success_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/views/pages/package/package_page.dart';
import 'package:bcl_earn/views/pages/notice/notice_page.dart';
import 'package:bcl_earn/service/others_service.dart';

class DashBoardItems {
  MyAdmin myAdmin = Get.find<AuthController>().myAdmin;

  List<Item> items = [
    Item("Start Task", Icons.input, () {
      if (Get.find<AuthController>().myAdmin.click >=
          Get.find<AuthController>().myUser.click) {
        Get.to(() => MyTaskPage());
      } else {
        MySnackBar.showFail(
            "Your account currently disable for maximum invalid click");
      }
      //print(Get.find<AuthController>().myAdmin.totalTask);
    }),
    Item("Profile", Icons.person_rounded, () {
      Get.to(() => MyProfilePage());
    }),
    Item("Daily Bonus", Icons.wine_bar_rounded, () {
      if (Get.find<AuthController>().myAdmin.click >=
          Get.find<AuthController>().myUser.click) {
        MySimpleDialog().showDialog();
      } else {
        MySnackBar.showFail(
            "Your account currently disable for maximum invalid click");
      }
    }),
    /*Item("Leader Board", Icons.leaderboard, () {
      Get.to(() => MyLeaderBoard());
    }),*/
    Item("Withdraw", Icons.outbox, () {
      Get.to(() => MyWithdrawPage());
    }),
    Item("History", Icons.history, () {
      Get.to(() => MyHistoryPage());
    }),
    Item("Tutorial", Icons.stream, () {
      MyUrlLauncher.launchURL(Get.find<AuthController>().other.tutorial);
    }),
    Item("Premium", Icons.backpack_outlined, () {
      Get.to(() => MyPackagePage());
    }),
    Item("Notice", Icons.notification_important_outlined, () {
      Get.to(() => MyNoticePage());
    }),
    Item("Support", Icons.support, () {
      MyUrlLauncher.launchURL(Get.find<AuthController>().other.support);
    }),
  ];
}

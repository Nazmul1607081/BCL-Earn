import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/auth/root_controller.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/controllers/withdraw/withdraw_controller.dart';
import 'package:bcl_earn/views/dialogs/maintain.dart';
import 'package:bcl_earn/views/pages/dashboard/dashboard_page.dart';
import 'package:bcl_earn/views/pages/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:bcl_earn/views/dialogs/connection_dialog.dart';
import 'package:bcl_earn/views/widgets/connection_failed.dart';

class MyRoot extends StatefulWidget {
  @override
  _MyRootState createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  final rootController = Get.put(RootController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<RootController>(builder: (controller) {
      if (controller.connectionStatus.value != 'ok') {
        return ConnectionFailed(
          data: controller.connectionStatus.value,
        );
      } else if (controller.user == null) {
        return MyLoginPage();
      } else
        return MyDashBoardPage();
    });
  }
}

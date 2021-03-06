import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/controllers/auth/root_controller.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/root.dart';
import 'package:bcl_earn/views/dialogs/notification_dialoag.dart';
import 'package:bcl_earn/views/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySplashPage extends StatefulWidget {
  @override
  _MySplashPageState createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  void initState() {
    /*loadOpenAd();
    appOpenAd.onEvent.listen((e) => print(e));*/
    Future.delayed(Duration(seconds: 2)).then((value) {
      //MyNotificationDialog().showDialog();
      Get.off(() => MyRoot());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyLogo(),
      ),
      backgroundColor: MyColors.splashPageBackgroundColor,
    );
  }

/*  loadOpenAd() async {
    if (!appOpenAd.isAvailable) await appOpenAd.load();
    if (appOpenAd.isAvailable) {
      await appOpenAd.show();
      appOpenAd.load();
    }
  }*/
}

/*final AppOpenAd appOpenAd = AppOpenAd(
  unitId: ClientAd.openAd,
  timeout: Duration(seconds: 10),
)..load();*/

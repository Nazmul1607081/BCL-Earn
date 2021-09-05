import 'dart:async';
import 'dart:math';

import 'package:bcl_earn/ads/banner_ad.dart';
import 'package:bcl_earn/ads/native_ads.dart';
import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/task/lifecycle_observer.dart';
import 'package:bcl_earn/helper/toast.dart';
import 'package:bcl_earn/models/admin.dart';
import 'package:bcl_earn/models/task.dart';
import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/service/auth_service.dart';
import 'package:bcl_earn/service/task_service.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/pages/dashboard/dashboard_page.dart';
import 'package:bcl_earn/views/widgets/banner_ad.dart';

import 'package:bcl_earn/views/widgets/inapp_webview.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:bcl_earn/views/widgets/youtube_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/views/widgets/next_button.dart';

class MyTaskPage extends StatefulWidget {
  final MyAdmin admin;
  final MyUser user;

  const MyTaskPage({Key key, this.admin, this.user}) : super(key: key);

  @override
  _MyTaskPageState createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {
  @override
  void initState() {
    super.initState();

    var observer = LifecycleEventHandler(() {
      print(
          "pause=====================================================================================");
      return;
    }, () {
      print(
          "inactive==============================================================");
      return;
    }, () {
      print(
          "resume====================================================================================");
      return;
    }, () {
      print(
          "suspend====================================================================================");
      return;
    });
    WidgetsBinding.instance.addObserver(observer);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MyTask>>(
        stream: TaskService().getAllTask(),
        builder: (context, tasks) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: MyColors.appBarColor,
              title: MyText(
                label: MyStrings.task,
              ),
              centerTitle: true,
              actions: [
                Row(
                  children: [
                    Material(
                      elevation: 5,
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: MyText(
                          label: '}',
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: MyAd(),
            backgroundColor: MyColors.appBarColor,
            floatingActionButton: MyNextButton(
              onClick: () {},
            ),
            //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            body: Column(
              children: [
                MyAd(),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: MyText(
                      label: "",
                      color: Colors.white,
                      size: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                (12 % 2 == 0)
                    ? Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            child: MyWebView(
                              url: "",
                            ),
                          ),
                        ),
                      )
                    : NativeAds(),
              ],
            ),
          );
        });
  }
}

/*Container(
                      height: Get.size.height * .7,
                      child: ListView.builder(
                          itemCount: controller.task.length,
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              height: Get.size.height,
                              width: Get.width * .7,
                              color: Colors.white,
                              child: MyWebView(
                                key: GlobalKey(),
                                url: controller.task[index].url,
                              ),
                            );
                          }),
                    )*/

import 'dart:async';
import 'dart:math';

import 'package:bcl_earn/ads/banner_ad.dart';
import 'package:bcl_earn/ads/native_ads.dart';
import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/task/lifecycle_observer.dart';
import 'package:bcl_earn/helper/toast.dart';
import 'package:bcl_earn/service/auth_service.dart';
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
  @override
  _MyTaskPageState createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {
  final taskController = Get.put(TaskController());
  final authController = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    taskController.setTimer();
    taskController.setTime();

    var time = taskController.myAdmin.claimTime;
    var failToastShow = false;

    var observer = LifecycleEventHandler(() {
      if (taskController.isEnd.value) {
        Timer.periodic(Duration(seconds: 1), (t) {
          if (time % 2 == 0) {
            failToastShow = true;
            MyToast.showWait(time);
          }
          time--;
          if (time < 1 || !taskController.isEnd.value) {
            t.cancel();
          }
        });
      }
      print(
          "pause=====================================================================================");
      return;
    }, () {
      time = taskController.myAdmin.claimTime;

      print(
          "inactive==============================================================");
      return;
    }, () {
      if (time > 1) {
        taskController.isEnd.value = false;

        time = taskController.myAdmin.claimTime;

        if (failToastShow && taskController.isInsideFinalTask.value) {
          MyToast.fail(
              "You must wait for $time seconds to get point.\nAfter final task.");
        }

        taskController.isInsideFinalTask.value = false;

        print(
            "Fail================================================================= $time");
      } else {
        taskController.completedTask.value = 0;
        taskController.addToBalance().then((value) {
          /*if (value == 1) {
            UserService().getCurrentUser().then((user) {
              authController.myUserRx.value = user;
            });
          }*/
        });
        taskController.isEnd.value = false;

        MyToast.success("Congratulations");
        print(
            "passed================================================================= $time");
        Get.to(() => MyDashBoardPage());
      }
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        title: MyText(
          label: MyStrings.task,
        ),
        centerTitle: true,
        actions: [
          Obx(
            () => Row(
              children: [
                Material(
                  elevation: 5,
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: MyText(
                      label: '${taskController.timer.value}',
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyAd(),
      backgroundColor: MyColors.appBarColor,
      floatingActionButton: Obx(() {
        if (taskController.task.isNotEmpty) {
          if (taskController.completedTask.value % 2 == 0) {
            if (taskController
                    .task[taskController.completedTask.value ~/ 2].type ==
                'video') {
              if (taskController.isTimeCompleted.value) {
                return MyNextButton(
                  onClick: () {
                    taskController.next();
                  },
                );
              }
            } else {
              if (taskController.isWebViewBottom.value &&
                  taskController.isTimeCompleted.value) {
                return MyNextButton(
                  onClick: () {
                    taskController.next();
                  },
                );
              }
            }
          } else {
            if (taskController.isTimeCompleted.value) {
              return MyNextButton(
                onClick: () {
                  taskController.next();
                },
              );
            }
          }
        }

        return Container();
      }),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GetX<TaskController>(
        builder: (controller) {
          if ((taskController.task.isNotEmpty)) {
            return Column(
              children: [
                MyAd(),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: MyText(
                      label:
                          "${taskController.completedTask}/${min(taskController.myAdmin.totalTask, taskController.task.length) * 2 - 1}",
                      color: Colors.white,
                      size: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                (taskController.completedTask.value % 2 == 0)
                    ? Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            child: (taskController
                                        .task[taskController
                                                .completedTask.value ~/
                                            2]
                                        .type ==
                                    'video')
                                ? MyTube(
                                    link:
                                        '${controller.task[taskController.completedTask.value ~/ 2].url}',
                                  )
                                : MyWebView(
                                    url: controller
                                        .task[taskController
                                                .completedTask.value ~/
                                            2]
                                        .url,
                                  ),
                          ),
                        ),
                      )
                    : NativeAds(),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
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

import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/views/widgets/banner_ad.dart';
import 'package:bcl_earn/views/widgets/banner_ad2.dart';
import 'package:bcl_earn/views/widgets/inapp_webview.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFinalPage extends StatefulWidget {
  @override
  _MyFinalPageState createState() => _MyFinalPageState();
}

class _MyFinalPageState extends State<MyFinalPage> {
  final taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    taskController.isInsideFinalTask.value = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        title: MyText(
          label: MyStrings.task,
        ),
        centerTitle: true,
        actions: [
          /*IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Get.off(() => MyFinalPage());
              })*/
        ],
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            taskController.click();
          },
          child: MyAd()),
      backgroundColor: MyColors.appBarColor,
      body: Column(
        children: [
          MyAd(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: MyText(
                label: "Final Task",
                color: Colors.white,
                size: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey,
                        padding: EdgeInsets.all(10),
                        child: MyText(
                          label:
                              "নিউজের মাঝে বিজ্ঞাপনে ক্লিক করুন এবং ${taskController.myAdmin.claimTime} সেকেন্ড অপেক্ষা করুন। তাহলেই আপনার পয়েন্ট যুক্ত হবে ।",
                          color: Colors.white,
                          size: 20,
                          fontWeight: FontWeight.bold,
                          textAlignment: TextAlign.center,
                        ),
                      ),
                      Expanded(
                          child: Stack(
                        children: [
                          Obx(() => MyWebView(
                                url: taskController.myAdmin.finalTask,
                                //url: 'https://www.banglanews24.com/',
                              )),
                        ],
                      )),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

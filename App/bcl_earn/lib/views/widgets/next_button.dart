import 'dart:math';

import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyNextButton extends StatelessWidget {
  final onClick;
  final taskController = Get.put(TaskController());

  MyNextButton({Key key, this.onClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return /*InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Material(
              elevation: 4,
              color: MyColors.appBarColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: MyText(
                      label: "Next",
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )*/
        SizedBox(
      width: 100,
      child: FloatingActionButton(
        backgroundColor: MyColors.appBarColor,
        isExtended: true,
        onPressed: onClick,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Obx(() {
                  print(taskController.task.length * 2);
                  print(taskController.completedTask.value);
                  if (taskController.task.isNotEmpty) {
                    if (taskController.completedTask.value ==
                        min(taskController.myAdmin.totalTask,
                                    taskController.task.length) *
                                2 -
                            1) {
                      return MyText(
                        label: "Claim",
                        size: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      );
                    } else {
                      return MyText(
                        label: "Next",
                        size: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      );
                    }
                  } else {
                    return MyText(
                      label: "Next",
                      size: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    );
                  }
                }),
              ),
              Icon(
                Icons.skip_next_sharp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

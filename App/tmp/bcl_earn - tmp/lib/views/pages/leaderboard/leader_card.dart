import 'dart:math';

import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/views/pages/leaderboard/leader_row.dart';

class MyLeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*authController.allUser.sort((a, b) {
      if (a.balance == b.balance) {
        return a.refer.compareTo(b.refer);
      } else {
        return a.balance.compareTo(b.balance);
      }
    });*/

    return SingleChildScrollView(
      child: GetX<AuthController>(builder: (controller) {
        return Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: Get.size.height / 16,
                ),
                Padding(
                  padding: EdgeInsets.all(Get.size.height / 16),
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.size.height / 16,
                          ),
                          Table(
                            columnWidths: {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(4),
                              2: FlexColumnWidth(2),
                              3: FlexColumnWidth(2),
                            },
                            border: TableBorder.all(
                              width: 1.0,
                              color: Colors.black,
                            ),
                            children: [
                              MyTable.head(),
                              for (var i = 0;
                                  i < min(20, controller.allUser.length);
                                  i++)
                                MyTable.row(
                                    i + 1,
                                    controller.allUsers[
                                        controller.allUser.length - i - 1]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ///head
            Column(
              children: [
                SizedBox(
                  height: Get.size.height / 16,
                ),
                Center(
                  child: CircleAvatar(
                    radius: Get.height / 16 + 2,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: Get.height / 16,
                      child: Icon(
                        Icons.leaderboard_outlined,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

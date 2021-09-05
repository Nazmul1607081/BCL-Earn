import 'dart:math';

import 'package:bcl_earn/views/pages/leaderboard/leader_row.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/controllers/history/history_controller.dart';

class HistoryCard extends StatelessWidget {
  final historyController = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              /* SizedBox(
                height: Get.size.height / 16,
              ),*/
              Padding(
                padding: EdgeInsets.only(top: Get.size.height / 16),
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green,
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      historyController.filterAll();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: MyText(
                                        label: "All",
                                        color: Colors.white,
                                        size: 12,
                                        fontWeight: FontWeight.bold,
                                        textAlignment: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      historyController.filterUnpaid();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: MyText(
                                        label: "Pending",
                                        color: Colors.white,
                                        size: 12,
                                        fontWeight: FontWeight.bold,
                                        textAlignment: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      historyController.filterPaid();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: MyText(
                                        label: "Paid",
                                        color: Colors.white,
                                        size: 12,
                                        fontWeight: FontWeight.bold,
                                        textAlignment: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GetX<HistoryController>(builder: (controller) {
                          return Table(
                            columnWidths: {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(3),
                              2: FlexColumnWidth(2),
                              3: FlexColumnWidth(2),
                              4: FlexColumnWidth(2),
                              5: FlexColumnWidth(2),
                            },
                            /*border: TableBorder.all(
                              width: 1.0,
                              color: Colors.black,
                            ),*/
                            children: [
                              MyTable.headOfHistory(),
                              for (var i = 0;
                                  i < min(10, controller.histories.length);
                                  i++)
                                MyTable.rowOfHistory(
                                    i + 1, controller.histories[i]),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

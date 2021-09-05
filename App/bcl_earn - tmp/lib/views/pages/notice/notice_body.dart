import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyNoticeBody extends StatelessWidget {
  MyNoticeBody({Key key}) : super(key: key);

  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
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
                    //padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.size.height / 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: MyText(
                                label: "Notice",
                                size: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: MyText(
                            label: "${authController.other.notice}",
                            color: Colors.black,
                            size: 18,
                            fontWeight: FontWeight.bold,
                            textAlignment: TextAlign.justify,
                          ),
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
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Get.height / 16,
                    child: Icon(
                      Icons.notification_important,
                      size: 60,
                      color: Colors.black,
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

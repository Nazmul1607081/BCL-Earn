import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/images.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/views/widgets/profile_text.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCard extends StatelessWidget {
  final authController = Get.put(AuthController());
  final adminController = Get.put(TaskController());
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
                    padding: EdgeInsets.all(15),
                    child: GetX<AuthController>(builder: (controller) {
                      return Column(
                        children: [
                          SizedBox(
                            height: Get.size.height / 16,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: MyText(
                              label: controller.myUser.name,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          ProfileText(
                            data: "Mobile no: " +
                                controller.myUser.mobile.toString(),
                          ),
                          ProfileText(
                            data: "Balance: " +
                                controller.myUser.balance.toString(),
                          ),
                          ProfileText(
                            data: "Refer Code: " +
                                controller.myUser.mobile.toString(),
                          ),
                          ProfileText(
                            data:
                                "Refers: " + controller.myUser.refer.toString(),
                          ),
                          ProfileText(
                            data: "Invalid Click: " +
                                controller.myUser.click.toString() +
                                ' (${adminController.myAdmin.click})',
                          ),
                          ProfileText(
                            data: "Mobile no: " +
                                controller.myUser.mobile.toString(),
                          ),
                          ProfileText(
                            data: "Country: " +
                                controller.myUser.country.toString(),
                          ),
                          ProfileText(
                            data: (controller.myUser.package == 1)
                                ? "Free User"
                                : "Premium User",
                          ),
                        ],
                      );
                    }),
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
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: Get.height / 16,
                    //backgroundImage: AssetImage(MyImages.loginPerson),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(99999),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: (authController.myUser.image == "")
                            ? Image.asset(
                                MyImages.loginPerson,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: "${authController.myUser.image}",
                                placeholder: (context, url) => CircleAvatar(
                                    radius: Get.height / 16,
                                    backgroundImage:
                                        AssetImage(MyImages.loginPerson)),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                      ),
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

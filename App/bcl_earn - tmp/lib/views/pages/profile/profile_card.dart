import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/images.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/models/admin.dart';
import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/views/widgets/profile_text.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCard extends StatelessWidget {
  final MyAdmin admin;
  final MyUser user;

  const ProfileCard({Key key, this.admin, this.user}) : super(key: key);
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.size.height / 16,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: MyText(
                            label: user.name,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        ProfileText(
                          data: "Mobile no: " + user.mobile.toString(),
                        ),
                        ProfileText(
                          data: "Balance: " + user.balance.toString(),
                        ),
                        ProfileText(
                          data: "Refer Code: " + user.mobile.toString(),
                        ),
                        ProfileText(
                          data: "Refers: " + user.refer.toString(),
                        ),
                        ProfileText(
                          data: "Invalid Click: " +
                              user.click.toString() +
                              ' (${admin.click})',
                        ),
                        ProfileText(
                          data: "Mobile no: " + user.mobile.toString(),
                        ),
                        ProfileText(
                          data: "Country: " + user.country.toString(),
                        ),
                        ProfileText(
                          data: (user.package == 1)
                              ? "Free User"
                              : "Premium User",
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
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: Get.height / 16,
                    //backgroundImage: AssetImage(MyImages.loginPerson),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(99999),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: (user.image == "")
                            ? Image.asset(
                                MyImages.loginPerson,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: "${user.image}",
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

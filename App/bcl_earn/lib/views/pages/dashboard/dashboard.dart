import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/dashboard_item.dart';
import 'package:bcl_earn/constants/images.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/controllers/withdraw/withdraw_controller.dart';
import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/dialogs/maintain.dart';
import 'package:bcl_earn/views/dialogs/notification_dialoag.dart';
import 'package:bcl_earn/views/pages/dashboard/loading_name_card.dart';
import 'package:bcl_earn/views/pages/signup/mobile_varification.dart';
import 'package:bcl_earn/views/widgets/home_card.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bcl_earn/controllers/auth/signup_controller.dart';

class MyDashBoard extends StatefulWidget {
  @override
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      MyNotificationDialog().showDialog();
      //Get.to(() => CodeVerification());
      print('DIALOG');
    });

    super.initState();
  }

  final authController = Get.put(AuthController());
  final taskController = Get.put(TaskController());
  final withdrawController = Get.put(MyWithDrawController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authController.myAdmin.maintainMode) {
        return MainTaine();
      } else {
        return Column(
          children: [
            /*StreamBuilder<MyUser>(
            stream: UserService().getCurrentUserStream(),
            builder: (context, myUser) {
              if (myUser.data == null) {
                return LoadingNameCard();
              }
              return Material(
                elevation: 4,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                color: MyColors.appBarColor,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: CircleAvatar(
                          radius: Get.height / 16 + 2,
                          backgroundColor: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                //Get.height / 16,
                                9999999),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: (myUser.data.image == "")
                                  ? Image.asset(
                                      MyImages.loginPerson,
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: "${myUser.data.image}",
                                      placeholder: (context, url) =>
                                          CircleAvatar(
                                              radius: Get.height / 16,
                                              backgroundImage: AssetImage(
                                                  MyImages.loginPerson)),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            label: myUser.data.name,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            size: 20.0,
                          ),
                          MyText(
                            label: myUser.data.mobile,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            size: 16.0,
                          ),
                          (myUser.data.package == 1)
                              ? MyText(
                                  label: '(Free User)',
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  size: 16.0,
                                )
                              : MyText(
                                  label: '(Premium User)',
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                  size: 16.0,
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          MyText(
                            label: "Your Balance: ",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            size: 16.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.wallet_giftcard_outlined,
                                color: Colors.white,
                              ),
                              MyText(
                                label: '${myUser.data.balance}',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                size: 16.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              );
            }),*/
            GetX<AuthController>(builder: (myUser) {
              return Material(
                elevation: 4,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                color: MyColors.appBarColor,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: CircleAvatar(
                          radius: Get.height / 16 + 2,
                          backgroundColor: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                //Get.height / 16,
                                9999999),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: (myUser.myUser.imageUrl == "")
                                  ? Image.asset(
                                      MyImages.loginPerson,
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: "${myUser.myUser.imageUrl}",
                                      placeholder: (context, url) =>
                                          CircleAvatar(
                                              radius: Get.height / 16,
                                              backgroundImage: AssetImage(
                                                  MyImages.loginPerson)),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            label: myUser.myUser.name,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            size: 20.0,
                          ),
                          MyText(
                            label: myUser.myUser.mobile,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            size: 16.0,
                          ),
                          (myUser.myUser.package == 1)
                              ? MyText(
                                  label: '(Free User)',
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  size: 16.0,
                                )
                              : MyText(
                                  label: '(Premium User)',
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                  size: 16.0,
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          MyText(
                            label: "Your Balance: ",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            size: 16.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.wallet_giftcard_outlined,
                                color: Colors.white,
                              ),
                              MyText(
                                label: '${myUser.myUser.balance}',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                size: 16.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              );
            }),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                  child: GridView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: DashBoardItems().items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MyHomeCard(
                        label: DashBoardItems().items[index].label,
                        icon: DashBoardItems().items[index].icon,
                        onClick: DashBoardItems().items[index].onClick,
                      );
                    },
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 160,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: MyColors.appBarColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              height: Get.size.height / 16,
            ),
          ],
        );
      }
    });
  }
}

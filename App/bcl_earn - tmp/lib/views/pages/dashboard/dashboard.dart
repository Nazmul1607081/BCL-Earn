import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/dashboard_item.dart';
import 'package:bcl_earn/constants/images.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/new/admin_controller.dart';
import 'package:bcl_earn/controllers/new/user_function.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/models/admin.dart';
import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/service/admin_service.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/dialogs/simple_dialog.dart';
import 'package:bcl_earn/views/pages/dashboard/loading_name_card.dart';
import 'package:bcl_earn/views/pages/dashboard/name_card.dart';
import 'package:bcl_earn/views/pages/profile/profile_page.dart';
import 'package:bcl_earn/views/pages/task/task_page.dart';
import 'package:bcl_earn/views/snackbar/success_bar.dart';
import 'package:bcl_earn/views/widgets/home_card.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bcl_earn/controllers/auth/signup_controller.dart';

class MyDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MyUser>(
        stream: UserService().getCurrentUserStream(),
        builder: (context, myUser) {
          return Column(
            children: [
              (myUser.data != null)
                  ? NameCard(
                      myUser: myUser,
                    )
                  : LoadingNameCard(),
              StreamBuilder<MyAdmin>(
                  stream: AdminService().getAdmin(),
                  builder: (context, admin) {
                    return Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                          child: GridView(
                            padding: EdgeInsets.all(0),
                            children: [
                              MyHomeCard(
                                icon: Icons.input,
                                label: "Start Task",
                                onClick: () {
                                  if (admin.data == null ||
                                      myUser.data == null) {
                                    MySnackBar.showFail("Something Error");
                                  } else if (UserFunctions.checkClick(
                                      myUser.data, admin.data)) {
                                    Get.to(() => MyTaskPage());
                                  } else {
                                    MySnackBar.showFail(
                                        "Your account currently disable for maximum invalid click");
                                  }
                                },
                              ),
                              MyHomeCard(
                                icon: Icons.person_rounded,
                                label: "Profile",
                                onClick: () {
                                  if (admin.data == null ||
                                      myUser.data == null) {
                                    MySnackBar.showFail("Something Error");
                                  } else
                                    Get.to(() => MyProfilePage(
                                          admin: admin.data,
                                          user: myUser.data,
                                        ));
                                },
                              ),
                              MyHomeCard(
                                icon: Icons.wine_bar_rounded,
                                label: "Daily Bonus",
                                onClick: () {
                                  if (admin.data == null ||
                                      myUser.data == null) {
                                    MySnackBar.showFail("Something Error");
                                  } else if (UserFunctions.checkClick(
                                      myUser.data, admin.data)) {
                                    MySimpleDialog.dailyBonus(
                                        myUser.data, admin.data);
                                  } else {
                                    MySnackBar.showFail(
                                        "Your account currently disable for maximum invalid click");
                                  }
                                },
                              ),
                              MyHomeCard(
                                icon: Icons.leaderboard,
                                label: "Leader Board",
                                onClick: () {},
                              ),
                              MyHomeCard(
                                icon: Icons.person_rounded,
                                label: "Profile",
                                onClick: () {},
                              ),
                              MyHomeCard(
                                icon: Icons.outbox,
                                label: "Withdraw",
                                onClick: () {},
                              ),
                              MyHomeCard(
                                icon: Icons.history,
                                label: "History",
                                onClick: () {},
                              ),
                              MyHomeCard(
                                icon: Icons.stream,
                                label: "Tutorial",
                                onClick: () {},
                              ),
                              MyHomeCard(
                                icon: Icons.backpack_outlined,
                                label: "Premium",
                                onClick: () {},
                              ),
                              MyHomeCard(
                                icon: Icons.notification_important_outlined,
                                label: "Notice",
                                onClick: () {},
                              ),
                              MyHomeCard(
                                icon: Icons.support,
                                label: "Support",
                                onClick: () {},
                              ),
                            ],
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 160,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
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
        });
  }
}

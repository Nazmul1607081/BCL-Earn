import 'package:bcl_earn/ads/banner_ad.dart';
import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/helper/url_lancher_helper.dart';
import 'package:bcl_earn/root.dart';
import 'package:bcl_earn/service/others_service.dart';
import 'package:bcl_earn/views/dialogs/about_dialog.dart';
import 'package:bcl_earn/views/dialogs/developer_dialog.dart';
import 'package:bcl_earn/views/dialogs/simple_dialog.dart';
import 'package:bcl_earn/views/pages/withdraw/withdraw_page.dart';
import 'package:bcl_earn/views/widgets/banner_ad.dart';
import 'package:bcl_earn/views/widgets/home_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/views/widgets/drawer_button.dart';
import 'package:bcl_earn/views/pages/dashboard/dashboard_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.splashPageBackgroundColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                  child: Image(
                    image: AssetImage(MyStrings.logoUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                MyDrawerButton(
                  label: "Home",
                  icon: Icons.home,
                  onClick: () {
                    Get.to(() => MyDashBoardPage());
                  },
                ),
                MyDrawerButton(
                  label: "Withdraw",
                  icon: Icons.payment,
                  onClick: () {
                    Get.to(() => MyWithdrawPage());
                  },
                ),
                MyDrawerButton(
                  label: "About",
                  icon: Icons.person,
                  onClick: () {
                    MyAboutDialog()
                        .showDialog(Get.find<AuthController>().other.about);
                  },
                ),
                MyAd(),
                MyDrawerButton(
                  label: "Logout",
                  icon: Icons.logout,
                  onClick: () {
                    FirebaseAuth.instance
                        .signOut()
                        .then((value) => Get.to(() => MyRoot()));
                  },
                ),
                MyDrawerButton(
                  label: "About Developer",
                  icon: Icons.person,
                  onClick: () {
                    MyDeveloperDialog().showDialog();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

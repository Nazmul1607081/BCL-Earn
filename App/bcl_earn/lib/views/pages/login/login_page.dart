import 'package:bcl_earn/ads/banner_ad.dart';
import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/views/widgets/banner_ad.dart';

import 'package:bcl_earn/views/widgets/drawer.dart';
import 'package:bcl_earn/views/widgets/login_background.dart';
import 'package:bcl_earn/views/pages/dashboard/dashboard.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/views/pages/login/login_card.dart';

class MyLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        title: MyText(
          label: MyStrings.appName,
        ),
        centerTitle: true,
      ),
      //bottomNavigationBar: MyAd(),
      drawer: (FirebaseAuth.instance.currentUser == null) ? null : MyDrawer(),
      body: Stack(
        children: [
          LoginBackGround(),
          LoginCard(),
        ],
      ),
    );
  }
}

import 'package:bcl_earn/ads/banner_ad.dart';
import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/models/admin.dart';
import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/views/widgets/banner_ad.dart';
import 'package:bcl_earn/views/widgets/login_background.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:bcl_earn/views/pages/profile/profile_card.dart';

class MyProfilePage extends StatelessWidget {
  final MyAdmin admin;
  final MyUser user;

  const MyProfilePage({Key key, this.admin, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        title: MyText(
          label: MyStrings.profile,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: MyAd(),
      body: Stack(
        children: [
          LoginBackGround(),
          ProfileCard(
            admin: admin,
            user: user,
          ),
        ],
      ),
    );
  }
}

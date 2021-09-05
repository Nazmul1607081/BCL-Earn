import 'package:bcl_earn/ads/banner_ad.dart';
import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/views/pages/dashboard/dashboard.dart';
import 'package:bcl_earn/views/widgets/banner_ad.dart';
import 'package:bcl_earn/views/widgets/drawer.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/views/pages/package/package_body.dart';

class MyPackagePage extends StatelessWidget {
  const MyPackagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        title: MyText(
          label: MyStrings.appName,
        ),
        centerTitle: true,
        actions: [
          /*IconButton(
              icon: Icon(Icons.notification_important_rounded),
              onPressed: () {
                showNotification();
              })*/
        ],
      ),
      body: MyPackageBody(),
      bottomNavigationBar: MyAd(),
    );
  }
}

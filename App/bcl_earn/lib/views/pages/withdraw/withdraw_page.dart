import 'package:bcl_earn/ads/banner_ad.dart';
import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/views/widgets/banner_ad.dart';
import 'package:bcl_earn/views/widgets/login_background.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:bcl_earn/views/pages/withdraw/withdraw_card.dart';

class MyWithdrawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        title: MyText(
          label: MyStrings.withdraw,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: MyAd(),
      body: Stack(
        children: [LoginBackGround(), MyWithDrawCard()],
      ),
    );
  }
}

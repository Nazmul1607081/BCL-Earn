import 'package:bcl_earn/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginBackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: MyColors.appBarColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
          ),
          height: Get.size.height / 4,
        ),
        Container(
          decoration: BoxDecoration(
            color: MyColors.appBarColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
          ),
          height: Get.size.height / 10,
        ),
      ],
    );
  }
}

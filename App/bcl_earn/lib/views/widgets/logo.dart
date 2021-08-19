import 'package:bcl_earn/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height * .4,
      width: Get.size.width * .7,
      child: Image.asset(MyStrings.logoUrl),
    );
  }
}

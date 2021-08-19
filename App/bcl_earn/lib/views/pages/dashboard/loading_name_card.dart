import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/images.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingNameCard extends StatelessWidget {
  const LoadingNameCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      child: Image.asset(
                        MyImages.loginPerson,
                        fit: BoxFit.cover,
                      )),
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
                  label: '...',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  size: 20.0,
                ),
                MyText(
                  label: '...',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  size: 16.0,
                ),
                MyText(
                  label: '...',
                  color: Colors.green,
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
                      label: '...',
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
  }
}

import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/views/widgets/banner_ad.dart';
import 'package:bcl_earn/views/widgets/drawer.dart';
import 'package:bcl_earn/views/pages/dashboard/dashboard.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:bcl_earn/main.dart';
import 'package:get/get.dart';

class MyDashBoardPage extends StatefulWidget {
  @override
  _MyDashBoardPageState createState() => _MyDashBoardPageState();
}

class _MyDashBoardPageState extends State<MyDashBoardPage> {
  showNotification() {
    flutterLocalNotificationsPlugin.show(
        1,
        "BCL Earn",
        'Earn a lot of money',
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channel.description,
            importance: Importance.high,
            color: Colors.red,
          ),
        ));
  }

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    super.initState();
  }

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
      drawer: MyDrawer(),
      body: MyDashBoard(),
      bottomNavigationBar: MyAd(),
    );
  }
}

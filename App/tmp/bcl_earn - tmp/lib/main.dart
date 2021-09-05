import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/helper/device_info.dart';
import 'package:bcl_earn/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:bcl_earn/views/widgets/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as GoogleAdPackage;
import 'package:native_admob_flutter/native_admob_flutter.dart'
    as NativeAdPackage;

AndroidNotificationChannel channel = AndroidNotificationChannel(
    'bcl_earn', 'BCL Earn', "Earn a lot",
    playSound: true, importance: Importance.high);
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleAdPackage.MobileAds.instance.initialize();
  await NativeAdPackage.MobileAds.initialize();
  // This is my device id. Ad yours here
  //MobileAds.setTestDeviceIds(['9345804C1E5B8F0871DFE29CA0758842']);
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  /* for (int i = 1; i < 20; i++) {
    await FirebaseFirestore.instance
        .collection('tasks')
        .add(MyTask("https://www.google.com/", 3, i, 'news').toMap());
  }*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.signOut();
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: MyStrings.appName,
      home: MySplashPage(),
    );
  }
}

notification() {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // appOpenAd.show();
    return MaterialApp(
      title: 'Native Ads Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}*/

/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Init the controller
  final bannerController = BannerAdController();

  /// The banner height
  // double _bannerAdHeight = 0;

  @override
  void initState() {
    super.initState();
    bannerController.onEvent.listen((e) {
      final event = e.keys.first;
      // final info = e.values.first;
      switch (event) {
        case BannerAdEvent.loaded:
          // setState(() => _bannerAdHeight = (info as int)?.toDouble());
          break;
        default:
          break;
      }
    });
    bannerController.load();
  }

  @override
  void dispose() {
    bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text('Ads demo'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => Scaffold(
                    appBar: AppBar(title: Text('Native Ads')),
                    body: NativeAds(),
                  ),
                ));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [NativeAds(), BannerAds(), FullScreenAds()],
              ),
            ),
            BannerAd(controller: bannerController),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          child: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: 'Native Ads'),
              Tab(text: 'Banner Ads'),
              Tab(text: 'Full Screen Ads'),
            ],
          ),
        ),
      ),
    );
  }
}*/

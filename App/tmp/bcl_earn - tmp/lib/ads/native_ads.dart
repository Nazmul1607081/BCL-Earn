import 'package:bcl_earn/constants/ad.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class NativeAds extends StatefulWidget {
  const NativeAds({Key key}) : super(key: key);

  @override
  _NativeAdsState createState() => _NativeAdsState();
}

class _NativeAdsState extends State<NativeAds>
    with AutomaticKeepAliveClientMixin {
  Widget child;

  final controller = NativeAdController(unitId: ClientAd.nativeAd);

  @override
  void initState() {
    super.initState();
    controller.load(keywords: ['valorant', 'games', 'fortnite']);
    controller.onEvent.listen((event) {
      if (event.keys.first == NativeAdEvent.loaded) {
        //printAdDetails(controller);
      }
      if (event.keys.first == NativeAdEvent.leftApplication) {
        printAdDetails(controller);
        print('outside...............');
        //taskController.click();
      }
      print('event.keys.first..............................');
      print(event.keys.first);
      if (mounted) {
        setState(() {});
      }
    });
  }

  void printAdDetails(NativeAdController controller) async {
    /// Just for showcasing the ability to access
    /// NativeAd's details via its controller.
    print("------- NATIVE AD DETAILS: -------");
    print(controller.headline);
    print(controller.body);
    print(controller.price);
    print(controller.store);
    print(controller.callToAction);
    print(controller.advertiser);
    print(controller.iconUri);
    print(controller.imagesUri);
  }

  @override
  void dispose() {
    //controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (child != null) return child;
    return RefreshIndicator(
      onRefresh: () async {
        setState(() => child = SizedBox());
        // await controller.load(force: true);
        await Future.delayed(Duration(milliseconds: 20));
        setState(() => child = null);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            child: NativeAd(
              controller: controller,
              height: Get.height * .65,
              unitId: ClientAd.nativeAd,
              builder: (context, child) {
                return Material(
                  elevation: 8,
                  child: child,
                );
              },
              buildLayout: mediumAdTemplateLayoutBuilder,
              // buildLayout: fullBuilder,
              loading: Text('loading'),
              error: Text('error'),
              icon: AdImageView(size: Get.height * .1),
              headline: AdTextView(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 1,
              ),
              body: AdTextView(
                  style: TextStyle(color: Colors.black), maxLines: 1),
              media: AdMediaView(
                height: Get.height * .4,
                width: MATCH_PARENT,
              ),
              attribution: AdTextView(
                width: WRAP_CONTENT,
                text: 'Ad',
                decoration: AdDecoration(
                  border: BorderSide(color: Colors.green, width: 2),
                  borderRadius: AdBorderRadius.all(16.0),
                ),
                style: TextStyle(color: Colors.green),
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
              ),
              button: AdButtonView(
                elevation: 18,
                decoration: AdDecoration(backgroundColor: Colors.blue),
                height: MATCH_PARENT,
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

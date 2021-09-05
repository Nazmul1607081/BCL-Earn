import 'package:bcl_earn/constants/ad.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/models/task.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/controllers/admob/ad_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const String testDevice = 'YOUR_DEVICE_ID';
const int maxFailedLoadAttempts = 3;

class MyAd2 extends StatefulWidget {
  @override
  _MyAd2State createState() => _MyAd2State();
}

class _MyAd2State extends State<MyAd2> {
  bool showRefresh = false;
  final taskController = Get.put(TaskController());

  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  @override
  void initState() {
    print("AD INIT PAGE");
    super.initState();
  }

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: AdSize.mediumRectangle,
      request: request,
      adUnitId: ClientAd.bannerAd,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd;
            showRefresh = false;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          setState(() {
            showRefresh = true;
          });
          ad.dispose();
        },
        onAdOpened: (Ad ad) {
          print('$BannerAd onAdOpened.');
          print('clicked');
          showRefresh = false;
          taskController.isEnd.value = true;
        },
        onAdClosed: (Ad ad) {
          print('$BannerAd onAdClosed.');
          showRefresh = false;
        },
      ),
    );
    return banner.load();
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredBanner?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        child: Builder(builder: (BuildContext context) {
          if (!_loadingAnchoredBanner) {
            _loadingAnchoredBanner = true;
            _createAnchoredBanner(context);
          }
          if (_anchoredBanner != null) {
            return Container(
              color: Colors.transparent,
              //width: _anchoredBanner.size.width.toDouble(),
              //height: _anchoredBanner.size.height.toDouble(),
              child: AdWidget(ad: _anchoredBanner),
            );
          } else {
            return Container(
              child: Column(
                children: [
                  (showRefresh)
                      ? IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            setState(() {
                              _loadingAnchoredBanner = false;
                            });
                          })
                      : Container(),
                  MyText(
                    label: "Loading...",
                    color: Colors.black,
                    size: 20,
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

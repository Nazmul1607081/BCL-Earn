import 'package:bcl_earn/constants/ad.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/controllers/admob/ad_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyAd extends StatefulWidget {
  @override
  _MyAdState createState() => _MyAdState();
}

class _MyAdState extends State<MyAd> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd _anchoredBanner;
  bool _loadingAnchoredBanner = false;
  final taskController = Get.put(TaskController());

  @override
  void initState() {
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
      size: size,
      request: request,
      adUnitId: ClientAd.bannerAd,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) {
          print('$BannerAd onAdOpened.');
          print('clicked');
          taskController.click();
        },
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
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
    return Builder(builder: (BuildContext context) {
      if (!_loadingAnchoredBanner) {
        _loadingAnchoredBanner = true;
        _createAnchoredBanner(context);
      }
      if (_anchoredBanner != null) {
        return Container(
          color: Colors.transparent,
          width: _anchoredBanner.size.width.toDouble(),
          height: _anchoredBanner.size.height.toDouble(),
          child: AdWidget(ad: _anchoredBanner),
        );
      } else {
        return Container(
          height: 0,
          width: 0,
          color: Colors.transparent,
        );
      }
    });
  }
}

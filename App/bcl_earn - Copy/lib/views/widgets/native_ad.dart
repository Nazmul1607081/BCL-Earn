import 'package:bcl_earn/constants/ad.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyNativeAd extends StatefulWidget {
  @override
  _MyNativeAdState createState() => _MyNativeAdState();
}

class _MyNativeAdState extends State<MyNativeAd> {
  NativeAd _nativeAd;
  bool _loadingNativeAd = false;

  Future<void> _createNativeAd(BuildContext context) async {
    final NativeAd myNative = NativeAd(
      adUnitId: MyAdMob.testNativeAd,
      factoryId: 'adFactoryExample',
      request: AdRequest(),
      listener: NativeAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) {
          setState(() {
            _nativeAd = ad as NativeAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => print('Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) => print('Ad impression.'),
        // Called when a click is recorded for a NativeAd.
        onNativeAdClicked: (NativeAd ad) => print('Ad clicked.'),
      ),
    );
    return myNative.load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          child: Builder(builder: (BuildContext context) {
            if (!_loadingNativeAd) {
              _loadingNativeAd = true;
              _createNativeAd(context);
            }
            if (_nativeAd != null) {
              return Container(
                color: Colors.green,
                child: AdWidget(ad: _nativeAd),
              );
            } else {
              return Container(
                height: 0,
                width: 0,
                color: Colors.green,
              );
            }
          }),
        ),
      ),
    );
  }
}

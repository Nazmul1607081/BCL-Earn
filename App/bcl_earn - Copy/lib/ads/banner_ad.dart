import 'package:bcl_earn/constants/ad.dart';
import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class BannerAds extends StatefulWidget {
  const BannerAds({Key key}) : super(key: key);

  @override
  _BannerAdsState createState() => _BannerAdsState();
}

class _BannerAdsState extends State<BannerAds>
    with AutomaticKeepAliveClientMixin {
  Widget child;
  BannerAdController _bannerAdController;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (child != null) return child;
    return RefreshIndicator(
      onRefresh: () async {
        setState(() => child = SizedBox());
        await Future.delayed(Duration(milliseconds: 20));
        setState(() => child = null);
      },
      child: BannerAd(
        unitId: ClientAd.bannerAd,
        builder: (context, child) {
          return InkWell(
            onTap: () {
              print("BANNER AD TAPPED");
            },
            child: Container(
              color: Colors.white,
              child: child,
            ),
          );
        },
        loading: Text('loading'),
        error: Text('error'),
        size: BannerSize.ADAPTIVE,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

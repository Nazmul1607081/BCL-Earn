import 'package:bcl_earn/constants/ad.dart';
import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

final AppOpenAd appOpenAd = AppOpenAd(
  unitId: ClientAd.openAd,
  timeout: Duration(seconds: 10),
)..load();

class MyOpenAd extends StatefulWidget {
  const MyOpenAd({Key key}) : super(key: key);

  @override
  _MyOpenAdState createState() => _MyOpenAdState();
}

class _MyOpenAdState extends State<MyOpenAd> {
  @override
  void initState() {
    appOpenAd.onEvent.listen((e) => print(e));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await appOpenAd.load(force: true);
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          TextButton(
            child: Text('Show App Open Ad'),
            onLongPress: () => appOpenAd.load(force: true),
            onPressed: () async {
              if (!appOpenAd.isAvailable) await appOpenAd.load();
              if (appOpenAd.isAvailable) {
                await appOpenAd.show();
                appOpenAd.load();
              }
            },
          ),
        ],
      ),
    );
  }
}

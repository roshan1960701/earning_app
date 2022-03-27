import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({Key? key}) : super(key: key);

  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {

  late BannerAd myBanner;
  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner..show();
          }
        });
  }

  BannerAd buildLargeBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-2574344020320147/2961368352',
        size: AdSize.largeBanner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner
              ..show(
                  anchorType: AnchorType.top,
                  anchorOffset: MediaQuery.of(context).size.height * 0.15);
          }
        });
  }


  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId:'ca-app-pub-2574344020320147/2961368352');
    myBanner = buildLargeBannerAd()..load();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text('BannerAd Page'),
            ),
            /*Container(
              child: Image.network('$myBanner'),
            )*/


          ],
        ),
      ),

    ));
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }
}

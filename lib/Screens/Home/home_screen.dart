import 'dart:math';

import 'package:earning_app/Screens/AddPage/addPage_screen.dart';
import 'package:earning_app/Screens/Banner/banner_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late InterstitialAd myInterstitial;

  InterstitialAd buildInterstitialAd() {
    return InterstitialAd(
      adUnitId: 'ca-app-pub-2574344020320147/6142937607',
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.failedToLoad) {
          myInterstitial..load();
        } else if (event == MobileAdEvent.closed) {
          myInterstitial = buildInterstitialAd()..load();
        }
        print(event);
      },
    );
  }

  void showInterstitialAd() {
    myInterstitial..show();
  }

  void showRandomInterstitialAd() async{
    Random r = new Random();
    bool value = r.nextBool();

    if (value == true) {
      myInterstitial..show();
    }
  }

  @override
  void initState() {
    super.initState();

    myInterstitial = buildInterstitialAd()..load();
  }

  Future<bool> onWillPop()async{
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: SafeArea(child: Scaffold(
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                child: Text('BannerAd'),
                onPressed: () async{
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const BannerScreen()));
                },
              ),

              RaisedButton(
                child: Text('InterstitialAd'),
                onPressed: () async{
                  showInterstitialAd();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ADDPageScreen()));
                },
              ),
          /*RaisedButton(
              child: Text('InterstitialAd'),
              onPressed: () {

              //showRandomInterstitialAd();
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ADDPageScreen()),
              )});*/
            ],
          ),
        ),
      )), );
  }

    @override
    void dispose() {
    myInterstitial.dispose();

    super.dispose();
    }

  }

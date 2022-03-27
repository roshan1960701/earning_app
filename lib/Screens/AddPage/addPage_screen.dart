import 'package:flutter/material.dart';

class ADDPageScreen extends StatefulWidget {
  const ADDPageScreen({Key? key}) : super(key: key);

  @override
  _ADDPageScreenState createState() => _ADDPageScreenState();
}

class _ADDPageScreenState extends State<ADDPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('InterstitialAd Page'),
      ),
    );
  }
}

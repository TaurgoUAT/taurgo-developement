import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/onBoardingPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnboardingPage())));

    //   var assetsImage = const AssetImage(
    //     '/assets/Logos/AllGreen.png'); //<- Creates an object that fetches an image.
    var image = Image.asset('assets/logo/Taurgo Logo.png',
        height: 250,
        fit: BoxFit.scaleDown); //<- Creates a widget that displays an image.

    return MaterialApp(
        home: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splash-screen-background.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 130.0, left: 26.0), // Adjust padding as needed
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Bring Properties To Life',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, right: 30.0), // Adjust padding as needed
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/circle-logo.png',
                    width: 170, // Adjust the width as needed
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/house.png',
              width: 370, // Adjust the width as needed
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ));
  }
}

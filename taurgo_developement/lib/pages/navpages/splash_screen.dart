import 'package:flutter/material.dart';

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
    return Scaffold(
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
    );
  }
}

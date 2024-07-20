import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var image = Image.asset('assets/logo/Taurgo Logo.png',
        height: 250,
        fit: BoxFit.scaleDown); //<- Creates a widget that displays an image.

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: bWhite),
          child: Center(
            child: image,
          ),
        ),
      ),
    );
  }
}

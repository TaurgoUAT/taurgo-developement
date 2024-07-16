import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/landingPage.dart';
import 'package:taurgo_developement/pages/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taurgo',
      // home: const LandingPage(),
      home: const Homepage(),
    );
  }
}


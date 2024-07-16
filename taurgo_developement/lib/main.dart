import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/home1.dart';
// import 'package:taurgo_developement/pages/landingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home1(),
    );
  }
}

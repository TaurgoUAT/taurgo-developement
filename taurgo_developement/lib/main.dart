import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/landingPage.dart';
import 'package:taurgo_developement/pages/loginPage.dart';
import 'package:taurgo_developement/pages/registerPage';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(),
    );
  }
}

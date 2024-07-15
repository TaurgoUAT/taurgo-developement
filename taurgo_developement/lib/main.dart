import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/account_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set home to AccountPage for testing
    return MaterialApp(
      title: 'Flutter Demo',
      home:
          AccountScreen(), // Change this to LandingPage or AccountPage as needed
    );
  }
}

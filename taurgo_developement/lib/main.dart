import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taurgo_developement/controllers/authController.dart';
import 'package:taurgo_developement/pages/authentication/signInPage.dart';
import 'package:taurgo_developement/pages/authentication/signUpPage.dart';
import 'package:taurgo_developement/pages/landingPage.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Taurgo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: bWhite, // Set the default background color to white
        appBarTheme: AppBarTheme(

          backgroundColor: bWhite, // Set the default AppBar background color to white
          iconTheme: IconThemeData(color: kPrimaryColor), // Set the default icon color
          // textTheme: TextTheme(
          //   headline6: TextStyle(
          //     color: kPrimaryTextColour, // Set the default text color
          //     fontSize: 16,
          //     fontWeight: FontWeight.w500,
          //     fontFamily: "Inter",
          //   ),
          // ),
        ),
      ),
      home: const LandingPage(),
      // home: const Homepage(),
    );
  }
}

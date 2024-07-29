import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taurgo_developement/controllers/authController.dart';
import 'package:taurgo_developement/pages/landingPage.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taurgo_developement/services/mogo_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await MongoDatabase.connect();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Taurgo',
      theme: ThemeData(
        scaffoldBackgroundColor: bWhite,
        appBarTheme: AppBarTheme(
          backgroundColor: bWhite,
          iconTheme:
              IconThemeData(color: kPrimaryColor),
        ),
      ),
      home: const LandingPage(),
      // home: const Homepage(),
    );
  }
}

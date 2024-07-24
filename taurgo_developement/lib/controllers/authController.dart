import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/landingPage.dart';
import 'package:taurgo_developement/pages/navpages/homePage.dart';
import 'package:taurgo_developement/pages/onBoardingPage.dart';
import 'package:taurgo_developement/pages/splashScreen.dart';

class AuthController extends GetxController {
  //Where should I need this Auth Controller
  //
  /**
   * SignUp Page,
   * LogIn Page,
   * Landing Page,
   * Account Page
   */

  //Instance of Auth Controller Class
  static AuthController instance = Get.find();

  //Email, Password, UserName
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //user Would be Notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("LogIn Page");
      Get.offAll(() => SplashScreen());
    } else {
      print("Home Page");
      //TODO: Have to check whether I can navigate from saplash screen to
      // welcome Page
      Get.offAll(() => Homepage());
    }
  }

  void registerUser(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User Message",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          titleText: Text("Account Creation failed",
              style: TextStyle(color: Colors.white)),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void logInUser(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "User Message",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          titleText: Text("User LogIn is failed",
              style: TextStyle(color: Colors.redAccent)),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}

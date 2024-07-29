import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/authentication/Widgets/SignUpButton.dart';
import 'package:taurgo_developement/widgets/AppWelcomeText.dart';
import 'package:taurgo_developement/pages/authentication/signInPage.dart';
import 'package:taurgo_developement/pages/authentication/signUpPage.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/bottom_nav_bar.dart';

import 'package:taurgo_developement/pages/authentication/Widgets/signInButton.dart';

import 'package:taurgo_developement/pages/authentication/Widgets/SignInBoard.dart';

import 'package:taurgo_developement/pages/authentication/Widgets/SignUpButton.dart';

import 'package:taurgo_developement/pages/authentication/Widgets/SignUpBoard'
    '.dart';
import 'package:taurgo_developement/pages/navpages/changePasswordComponent'
    '/update_button.dart';
import 'package:taurgo_developement/pages/navpages/changePasswordComponent'
    '/change_password_input.dart';

// settings_page.dart
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/accountPage.dart';
import 'package:taurgo_developement/pages/navpages/homePage.dart';
import 'package:taurgo_developement/pages/navpages/propertyPage.dart';
import 'package:taurgo_developement/pages/navpages/imagePage.dart';
import 'package:taurgo_developement/widgets/bottom_nav_bar.dart';

import '../../controllers/authController.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var image =
      Image.asset('assets/logo/logo.png', height: 250, fit: BoxFit.scaleDown);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: bWhite,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, right: 20),
                child: Center(
                  child: image,
                ),
              ),
              Center(
                child: SignUpCard(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(
                    color: kPrimaryColor, // Hint text color
                    fontSize: 14,
                  ),
                  suffixIcon:
                      Icon(Icons.perm_identity_rounded, color: kPrimaryColor),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                // obscureText: true,
              ),
              SizedBox(height: 30), // Increased spacing

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: kPrimaryColor, // Hint text color
                    fontSize: 14,
                  ),
                  suffixIcon: Icon(Icons.email_outlined, color: kPrimaryColor),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                // obscureText: true,
              ),
              SizedBox(height: 30), // Increased spacing
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: kPrimaryColor, // Hint text color
                    fontSize: 14,
                  ),
                  suffixIcon: Icon(Icons.lock_outline, color: kPrimaryColor),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                obscureText: true,
              ),
              SizedBox(height: 30), // Increased spacing

              TextField(
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(
                    color: kPrimaryColor, // Hint text color
                    fontSize: 14,
                  ),
                  suffixIcon: Icon(Icons.lock_outline, color: kPrimaryColor),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                obscureText: true,
              ),

              SizedBox(height: 70),
              GestureDetector(
                onTap: () {
                  AuthController.instance.registerUser(
                      emailController.text.trim(),
                      passwordController.text.trim());
                },
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      AuthController.instance.registerUser(
                          emailController.text.trim(),
                          passwordController.text.trim());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 10),
                      child: Text('Sign Up', style: TextStyle(fontSize: 18)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: RichText(
                text: TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    children: [
                      TextSpan(
                          text: " Sign In",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(() => SignInPage())),
                    ]),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

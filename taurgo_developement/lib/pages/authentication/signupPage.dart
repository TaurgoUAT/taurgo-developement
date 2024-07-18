import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/authentication/Widgets/SignUpButton.dart';
import 'package:taurgo_developement/widgets/AppWelcomeText.dart';
import 'package:taurgo_developement/pages/authentication/signinPage.dart';
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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var image =
      Image.asset('assets/logo/logo.png', height: 250, fit: BoxFit.scaleDown);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ChangePasswordInput(
                label: 'Full Name',
                icon: Icons.perm_identity_rounded,
              ),
              SizedBox(height: 30), // Increased spacing

              ChangePasswordInput(
                label: 'Email Address',
                icon: Icons.mail_outline,
              ),
              SizedBox(height: 30), // Increased spacing
              ChangePasswordInput(
                label: 'Password',
                icon: Icons.lock_outline,
              ),
              SizedBox(height: 30), // Increased spacing

              ChangePasswordInput(
                label: 'Confirm Password',
                icon: Icons.lock_outline,
              ),

              SizedBox(height: 70),
              SignUpButton(),
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

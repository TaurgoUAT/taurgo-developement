import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/widgets/AppWelcomeText.dart';
import 'package:taurgo_developement/pages/authentication/signInPage.dart';
import 'package:taurgo_developement/pages/authentication/signUpPage.dart';

import 'package:flutter/cupertino.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var image = Image.asset('assets/logo/Taurgo Logo.png',
        height: 250, fit: BoxFit.scaleDown);

    var textLogo = Image.asset('assets/logo/textLogo.png',
        height: 40,
        fit: BoxFit.scaleDown); //<- Creates a widget that displays an image.
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      color: bWhite,
      child: Column(
        children: [
          //Main Logo
          Container(
            margin: const EdgeInsets.only(top: 100, right: 20),
            child: Center(
              child: image,
            ),
          ),

          //Text Logo
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Center(
              child: textLogo,
            ),
          ),

          //Moto
          Container(
            width: double.infinity, // Set the width to fit the entire width
            height: 48,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.center, // Align the text to the center
              child: Text(
                "Bringing Properties to Life",
                style: TextStyle(
                  fontSize: 24,
                  color: kSecondaryTextColour,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                ),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 200, left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
              child: Container(
                child: GestureDetector(
                  child: Container(
                      width: 288,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: kPrimaryColor,
                        // boxShadow: [
                        //   BoxShadow(
                        //       blurRadius: 10,
                        //       spreadRadius: 7,
                        //       offset: Offset(1, 1),
                        //       color: Colors.grey.withOpacity(0.3))
                        // ]
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 16, color: bWhite, fontFamily: "Inter"),
                        ),
                      )),
                ),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Container(
                child: GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => SignUpPage()));
                  // },
                  child: Container(
                      width: 288,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: bWhite,
                        border: Border.all(
                          color: kPrimaryColor, // Replace with your desired
                          // border color
                          width: 2.0, // Adjust the border width as needed
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //       blurRadius: 10,
                        //       spreadRadius: 7,
                        //       offset: Offset(1, 1),
                        //       color: Colors.grey.withOpacity(0.3))
                        // ]
                      ),
                      child: Center(
                        child: Text(
                          "Create an Account",
                          style: TextStyle(
                              fontSize: 16,
                              color: kPrimaryColor,
                              fontFamily: "Inter"),
                        ),
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

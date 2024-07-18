import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/bottom_nav_bar.dart';
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

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  int currentTab = 0;

  final List<Widget> pages = [
    HomePage(),
    ProperyPage(),
    Imagepage(),
    AccountPage(),
  ];

  void onTabSelected(int index) {
    setState(() {
      Navigator.of(context).pop(); // Return to the previous page when a tab is selected
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
        centerTitle: true,
        backgroundColor: bWhite,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_outline,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: bWhite,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 70.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChangePasswordInput(
                label: 'Current Password',
                icon: Icons.lock_outline,
              ),
              SizedBox(height: 50), // Increased spacing
              ChangePasswordInput(
                label: 'New Password',
                icon: Icons.lock_outline,
              ),
              SizedBox(height: 50), // Increased spacing
              ChangePasswordInput(
                label: 'Confirm Password',
                icon: Icons.lock_outline,
              ),
              SizedBox(height: 70),
              UpdateButton(),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   shape: CircleBorder(),
      //   backgroundColor: kPrimaryColor,
      //   foregroundColor: Colors.white,
      //   child: Icon(
      //     Icons.add,
      //     size: 48,
      //   ),
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: CustomBottomNavBar(
      //   currentTab: currentTab,
      //   onTabSelected: onTabSelected,
      // ),// Assuming you have a BottomNavBar widget
    );
  }
}
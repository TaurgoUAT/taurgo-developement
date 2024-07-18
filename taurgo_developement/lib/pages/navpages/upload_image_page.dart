import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/propertyPageComponents/uploadImageButton.dart';
import 'package:taurgo_developement/pages/navpages/propertyPageComponents'
    '/propertyDetails.dart';
import 'package:taurgo_developement/pages/navpages/propertyPageComponents'
    '/propertyImageCarousal.dart';

import 'package:taurgo_developement/pages/navpages/propertyPageComponents'
    '/shareButton.dart';
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

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({super.key});

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
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
          'Properties',
          style: TextStyle(
            fontSize: 18,
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
              Icons.home_outlined,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: Text(
      //     'Properties',
      //     style: TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w500,
      //       fontFamily: "Inter",
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: bWhite,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: kPrimaryColor),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.home,
      //         color: kPrimaryColor,
      //       ),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            UploadImagesButton(),
            SizedBox(height: 16),
            PropertyImageCarousel(),
            SizedBox(height: 16),
            PropertyDetails(),
            SizedBox(height: 32),
            ShareButton(),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        child: Icon(
          Icons.add,
          size: 48,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        currentTab: currentTab,
        onTabSelected: onTabSelected,
      ),
    );
  }
}

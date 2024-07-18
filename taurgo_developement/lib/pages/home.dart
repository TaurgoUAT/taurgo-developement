import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/accountPage.dart';
import 'package:taurgo_developement/pages/navpages/homePage.dart';
import 'package:taurgo_developement/pages/navpages/imagePage.dart';
import 'package:taurgo_developement/pages/navpages/propertyPage.dart';
import 'package:taurgo_developement/widgets/bottom_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentTab = 0;
  final List<Widget> pages = [
    HomePage(),
    ProperyPage(),
    Imagepage(),
    AccountPage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: isKeyboardVisible
          ? null
          : FloatingActionButton(
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
        onTabSelected: (int index) {
          setState(() {
            currentTab = index;
            currentScreen = pages[index];
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/navpages/accountPage.dart';
import 'package:taurgo_developement/pages/navpages/homePage.dart';
import 'package:taurgo_developement/pages/navpages/imagePage.dart';
import 'package:taurgo_developement/pages/navpages/propertyPage.dart';
import 'package:taurgo_developement/widgets/bottom_nav_bar.dart';
import 'package:taurgo_developement/widgets/custom_floating_action_button.dart';

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
      floatingActionButton:
          CustomFloatingActionButton(isVisible: !isKeyboardVisible),
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

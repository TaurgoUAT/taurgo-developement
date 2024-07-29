import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/navpages/accountPage.dart';
import 'package:taurgo_developement/pages/navpages/homePage.dart';
import 'package:taurgo_developement/pages/navpages/imagePage.dart';
import 'package:taurgo_developement/pages/navpages/propertyPage.dart';
import 'package:taurgo_developement/widgets/bottom_nav_bar.dart';
import 'package:taurgo_developement/widgets/custom_floating_action_button.dart';

class Homepage extends StatefulWidget {
  final List<Widget> pages;
  final int initialTab;

  const Homepage({
    Key? key,
    this.pages = const [
      HomePage(),
      ProperyPage(
        imagePath: 'assets/images/prop-img.png',
        address: '123 Sample Street',
        areaCode: '12345',
        postalCode: '54321',
      ),
      Imagepage(),
      AccountPage()
    ],
    this.initialTab = 0,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late int currentTab;
  late Widget currentScreen;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    currentTab = widget.initialTab;
    currentScreen = widget.pages[currentTab];
  }

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
            currentScreen = widget.pages[index];
          });
        },
      ),
    );
  }
}

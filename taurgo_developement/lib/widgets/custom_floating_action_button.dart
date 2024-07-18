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

class _HomepageState extends State<Homepage> with WidgetsBindingObserver {
  int currentTab = 0;
  final List<Widget> pages = [
    HomePage(),
    ProperyPage(),
    Imagepage(),
    AccountPage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = HomePage();
  double bottomPadding =
      16.0; // Initial bottom padding for FloatingActionButton

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      bottomPadding = bottomInset > 0 ? bottomInset + 16.0 : 16.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: AnimatedPadding(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.add,
            size: 48,
          ),
          onPressed: () {},
        ),
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

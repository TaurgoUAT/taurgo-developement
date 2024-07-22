import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/accountPage.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/bottom_nav_bar.dart';
import 'package:taurgo_developement/pages/2DPicturePage.dart';
import 'package:taurgo_developement/pages/navpages/homePage.dart';
import 'package:taurgo_developement/pages/navpages/imagePage.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
import 'package:taurgo_developement/pages/navpages/propertyPage.dart';
import 'package:taurgo_developement/pages/2DPicturePage.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/custom_floating_action_button.dart';

class FolderContentsPage extends StatefulWidget {
  final String folderName;

  const FolderContentsPage({
    super.key,
    this.folderName = 'Default Folder Name',
  });

  @override
  State<FolderContentsPage> createState() => _FolderContentsPageState();
}

class _FolderContentsPageState extends State<FolderContentsPage> {
  int currentTab = 0;
  final List<Widget> pages = [
    HomePage(),
    ProperyPage(
      imagePath: 'assets/images/prop-img.png',
      address: '123 Sample Street',
      areaCode: '12345',
      postalCode: '54321',
    ),
    Imagepage(),
    AccountPage()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Tours',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
        centerTitle: true,
        backgroundColor: bWhite,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Homepage()), // Replace Homepage with your home page widget
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                'assets/logo/Taurgo Logo.png'), // Path to your company icon
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: bWhite,
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Center(child: SearchBarSection()),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Completed Properties',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.folderName,
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Picture2DImage(
                                        subfolderName: '2D Picture'),
                                  ),
                                );
                              },
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(Icons.image_outlined,
                                      size: 50.0, color: kPrimaryColor),
                                  Text('2D Picture'),
                                ],
                              ),
                            ),
                            InkWell(
                              // onTap: () {
                              //   // Action for folder 3
                              // },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(Icons.touch_app,
                                      size: 50.0, color: kPrimaryColor),
                                  Text('360 Virtual Tour'),
                                ],
                              ),
                            ),
                            InkWell(
                              // onTap: () {
                              //   // Action for folder 4
                              // },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(Icons.next_plan,
                                      size: 50.0, color: kPrimaryColor),
                                  Text('Floor Plan'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton:
              CustomFloatingActionButton(isVisible: !isKeyboardVisible),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomNavBar(
            currentTab: currentTab,
            onTabSelected: (int index) {
              setState(() {
                currentTab = index;
                currentScreen = pages[index];
              });
            },
          ),
        ),
      ),
    );
  }
}

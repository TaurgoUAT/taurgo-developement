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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo/Taurgo Logo.png'),
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
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,
                          fontFamily: "Inter",),
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
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Picture2DImage(
                                        subfolderName: 'Folder 1'),
                                  ),
                                );
                              },
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(Icons.folder,
                                      size: 50.0, color: kAccentColor),
                                  Text('Folder 1'),
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
                                  Icon(Icons.folder,
                                      size: 50.0, color: kAccentColor),
                                  Text('Folder 3'),
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
                                  Icon(Icons.folder,
                                      size: 50.0, color: kAccentColor),
                                  Text('Folder 4'),
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
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/accountPage.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/bottom_nav_bar.dart';
import 'package:taurgo_developement/pages/navpages/folder/2DPicture.dart';
import 'package:taurgo_developement/pages/navpages/homePage.dart';
import 'package:taurgo_developement/pages/navpages/imagePage.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
import 'package:taurgo_developement/pages/navpages/propertyPage.dart';

class Folder1ContentsPage extends StatefulWidget {
  final String folderName;
  const Folder1ContentsPage({
    super.key,
    this.folderName = 'Default Folder Name',
  });

  @override
  State<Folder1ContentsPage> createState() => _Folder1ContentsPageState();
}

class _Folder1ContentsPageState extends State<Folder1ContentsPage> {
  int currentTab = 0;
  final List<Widget> pages = [
    Home1(),
    ProperyPage(),
    Imagepage(),
    AccountPage()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home1();
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: <Widget>[
                Center(child: SearchBarSection()),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Completed Properties',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Folder1ContentsPage(
                              //         // folderName: 'Your Folder Name'
                              //         ),
                              //   ),
                              // );
                            },
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.folder,
                                    size: 50.0, color: kAccentColor),
                                Text('2D Picture 1'),
                              ],
                            ),
                          ),
                          const InkWell(
                            // onTap: () {
                            //   // Action for folder 2
                            // },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.folder,
                                    size: 50.0, color: kAccentColor),
                                Text('2D Picture 2'),
                              ],
                            ),
                          ),
                          const InkWell(
                            // onTap: () {
                            //   // Action for folder 3
                            // },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.folder,
                                    size: 50.0, color: kAccentColor),
                                Text('2D Picture 3'),
                              ],
                            ),
                          ),
                          const InkWell(
                            // onTap: () {
                            //   // Action for folder 4
                            // },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.folder,
                                    size: 50.0, color: kAccentColor),
                                Text('2D Picture 4'),
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
          floatingActionButton: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: kPrimaryColor, // Change to your desired color
            foregroundColor: Colors.white,
            child: Icon(
              Icons.add,
              size: 48,
            ),
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: kPrimaryColor,
            height: 68,
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Home1();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: currentTab == 0
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.6),
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: currentTab == 0
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.6),
                              ),
                            )
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = ProperyPage();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.list_alt_rounded,
                              color: currentTab == 1
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.6),
                            ),
                            Text(
                              'Properties',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: currentTab == 1
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.6),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Imagepage();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: currentTab == 2
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.6),
                            ),
                            Text(
                              'Image',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: currentTab == 2
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.6),
                              ),
                            )
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = AccountPage();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: currentTab == 3
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.6),
                            ),
                            Text(
                              'Account',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: currentTab == 3
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.6),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

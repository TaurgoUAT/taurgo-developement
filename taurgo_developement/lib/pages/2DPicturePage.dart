import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/accountPage.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/bottom_nav_bar.dart';
import 'package:taurgo_developement/pages/navpages/homePage.dart';
import 'package:taurgo_developement/pages/navpages/imagePage.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
import 'package:taurgo_developement/pages/navpages/propertyPage.dart';
import 'package:taurgo_developement/widgets/bottom_nav_bar.dart';

class Picture2DImage extends StatefulWidget {
  final String subfolderName;
  const Picture2DImage({
    super.key,
    this.subfolderName = 'Default Folder Name',
  });

  @override
  State<Picture2DImage> createState() => _Picture2DImageState();
}

class _Picture2DImageState extends State<Picture2DImage> {
  // int currentTab = 0;
  // final List<Widget> pages = [
  //   HomePage(),
  //   ProperyPage(),
  //   Imagepage(),
  //   AccountPage()
  // ];
  final PageStorageBucket bucket = PageStorageBucket();
  // Widget currentScreen = HomePage();
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
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,
                            fontFamily: "Inter",),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30.0),
                    //   child: Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       widget.folderName,
                    //       style: TextStyle(
                    //         color: kPrimaryColor,
                    //         fontSize: 15,
                    //         fontWeight: FontWeight.normal,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.subfolderName,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: ClipRRect(
                        // padding: const EdgeInsets.all(16.0),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                            bottom: Radius.circular(20.0)),
                        child: Image.asset(
                          "assets/images/prop-img.png",
                          width: double.infinity,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              // ),
              // floatingActionButton: FloatingActionButton(
              //   shape: CircleBorder(),
              //   backgroundColor: kPrimaryColor, // Change to your desired color
              //   foregroundColor: Colors.white,
              //   child: Icon(
              //     Icons.add,
              //     size: 48,
              //   ),
              //   onPressed: () {},
              // ),
              // floatingActionButtonLocation:
              // FloatingActionButtonLocation.centerDocked,
              // bottomNavigationBar: CustomBottomNavBar(
              //   currentTab: currentTab,
              //   onTabSelected: (index) {
              //     setState(() {
              //       currentScreen = pages[
              //       index]; // Ensure you have a list of pages as in the original code
              //       currentTab = index;
              //     });
              //   },
              // ),
            ))
    )
    );
  }
}
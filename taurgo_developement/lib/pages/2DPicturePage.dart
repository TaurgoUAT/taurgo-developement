import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';

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
                  padding: const EdgeInsets.all(16.0),
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
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                            ),
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
                ))));
  }
}

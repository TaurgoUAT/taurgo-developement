import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/FolderContentsPage.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';

class HomePage extends StatefulWidget {
  final String folderName;

  const HomePage({super.key,
    this.folderName = 'Default Folder Name',
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
              MaterialPageRoute(builder: (context) => Homepage()), // Replace
              // HomePage with your home page widget
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo/Taurgo Logo.png'), // Path to your company icon
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
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
                const TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  unselectedLabelColor: kPrimaryColor,
                  labelColor: kPrimaryColor,
                  unselectedLabelStyle: const TextStyle(fontSize: 13),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  tabs: const [
                    Tab(
                      child: Text(
                        'All Tours',
                        style: TextStyle(
                          fontSize: 9.0, // Set your desired font size here
                          color: kPrimaryColor, // Optionally, set the text color
                        ),
                      ),
                    ),

                    Tab(
                      child: Text(
                        'Your Tours',
                        style: TextStyle(
                          fontSize: 9.0, // Set your desired font size here
                          color: kPrimaryColor, // Optionally, set the text color
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Taurgo Tours',
                        style: TextStyle(
                          fontSize: 9.0, // Set your desired font size here
                          color: kPrimaryColor, // Optionally, set the text color
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Hybrid Tours',
                        style: TextStyle(
                          fontSize: 9.0, // Set your desired font size here
                          color: kPrimaryColor, // Optionally, set the text color
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
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
                                      builder: (context) => FolderContentsPage(
                                          folderName: 'Folder 1'),
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
                              const InkWell(
                                // onTap: () {
                                //   // Action for folder 2
                                // },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(Icons.folder,
                                        size: 50.0, color: kAccentColor),
                                    Text('Folder 2'),
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
                      Center(child: Text('Your Tours')),
                      Center(child: Text('Taurgo Tours')),
                      Center(child: Text('Taurgo Tours')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
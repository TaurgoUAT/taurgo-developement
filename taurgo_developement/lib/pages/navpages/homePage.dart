import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/bottom_nav_bar.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('My Tour', style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter",
        ),),

        centerTitle: true,
        backgroundColor: bWhite,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
              'assets/logo/Taurgo Logo.png'), // Path to your company icon
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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: kLightPrimaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                    height: 10), // Adds space between search bar and text

                const Padding(
                  padding: EdgeInsets.only(
                      left: 30.0), // Adjust the padding as needed
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Completed Properties',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold, // Set the font size to 20
                      ),
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
                    fontSize: 13,
                  ),
                  tabs: const [
                    Tab(
                      text: 'All Tours',
                    ),
                    Tab(
                      text: 'Your Tours',
                    ),
                    Tab(
                      text: 'Taurgo Tours',
                    ),
                    Tab(
                      text: 'Taurgo Tours',
                    ),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                // onTap: () {
                                //   // Action for folder 1
                                // },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(Icons.folder,
                                        size: 50.0, color: kAccentColor),
                                    Text('Folder 1'), // Folder name added
                                  ],
                                ),
                              ),
                              InkWell(
                                // onTap: () {
                                //   // Action for folder 2
                                // },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(Icons.folder,
                                        size: 50.0, color: kAccentColor),
                                    Text('Folder 2'), // Folder name added
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
                                    Text('Folder 3'), // Folder name added
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
                                    Text('Folder 4'), // Folder name added
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Placeholder content for HOME tab
                      Center(
                          child: Text(
                              'Your Tours')), // Placeholder content for FILES tab
                      Center(child: Text('Taurgo Tours')),
                      Center(
                          child: Text(
                              'Taurgo Tours')), // Placeholder content for SETTINGS tab
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

  

      ),
      body: Container(
        color: bWhite,
        padding: const EdgeInsets.all(16.0),

      )
    );
  }
}

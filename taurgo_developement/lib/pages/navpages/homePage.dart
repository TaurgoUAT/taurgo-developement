import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';

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
        title: Text(
          'My Tour',
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
          child: Image.asset(
              'assets/logo/Taurgo Logo.png'), 
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

                const SizedBox(
                    height: 20), 

                const Padding(
                  padding: EdgeInsets.only(
                      left: 30.0), 
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
                                    Text('Folder 1'), 
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
                     
                      Center(
                          child: Text(
                              'Your Tours')), 
                      Center(child: Text('Taurgo Tours')),
                      Center(
                          child: Text(
                              'Taurgo Tours')), 
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

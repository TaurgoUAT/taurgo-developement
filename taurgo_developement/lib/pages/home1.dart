import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/bottom_nav_bar.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            const SizedBox(
                height: 10), // Adds space between search bar and text

            const Padding(
              padding:
                  EdgeInsets.only(left: 30.0), // Adjust the padding as needed
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    // Action for folder 1
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.folder, size: 50.0, color: Colors.grey),
                      Text('Folder 1'), // Folder name added
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Action for folder 2
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.folder, size: 50.0, color: Colors.grey),
                      Text('Folder 2'), // Folder name added
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Action for folder 3
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.folder, size: 50.0, color: Colors.grey),
                      Text('Folder 3'), // Folder name added
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Action for folder 4
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.folder, size: 50.0, color: Colors.grey),
                      Text('Folder 4'), // Folder name added
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: kPrimaryColor,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(999),
      //   ),
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add, color: bWhite),
      // ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}

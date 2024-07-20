// settings_page.dart
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/accountPage.dart';
import 'package:taurgo_developement/pages/navpages/homePage.dart';
import 'package:taurgo_developement/pages/navpages/propertyPage.dart';
import 'package:taurgo_developement/pages/navpages/imagePage.dart';
import 'package:taurgo_developement/widgets/bottom_nav_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool soundEnabled = true;
  bool notificationsEnabled = true;
  bool locationEnabled = true;
  // int currentTab = 0;
  //
  // final List<Widget> pages = [
  //   HomePage(),
  //   ProperyPage(),
  //   Imagepage(),
  //   AccountPage(),
  // ];

  void onTabSelected(int index) {
    setState(() {
      Navigator.of(context).pop(); // Return to the previous page when a tab is selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
        centerTitle: true,
        backgroundColor: bWhite,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_outline,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: bWhite,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('General Settings',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SwitchListTile(
                title: Text('On Invoice', style: TextStyle(fontSize: 12)),
                value: soundEnabled,
                onChanged: (bool value) {
                  setState(() {
                    soundEnabled = value;
                  });
                },
                activeColor: kPrimaryColor,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              ),
              SwitchListTile(
                title: Text('Notifications', style: TextStyle(fontSize: 12)),
                value: notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
                activeColor: kPrimaryColor,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              ),
              SwitchListTile(
                title: Text('Location', style: TextStyle(fontSize: 12)),
                value: locationEnabled,
                onChanged: (bool value) {
                  setState(() {
                    locationEnabled = value;
                  });
                },
                activeColor: kPrimaryColor,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              ),
              Divider(),
              ListTile(
                title: Text('About',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Version', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('License',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Terms of Service', style: TextStyle(fontSize: 12)),
                      SizedBox(height: 15),
                      Text('Privacy Policy', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   shape: CircleBorder(),
      //   backgroundColor: kPrimaryColor,
      //   foregroundColor: Colors.white,
      //   child: Icon(
      //     Icons.add,
      //     size: 48,
      //   ),
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: CustomBottomNavBar(
      //   currentTab: currentTab,
      //   onTabSelected: onTabSelected,
      // ),
    );
  }
}

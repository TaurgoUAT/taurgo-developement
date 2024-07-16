import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/bottom_nav_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool soundEnabled = true;
  bool notificationsEnabled = true;
  bool locationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 16,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('General Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SwitchListTile(
              title: Text('Sound', style: TextStyle(fontSize: 14)),
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
              title: Text('Notifications', style: TextStyle(fontSize: 14)),
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
              title: Text('Location', style: TextStyle(fontSize: 14)),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Version', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('License',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Terms of Service', style: TextStyle(fontSize: 14)),
                    Text('Privacy Policy', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavBar(), // Assuming you have a BottomNavBar widget
    );
  }
}

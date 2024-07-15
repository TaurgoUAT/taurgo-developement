import 'package:flutter/material.dart';

import '../components/bottom_nav_bar.dart';
import '../components/change_password_button.dart';
import '../components/help_support_button.dart';
import '../components/profile_section.dart';
import '../components/settings_button.dart';
import '../components/subscription_section.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
              'assets/logo/Taurgo Logo.png'), // Path to your company icon
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: ProfileSection()),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(thickness: 1, color: Color(0xFFC2C2C2)),
            ),
            SizedBox(height: 16),
            SubscriptionSection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(thickness: 1, color: Color(0xFFC2C2C2)),
            ),
            SizedBox(height: 16),
            Center(child: SettingsButton()),
            Center(child: ChangePasswordButton()),
            Center(child: HelpSupportButton()),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 10),
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff286167),
                    foregroundColor: Color(0xFFffffff), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(50), // Button corner radius
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

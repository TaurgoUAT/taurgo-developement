import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/change_password_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/help_support_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/profile_section.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/setting_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/susbcribtion_section.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
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
      body: Container(
        color: bWhite,
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
            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: SettingsButton(),
            ),
            // Center(
            //     child:Container(
            //       padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            //       child: SettingsButton(),
            //     )),
            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: ChangePasswordButton(),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: HelpSupportButton(),
            ),
            Spacer(),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 20.0),
            //     child: ElevatedButton(
            //       onPressed: () {},
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 100, vertical: 10),
            //         child: Text(
            //           'Logout',
            //           style: TextStyle(fontSize: 18),
            //         ),
            //       ),
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: kPrimaryColor,
            //         foregroundColor: bWhite, // Background color
            //         shape: RoundedRectangleBorder(
            //           borderRadius:
            //           BorderRadius.circular(50), // Button corner radius
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 20.0),
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                    backgroundColor: kPrimaryColor,
                    foregroundColor: bWhite, // Background color
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
    );
  }
}

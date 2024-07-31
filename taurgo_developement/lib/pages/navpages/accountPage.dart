import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/bottom_nav_bar.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/change_password_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/help_support_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/profile_section.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/setting_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/susbcribtion_section.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

import '../../controllers/authController.dart';
import '../home.dart';
import 'helpAndSupportPage.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // List<Map<String, dynamic>> userDetails = [];
  Map<String, dynamic>? userDetails;



  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        QuerySnapshot snapshot = await _firestore
            .collection('users-deatils')
            .doc(user.uid)
            .collection('users')
            .orderBy('createdAt', descending: true)
            .limit(1) // Fetch only the most recent document
            .get();

        if (snapshot.docs.isNotEmpty) {
          if (mounted) {
            setState(() {
              userDetails = snapshot.docs.first.data() as Map<String, dynamic>;
              isLoading = false;
            });
          }

        } else {
          print("No user details found for this user.");
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        }
      }
    } catch (e) {
      print("Failed to fetch user details: $e");
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(
            color: kPrimaryColor,
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
            child: Image.asset(
                'assets/logo/Taurgo Logo.png'), // Path to your company icon
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.notifications_none,
          //     color: kPrimaryColor,
          //   ),
          //   onPressed: () {},
          // ),
          IconButton(
            icon: Icon(
              Icons.help_outline,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Helpandsupportpage()), // Replace HomePage with your home page widget
              );
            },
          ),
        ],
      ),
      body: Container(
        color: bWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name',
                          style: TextStyle(fontSize: 14, color: Color(0xFF777777))),
                      Text(userDetails?['userName'] ?? '',
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Email Address',
                          style: TextStyle(fontSize: 14, color: Color(0xFF777777))),
                      Text(userDetails?['email'] ?? '', style: TextStyle
                        (fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Divider(thickness: 1, color: Color(0xFFC2C2C2)),
            // ),
            SizedBox(height: 48),
            // SubscriptionSection(),
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

            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 30.0),
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ElevatedButton(
                  onPressed: () {
                    AuthController.instance.logOut();
                  },
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

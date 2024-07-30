import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/costants/status.dart';
import 'package:taurgo_developement/pages/FolderContentsPage.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/helpAndSupportPage.dart';
import 'package:taurgo_developement/pages/navpages/notification/notificationPage.dart';
import 'package:taurgo_developement/pages/navpages/upload_image_page.dart';

class CompletedPropertyPage extends StatefulWidget {
  final String virtualTourUrl;
  final String floorPlanUrl;
  final String twoDimensionPlanUrl;
  const CompletedPropertyPage({super.key, required this.virtualTourUrl, required this.floorPlanUrl, required this.twoDimensionPlanUrl});

  @override
  State<CompletedPropertyPage> createState() => _CompletedPropertyPageState();
}

class _CompletedPropertyPageState extends State<CompletedPropertyPage> {
  final TextStyle linkTextStyle = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: kSecondaryTextColourTwo,
  );

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    // Show a SnackBar to confirm the copy action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Link copied to clipboard',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 3),
        backgroundColor:
        kPrimaryColor, // Use your primary color for the
        // SnackBar
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Completed Properties',
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
              MaterialPageRoute(
                  builder: (context) =>
                      Homepage()), // Replace HomePage with your home page widget
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo/Taurgo Logo.png', // Path to your company icon
            ),
          ),
        ),
        actions: [
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
                    'Completed Properties',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                    ),
                  ),
                  SizedBox(height: 12,),
                  Text(
                    'Please find the completed Properties here',
                    style: TextStyle(
                      color: kSecondaryTextColour,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter",
                    ),
                  ),

                  SizedBox(height: 30,),
                  Text(
                    'Link to the Virtual Tour',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24),


                  //Virtual Tour
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      // Light background color for contrast
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SelectableText widget allows users to select the text
                        SelectableText(
                          widget.virtualTourUrl,
                          style: linkTextStyle,
                        ),
                        IconButton(
                          icon: Icon(Icons.copy, color: kPrimaryColor),
                          onPressed: () =>
                              _copyToClipboard(widget.virtualTourUrl),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12,),

                  //Floor PLans
                  Text(
                    'Link to the Floor Plans',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24),
                  // Container to display the reference code and copy button
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      // Light background color for contrast
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SelectableText widget allows users to select the text
                        SelectableText(
                          "Virtual Tour URL",
                          style: linkTextStyle,
                        ),
                        IconButton(
                          icon: Icon(Icons.copy, color: kPrimaryColor),
                          onPressed: () =>
                              _copyToClipboard("URL"),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12,),

                  //2D Images
                  Text(
                    'Link to the 2D Images',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24),


                  // Container to display the reference code and copy button
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      // Light background color for contrast
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SelectableText widget allows users to select the text
                        SelectableText(
                          "Virtual Tour URL",
                          style: linkTextStyle,
                        ),
                        IconButton(
                          icon: Icon(Icons.copy, color: kPrimaryColor),
                          onPressed: () =>
                              _copyToClipboard("URL"),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

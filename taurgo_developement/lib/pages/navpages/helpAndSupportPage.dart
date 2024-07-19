import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
import 'package:taurgo_developement/pages/navpages/shareImagePage.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:path_provider/path_provider.dart';
import 'package:taurgo_developement/pages/select_image.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpandsupportpage extends StatefulWidget {
  const Helpandsupportpage({super.key});

  @override
  State<Helpandsupportpage> createState() => _HelpandsupportpageState();
}

class _HelpandsupportpageState extends State<Helpandsupportpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help and Support',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarSection(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'FAQs',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ExpansionTile(
                title: Text(
                  'I have never produced a virtual tour before, how do I begin?',
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'The easiest way to get started, simply book a consultation using our online form or by contacting us directly. During the consultation, we’ll discuss your specific needs and goals, as well as provide a demonstration of our services.',
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Virtual tour creation'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Our expert team will then use the collected data to create an engaging and interactive 360-degree virtual tour. This process typically takes 3-5 business days, depending on the size and complexity of the property.'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Review and approval'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'We’ll share the completed virtual tour with you for review and approval. If any adjustments are needed, our team will make the necessary revisions and resubmit the tour for your final approval.'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Launch and promotion'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Once approved, we’ll help you integrate the virtual tour into your existing marketing materials and platforms. You can then share the tour with potential buyers, providing them with a more engaging and informative experience compared to traditional images or videos. To learn more about our process or to schedule a consultation, please use our online form or call us directly. We’re here to help you enhance your listings and attract more leads with minimal effort.'),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Text(
                      'For more information visit our web page',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () async {
                        const url = 'https://taurgo.co.uk/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      icon: Icon(Icons.web),
                      label: Text('Taurgo.co.uk'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        foregroundColor: bWhite, // Background color
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle privacy policy link press
                  },
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: kPrimaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 326,
            height: 40,
            decoration: BoxDecoration(
              color: bWhite,
              border: Border.all(
                color: kSecondaryButtonBorderColor, // Replace with your desired border color
                width: 2.0, // Adjust the border width as needed
              ), // Background color of the search bar
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search, color: kSecondaryButtonBorderColor), // Search icon
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: kSecondaryButtonBorderColor),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.mic, color: kSecondaryButtonBorderColor), // Mic icon
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

import 'package:url_launcher/url_launcher_string.dart';

import '../helpAndSupport/RicohThetaZ1GuidePage.dart';
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()), // Replace
              // HomePage with your home page widget
            );
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
              // SearchBarSectionHelpAndSupport(),
              SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.only(left: 16.0),
              //   child: Text(
              //     'FAQs',
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              _buildNavigationButton(context, 'Connecting to Ricoh Theta Z1',
                  RicohThetaZ1GuidePage()),
              SizedBox(height: 10),
              // ExpansionTile(
              //   title: Text(
              //     'I have never produced a virtual tour before, how do I begin?',
              //   ),
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text(
              //         'The easiest way to get started, simply book a consultation using our online form or by contacting us directly. During the consultation, we’ll discuss your specific needs and goals, as well as provide a demonstration of our services.',
              //       ),
              //     ),
              //   ],
              // ),
              // ExpansionTile(
              //   title: Text('Virtual tour creation'),
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text(
              //           'Our expert team will then use the collected data to create an engaging and interactive 360-degree virtual tour. This process typically takes 3-5 business days, depending on the size and complexity of the property.'),
              //     ),
              //   ],
              // ),
              // ExpansionTile(
              //   title: Text('Review and approval'),
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text(
              //           'We’ll share the completed virtual tour with you for review and approval. If any adjustments are needed, our team will make the necessary revisions and resubmit the tour for your final approval.'),
              //     ),
              //   ],
              // ),
              // ExpansionTile(
              //   title: Text('Launch and promotion'),
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text(
              //           'Once approved, we’ll help you integrate the virtual tour into your existing marketing materials and platforms. You can then share the tour with potential buyers, providing them with a more engaging and informative experience compared to traditional images or videos. To learn more about our process or to schedule a consultation, please use our online form or call us directly. We’re here to help you enhance your listings and attract more leads with minimal effort.'),
              //     ),
              //   ],
              _buildFAQsSection(),
              SizedBox(height: 30),
              _buildMoreInfoSection(),
              // SizedBox(height: 30),
              // Center(
              //   child: Column(
              //     children: [
              //       Text(
              //         'For more information visit our web page',
              //         style:
              //             TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              //       ),
              //       SizedBox(height: 20),
              //       ElevatedButton.icon(
              //         onPressed: () async {
              //           const url = 'https://taurgo.co.uk/';
              //           if (await canLaunch(url)) {
              //             await launch(url);
              //           } else {
              //             throw 'Could not launch $url';
              //           }
              //         },
              //         icon: Icon(Icons.web),
              //         label: Text('Taurgo.co.uk'),
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: kPrimaryColor,
              //           foregroundColor: bWhite, // Background color
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 20),
              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       // Handle privacy policy link press
              //     },
              //     child: Text(
              //       'Privacy Policy',
              //       style: TextStyle(
              //         color: kPrimaryColor,
              //         decoration: TextDecoration.underline,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildNavigationButton(
      BuildContext context, String title, Widget page) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Text(title),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            foregroundColor: bWhite,
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
    );
  }

  Widget _buildFAQsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            'What is Taurgo and how can it benefit real estate professionals?',
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Taurgo is a virtual tour app designed to help real estate professionals create immersive virtual tours for their property listings. It allows you to capture 360-degree photos, including floor plans, and share them with potential buyers or tenants, enhancing your property marketing efforts.',
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text(
            'How do I capture virtual tour photos, including floor plans, using Taurgo and a compatible camera?',
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'To capture virtual tour photos, including floor plans, you can connect the Taurgo app with a compatible camera, such as the Ricoh Theta Z1. Using the Taurgo app, you can capture 360-degree images of your property, and if desired, integrate floor plans into the virtual tour.',
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text(
            'Is it easy to upload, edit, and share photos, including floor plans, with the Taurgo team?',
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Absolutely! Taurgo makes it easy to upload, edit, and share your virtual tour photos, including floor plans, with the Taurgo team. Once you have captured the photos using the app, you can upload them directly and make any necessary edits or enhancements. You can also include floor plans in the virtual tour to provide a comprehensive view of the property.',
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text(
            'How long does it take for the Taurgo team to process and send back the completed virtual tour package, including floor plans?',
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'The Taurgo team strives to process and send back the completed virtual tour package, including floor plans, within 24 hours. This allows you to quickly incorporate the final photos and floor plans into your property listings, providing potential buyers or tenants with a comprehensive view of the property.',
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text(
            'What should I do if I encounter any issues or have questions while using Taurgo?',
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'If you encounter any issues or have questions while using Taurgo, the Taurgo team is there to assist you. Simply send an email to info@taurgo.co.uk, and they will be happy to help you resolve any problems or address any inquiries you may have regarding capturing and including floor plans in your virtual tours.',
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildMoreInfoSection() {
    return Center(
      child: Column(
        children: [
          Text(
            'For more information visit our web page',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () async {
              const url = 'https://taurgo.co.uk';
              if (await canLaunchUrlString(url)) {
                await launchUrlString(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            icon: Icon(Icons.web),
            label: Text('Taurgo.co.uk'),
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              foregroundColor: bWhite,
            ),
          ),
        ],
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
                color: kSecondaryButtonBorderColor,
                // Replace with your desired border color
                width: 2.0, // Adjust the border width as needed
              ), // Background color of the search bar
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search,
                      color: kSecondaryButtonBorderColor), // Search icon
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
                  child: Icon(Icons.mic,
                      color: kSecondaryButtonBorderColor), // Mic icon
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildNavigationButton(
      BuildContext context, String title, Widget page) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Text(title),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            foregroundColor: bWhite,
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
    );
  }


}


class SearchBarSectionHelpAndSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            height: 40,
            decoration: BoxDecoration(
              color: bWhite,
              border: Border.all(
                color: kSecondaryButtonBorderColor, // Replace with your desired
                // border color
                width: 2.0, // Adjust the border width as needed
              ), // Background color of the search bar
              borderRadius: BorderRadius.circular(30.0),

              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 2,
              //     blurRadius: 5,
              //     offset: Offset(0, 3),
              //   ),
              // ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search,
                      color: kSecondaryButtonBorderColor), // Search icon
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
                  child: Icon(Icons.mic,
                      color: kSecondaryButtonBorderColor), // Mic icon
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


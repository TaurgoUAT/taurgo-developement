import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
import 'package:taurgo_developement/pages/navpages/upload_image_page.dart';

import '../home.dart';

class ProperyPage extends StatefulWidget {
  const ProperyPage({super.key});

  @override
  State<ProperyPage> createState() => _ProperyPageState();
}

class _ProperyPageState extends State<ProperyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Properties',
          style: TextStyle(
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
              MaterialPageRoute(builder: (context) => Homepage()), // Replace Homepage with your home page widget
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo/Taurgo Logo.png'), // Path to your company icon
          ),
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
        color: Colors.white, // Ensure this is set to Colors.white
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarSection(),
              propertyContainer(context, UploadImagePage(), "assets/images/prop-img.png",
                  "Address", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua."),


              propertyContainer(context, UploadImagePage(), "assets/images/prop-img.png",
                  "Address", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua."),


              propertyContainer(context, UploadImagePage(), "assets/images/prop-img.png",
                  "Address", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua."),


              propertyContainer(context, UploadImagePage(), "assets/images/prop-img.png",
                  "Address", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua."),

            ],
          ),
        ),
      ),
      backgroundColor: Colors.white, // Set Scaffold background color to white
    );
  }
  Widget propertyContainer(BuildContext context, Widget page, String imagePath,
      String title, String description) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Container(
        height: 310,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                  bottom: Radius.circular(20.0),
                ),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 11.0,
                      color: kSecondaryTextColourTwo,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        "Area : ",
                        style: TextStyle(
                          fontSize: 11.0,
                          color: kPrimaryTextColour,
                        ),
                      ),
                      Text(
                        "Area",
                        style: TextStyle(
                          fontSize: 11.0,
                          color: kSecondaryTextColourTwo,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Postalcode : ",
                        style: TextStyle(
                          fontSize: 11.0,
                          color: kPrimaryTextColour,
                        ),
                      ),
                      Text(
                        "123345",
                        style: TextStyle(
                          fontSize: 11.0,
                          color: kSecondaryTextColourTwo,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

}


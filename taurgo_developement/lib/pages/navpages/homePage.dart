import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/FolderContentsPage.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
import 'package:taurgo_developement/pages/navpages/upload_image_page.dart';

class HomePage extends StatefulWidget {
  final String folderName;

  const HomePage({
    super.key,
    this.folderName = 'Default Folder Name',
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Tours',
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
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: bWhite,
          body: Column(
            children: <Widget>[
              SearchBarSection(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Completed Properties',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              ),
              const TabBar(
                padding: EdgeInsets.symmetric(horizontal: 10),
                unselectedLabelColor: kPrimaryColor,
                labelColor: kPrimaryColor,
                unselectedLabelStyle: TextStyle(fontSize: 13),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'All Tours',
                      style: TextStyle(
                        fontSize: 9.0, // Set your desired font size here
                        color: kPrimaryColor, // Optionally, set the text color
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Your Tours',
                      style: TextStyle(
                        fontSize: 9.0, // Set your desired font size here
                        color: kPrimaryColor, // Optionally, set the text color
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Taurgo Tours',
                      style: TextStyle(
                        fontSize: 9.0, // Set your desired font size here
                        color: kPrimaryColor, // Optionally, set the text color
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Hybrid Tours',
                      style: TextStyle(
                        fontSize: 9.0, // Set your desired font size here
                        color: kPrimaryColor, // Optionally, set the text color
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTourContainer(
                              context,
                              FolderContentsPage(),
                              "assets/images/prop-img.png",
                              "Address",
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua."),
                          buildTourContainer(
                              context,
                              UploadImagePage(),
                              "assets/images/prop-img.png",
                              "Address",
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua."),
                          buildTourContainer(
                              context,
                              UploadImagePage(),
                              "assets/images/prop-img.png",
                              "Address",
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua."),
                        ],
                      ),
                    ),
                    Center(child: Text('Your Tours')),
                    Center(child: Text('Taurgo Tours')),
                    Center(child: Text('Hybrid Tours')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTourContainer(BuildContext context, Widget page, String imagePath,
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

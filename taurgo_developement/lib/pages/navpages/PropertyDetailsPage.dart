import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/propetyPageComponents/propertyDetails.dart';
import 'package:taurgo_developement/pages/navpages/propetyPageComponents/propertyImagesCarousal.dart';
import 'package:taurgo_developement/pages/navpages/propetyPageComponents/shareButton.dart';
import 'package:taurgo_developement/pages/navpages/propetyPageComponents/uploadImagesButton.dart';

class PropertyDetailsPage extends StatelessWidget {
  const PropertyDetailsPage({super.key});

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UploadImagesButton(),
            SizedBox(height: 16),
            PropertyImageCarousel(),
            SizedBox(height: 16),
            PropertyDetails(),
            SizedBox(height: 32),
            ShareButton(),
          ],
        ),
      ),
    );
  }
}

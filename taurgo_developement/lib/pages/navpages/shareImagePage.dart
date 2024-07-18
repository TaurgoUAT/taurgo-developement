import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/home.dart';

class ShareImagePage extends StatelessWidget {
  const ShareImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Share Image',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              child:
              Image.asset('assets/images/prop-img.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Container(
              child: Image.asset(
                'assets/logo/logo.png',
                height: 50,
                width: 400,
                fit: BoxFit.contain,
              ),
            ),

            Center(
              child: Column(
                children: [

                  SizedBox(height: 8),
                  Text(
                    'Share image with Taurgo to create virtual tour',
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShareImagePage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 30.0),
                      child: Text(
                        'Share with Taurgo',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.white, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(50), // Button corner radius
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[300],
                indent: 40,
                endIndent: 40),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    'Other Share Options',
                    style: TextStyle(fontSize: 14, color: allBlack),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.whatsapp,
                            color: Colors.green, size: 32),
                        onPressed: () {},
                      ),
                      SizedBox(width: 16),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.facebook,
                            color: Colors.blue, size: 32),
                        onPressed: () {},
                      ),
                      SizedBox(width: 16),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.instagram,
                            color: Colors.purple, size: 32),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300],
                      indent: 40,
                      endIndent: 40),
                  SizedBox(height: 20),
                  Text(
                    'Share via External Link',
                    style: TextStyle(fontSize: 14, color: allBlack),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.link, color: kPrimaryColor),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kGrey,
                      shape: CircleBorder(), // Make the button circular
                      padding: EdgeInsets.all(16), // Adjust padding to make it look like a circle
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
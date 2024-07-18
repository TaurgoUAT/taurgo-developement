import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/upload_image_page.dart';


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
          title: Text('Properties', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),),
          centerTitle: true,
          backgroundColor: bWhite,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                'assets/logo/Taurgo Logo.png'), // Path to your company icon
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none,color: kPrimaryColor,),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.help_outline, color: kPrimaryColor,),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: bWhite,
          padding: const EdgeInsets.all(16.0),

          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UploadImagePage()),
                      );
                    },
                    child: Container(
                      height: 300,
                      margin: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: bWhite,
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
                        // padding: const EdgeInsets.all(16.0),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(16.0),

                            child: ClipRRect(
                              // padding: const EdgeInsets.all(16.0),
                              borderRadius: BorderRadius.vertical(top: Radius.circular
                                (20.0),bottom: Radius.circular(20.0)),
                              child: Image.asset(
                                "assets/images/prop-img.png",
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
                                  "Address",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua. ",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: kSecondaryTextColourTwo,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
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
                  ),




                ],
              )
          ),


        )


    );
  }
}
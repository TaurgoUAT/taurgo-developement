import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/change_password_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/help_support_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/profile_section.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/setting_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/susbcribtion_section.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/description_section.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class Imagepage extends StatefulWidget {
  const Imagepage({super.key});

  @override
  State<Imagepage> createState() => _ImagepageState();
}

class _ImagepageState extends State<Imagepage> with TickerProviderStateMixin{
  // late TabController _tabController;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 3, vsync: this);
  // }
  //
  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  // List<String> allImage = [
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //
  // ];
  // List<String> latestImages = [
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  // ];
  // List<String> deletedImages = [
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  //   "prop-img.png",
  // ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        // title: Text('Account', style: TextStyle(
        //   fontSize: 16,
        //   fontWeight: FontWeight.w500,
        //   fontFamily: "Inter",
        // ),),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(child: SearchBarSection()),

            CapturedImage(),
            Container(
              child: TabBar(
                controller: _tabController,
                labelColor: kPrimaryColor,
                unselectedLabelColor: kSecondaryBorderColor,
                indicator: BoxDecoration(),


                // indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: "All Images"),
                  Tab(text: "Latest"),
                  Tab(text: "Deleted"),
                ],
              ),
            ),
            // Expanded(
            //   child: TabBarView(
            //     controller: _tabController,
            //     children: [
            //       buildGridView(allImage),
            //       buildGridView(latestImages),
            //       buildGridView(deletedImages),
            //     ],
            //   ),
            // ),



            // Container(
            //   padding: const EdgeInsets.only(left: 20),
            //   height: 400,
            //   width: double.maxFinite,
            //   child: TabBarView(controller: _tabController, children: [
            //     ListView.builder(
            //       itemCount: 4,
            //       // scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return GestureDetector(
            //           // onTap:(){
            //           //   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
            //           // },
            //           child: Container(
            //             margin: const EdgeInsets.only(right: 15, top: 15),
            //             width: 100,
            //             height: 100,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(20),
            //                 color: Colors.white,
            //                 image: DecorationImage(
            //                     image: AssetImage("assets/images/" +
            //                         allImage[index]),
            //                     fit: BoxFit.cover)),
            //           ),
            //
            //         );
            //       },
            //     ),
            //     ListView.builder(
            //       itemCount: 4,
            //       // scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return GestureDetector(
            //           // onTap:(){
            //           //   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
            //           // },
            //           child: Container(
            //             margin: const EdgeInsets.only(right: 15, top: 15),
            //             width: 150,
            //             height: 150,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(20),
            //                 color: Colors.white,
            //                 image: DecorationImage(
            //                     image: AssetImage("assets/images/" + latestImages[index]),
            //                     fit: BoxFit.cover)),
            //           ),
            //
            //         );
            //       },
            //     ),
            //     ListView.builder(
            //       itemCount: 4,
            //       // scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return GestureDetector(
            //           // onTap:(){
            //           //   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
            //           // },
            //           child: Container(
            //             margin: const EdgeInsets.only(right: 15, top: 15),
            //             width: 150,
            //             height: 150,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(20),
            //                 color: Colors.white,
            //                 image: DecorationImage(
            //                     image: AssetImage("assets/images/" + deletedImages[index]),
            //                     fit: BoxFit.cover)),
            //           ),
            //
            //         );
            //       },
            //     ),
            //   ]),
            // ),

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Row(
            //       children: [
            //         Expanded(
            //           child: TabBar(
            //             controller: _tabController,
            //             labelColor: kPrimaryColor,
            //             unselectedLabelColor: kPrimaryColor.withOpacity(0.3),
            //             indicatorSize: TabBarIndicatorSize.label,
            //             tabs: [
            //               Tab(text: "All Images"),
            //               Tab(text: "Latest"),
            //               Tab(text: "Deleted"),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //     // Add a TabBarView if you want to display content for each tab
            //     Expanded(
            //       child: TabBarView(
            //         controller: _tabController,
            //         children: [
            //           Center(child: Text("All Images Content")),
            //           Center(child: Text("Latest Content")),
            //           Center(child: Text("Deleted Content")),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),

          ],
        ),
      ),
    );
  }
}


Widget buildGridView(List<String> images) {
  return GridView.builder(
    padding: const EdgeInsets.all(8.0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    ),
    itemCount: images.length,
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () {
          // Handle image tap
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage("assets/images/${images[index]}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    },
  );
}


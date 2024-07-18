// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:taurgo_developement/costants/AppColors.dart';
// import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'My Tour',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             fontFamily: "Inter",
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: bWhite,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.asset(
//               'assets/logo/Taurgo Logo.png'),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.notifications_none,
//               color: kPrimaryColor,
//             ),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.help_outline,
//               color: kPrimaryColor,
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Container(
//         color: bWhite,
//         padding: const EdgeInsets.all(16.0),
//
//       )
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/property_heading.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Tour',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
        centerTitle: true,
        backgroundColor: bWhite,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo/Taurgo Logo.png'),
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
        color: bWhite,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: SearchBarSection()),
            CompletedProperty(),

            // Container(
            //   child: TabBar(
            //     controller: _tabController,
            //     labelColor: kPrimaryColor,
            //     unselectedLabelColor: kSecondaryBorderColor,
            //     indicator: BoxDecoration(),
            //
            //
            //     // indicatorSize: TabBarIndicatorSize.tab,
            //     tabs: [
            //       Tab(
            //         child: Text(
            //           "All Tours",
            //           style: TextStyle(fontSize: 11), // Adjust the font size
            //           // here
            //         ),
            //       ),
            //       Tab(
            //         child: Text(
            //           "Your Tours",
            //           style: TextStyle(fontSize: 11), // Adjust the font size
            //           // here
            //         ),
            //       ),
            //
            //       Tab(
            //         child: Text(
            //           "Taurgo Tours",
            //           style: TextStyle(fontSize: 11), // Adjust the font size
            //           // here
            //         ),
            //       ),
            //
            //       Tab(
            //         child: Text(
            //           "Hybrid Tours",
            //           style: TextStyle(fontSize: 11), // Adjust the font size
            //           // here
            //         ),
            //       ),
            //     ],
            //   ),
            // ),



          ],
        ),
      ),

    );
  }
}

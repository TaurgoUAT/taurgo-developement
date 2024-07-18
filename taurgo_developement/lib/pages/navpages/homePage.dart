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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
            // DefaultTabController(
            //   length: 4,
            //   child: Scaffold(
            //     backgroundColor: bWhite,
            //     body: Container(
            //       child: Column(
            //         children: <Widget>[
            //           TabBar(
            //             padding: EdgeInsets.symmetric(horizontal: 10),
            //             unselectedLabelColor: kPrimaryColor,
            //             labelColor: kPrimaryColor,
            //             // indicator: BoxDecoration(),
            //
            //             // unselectedLabelStyle: const TextStyle(fontSize: 13),
            //             labelStyle: const TextStyle(
            //               fontSize: 12,
            //             ),
            //             tabs: const [
            //               Tab(
            //                 text: 'All Tours',
            //               ),
            //               Tab(
            //                 text: 'Your Tours',
            //               ),
            //               Tab(
            //                 text: 'Taurgo Tours',
            //               ),
            //               Tab(
            //                 text: 'Taurgo Tours',
            //               ),
            //             ],
            //           ),
            //           Expanded(
            //             child: TabBarView(
            //               children: [
            //                 Column(
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   children: [
            //
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                       children: <Widget>[
            //                         InkWell(
            //                           // onTap: () {
            //                           //   // Action for folder 1
            //                           // },
            //                           child: Column(
            //                             mainAxisSize: MainAxisSize.min,
            //                             children: <Widget>[
            //                               Icon(Icons.folder,
            //                                   size: 50.0, color: kAccentColor),
            //                               Text('Folder 1'), // Folder name added
            //                             ],
            //                           ),
            //                         ),
            //
            //                         InkWell(
            //                           // onTap: () {
            //                           //   // Action for folder 2
            //                           // },
            //                           child: Column(
            //                             mainAxisSize: MainAxisSize.min,
            //                             children: <Widget>[
            //                               Icon(Icons.folder,
            //                                   size: 50.0, color: kAccentColor),
            //                               Text('Folder 2'), // Folder name added
            //                             ],
            //                           ),
            //                         ),
            //                         InkWell(
            //                           // onTap: () {
            //                           //   // Action for folder 3
            //                           // },
            //                           child: Column(
            //                             mainAxisSize: MainAxisSize.min,
            //                             children: <Widget>[
            //                               Icon(Icons.folder,
            //                                   size: 50.0, color: kAccentColor),
            //                               Text('Folder 3'), // Folder name added
            //                             ],
            //                           ),
            //                         ),
            //
            //                         InkWell(
            //                           // onTap: () {
            //                           //   // Action for folder 4
            //                           // },
            //                           child: Column(
            //                             mainAxisSize: MainAxisSize.min,
            //                             children: <Widget>[
            //                               Icon(Icons.folder,
            //                                   size: 50.0, color: kAccentColor),
            //                               Text('Folder 4'), // Folder name added
            //                             ],
            //                           ),
            //                         )
            //
            //
            //                       ],
            //                     )
            //                   ],
            //                 )
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   )
            //   // TabBar(
            //   //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   //   unselectedLabelColor: kPrimaryColor,
            //   //   labelColor: kPrimaryColor,
            //   //   // indicator: BoxDecoration(),
            //   //
            //   //   // unselectedLabelStyle: const TextStyle(fontSize: 13),
            //   //   labelStyle: const TextStyle(
            //   //     fontSize: 12,
            //   //   ),
            //   //   tabs: const [
            //   //     Tab(
            //   //       text: 'All Tours',
            //   //     ),
            //   //     Tab(
            //   //       text: 'Your Tours',
            //   //     ),
            //   //     Tab(
            //   //       text: 'Taurgo Tours',
            //   //     ),
            //   //     Tab(
            //   //       text: 'Taurgo Tours',
            //   //     ),
            //   //   ],
            //   // ),
            //   // const Expanded(
            //   //   child: TabBarView(
            //   //     children: [
            //   //       Column(
            //   //         mainAxisAlignment: MainAxisAlignment.start,
            //   //         children: [
            //   //
            //   //           Row(
            //   //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   //             children: <Widget>[
            //   //               InkWell(
            //   //                 // onTap: () {
            //   //                 //   // Action for folder 1
            //   //                 // },
            //   //                 child: Column(
            //   //                   mainAxisSize: MainAxisSize.min,
            //   //                   children: <Widget>[
            //   //                     Icon(Icons.folder,
            //   //                         size: 50.0, color: kAccentColor),
            //   //                     Text('Folder 1'), // Folder name added
            //   //                   ],
            //   //                 ),
            //   //               ),
            //   //
            //   //               InkWell(
            //   //                 // onTap: () {
            //   //                 //   // Action for folder 2
            //   //                 // },
            //   //                 child: Column(
            //   //                   mainAxisSize: MainAxisSize.min,
            //   //                   children: <Widget>[
            //   //                     Icon(Icons.folder,
            //   //                         size: 50.0, color: kAccentColor),
            //   //                     Text('Folder 2'), // Folder name added
            //   //                   ],
            //   //                 ),
            //   //               ),
            //   //               InkWell(
            //   //                 // onTap: () {
            //   //                 //   // Action for folder 3
            //   //                 // },
            //   //                 child: Column(
            //   //                   mainAxisSize: MainAxisSize.min,
            //   //                   children: <Widget>[
            //   //                     Icon(Icons.folder,
            //   //                         size: 50.0, color: kAccentColor),
            //   //                     Text('Folder 3'), // Folder name added
            //   //                   ],
            //   //                 ),
            //   //               ),
            //   //
            //   //               InkWell(
            //   //                 // onTap: () {
            //   //                 //   // Action for folder 4
            //   //                 // },
            //   //                 child: Column(
            //   //                   mainAxisSize: MainAxisSize.min,
            //   //                   children: <Widget>[
            //   //                     Icon(Icons.folder,
            //   //                         size: 50.0, color: kAccentColor),
            //   //                     Text('Folder 4'), // Folder name added
            //   //                   ],
            //   //                 ),
            //   //               )
            //   //
            //   //
            //   //             ],
            //   //           )
            //   //         ],
            //   //       )
            //   //     ],
            //   //   ),
            //   // )
            // ),
          ],
        ),
      ),
      // body: DefaultTabController(
      //     length: 3,
      //     child: Scaffold(
      //       backgroundColor: bWhite,
      //       body: Container(
      //         child: Column(
      //           children: <Widget>[
      //             Center(child: SearchBarSection()),
      //
      //             CompletedProperty(),
      //             const SizedBox(height: 10),
      //
      //             // const TabBar(
      //             //   padding: EdgeInsets.symmetric(horizontal: 10),
      //             //   unselectedLabelColor: kPrimaryColor,
      //             //   labelColor: kPrimaryColor,
      //             //   unselectedLabelStyle: const TextStyle(fontSize: 13),
      //             //   labelStyle: const TextStyle(
      //             //     fontWeight: FontWeight.bold,
      //             //     fontSize: 13,
      //             //   ),
      //             //   tabs: const [
      //             //     Tab(
      //             //       text: 'All Tours',
      //             //     ),
      //             //     Tab(
      //             //       text: 'Your Tours',
      //             //     ),
      //             //     Tab(
      //             //       text: 'Taurgo Tours',
      //             //     ),
      //             //     Tab(
      //             //       text: 'Taurgo Tours',
      //             //     ),
      //             //   ],
      //             // ),
      //             // const Expanded(
      //             //   child: TabBarView(
      //             //     children: [
      //             //       Column(
      //             //         mainAxisAlignment: MainAxisAlignment.start,
      //             //         children: [
      //             //
      //             //           Row(
      //             //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             //             children: <Widget>[
      //             //               InkWell(
      //             //                 // onTap: () {
      //             //                 //   // Action for folder 1
      //             //                 // },
      //             //                 child: Column(
      //             //                   mainAxisSize: MainAxisSize.min,
      //             //                   children: <Widget>[
      //             //                     Icon(Icons.folder,
      //             //                         size: 50.0, color: kAccentColor),
      //             //                     Text('Folder 1'), // Folder name added
      //             //                   ],
      //             //                 ),
      //             //               ),
      //             //
      //             //               InkWell(
      //             //                 // onTap: () {
      //             //                 //   // Action for folder 2
      //             //                 // },
      //             //                 child: Column(
      //             //                   mainAxisSize: MainAxisSize.min,
      //             //                   children: <Widget>[
      //             //                     Icon(Icons.folder,
      //             //                         size: 50.0, color: kAccentColor),
      //             //                     Text('Folder 2'), // Folder name added
      //             //                   ],
      //             //                 ),
      //             //               ),
      //             //               InkWell(
      //             //                 // onTap: () {
      //             //                 //   // Action for folder 3
      //             //                 // },
      //             //                 child: Column(
      //             //                   mainAxisSize: MainAxisSize.min,
      //             //                   children: <Widget>[
      //             //                     Icon(Icons.folder,
      //             //                         size: 50.0, color: kAccentColor),
      //             //                     Text('Folder 3'), // Folder name added
      //             //                   ],
      //             //                 ),
      //             //               ),
      //             //
      //             //               InkWell(
      //             //                 // onTap: () {
      //             //                 //   // Action for folder 4
      //             //                 // },
      //             //                 child: Column(
      //             //                   mainAxisSize: MainAxisSize.min,
      //             //                   children: <Widget>[
      //             //                     Icon(Icons.folder,
      //             //                         size: 50.0, color: kAccentColor),
      //             //                     Text('Folder 4'), // Folder name added
      //             //                   ],
      //             //                 ),
      //             //               )
      //             //
      //             //
      //             //             ],
      //             //           )
      //             //         ],
      //             //       )
      //             //     ],
      //             //   ),
      //             // )
      //           ],
      //         ),
      //       ),
      //     ))
      //
      // lksdjhkfdsn
    );
  }
}

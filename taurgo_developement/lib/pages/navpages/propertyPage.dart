// import 'package:flutter/material.dart';
// import 'package:taurgo_developement/costants/AppColors.dart';
// import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
// import 'package:taurgo_developement/pages/navpages/upload_image_page.dart';
//
// import '../../model/PropertyDetailsModel.dart';
// import '../home.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class ProperyPage extends StatefulWidget {
//   final String imagePath;
//   final String address;
//   final String areaCode;
//   final String postalCode;
//
//   const ProperyPage({
//     Key? key,
//     required this.imagePath,
//     required this.address,
//     required this.areaCode,
//     required this.postalCode,
//   }) : super(key: key);
//
//   @override
//   State<ProperyPage> createState() => _ProperyPageState();
// }
//
// class _ProperyPageState extends State<ProperyPage> {
//   List<PropertyDetailsModel> properties = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // fetchProperties();
//   }
//
//   // Future<void> fetchProperties() async {
//   //   final url =
//   //       Uri.parse('http://192.168.8.101:9090/property-details/get-details');
//   //   // Change the IP to your backend's IP if necessary
//   //   try {
//   //     final response = await http.get(url);
//   //     if (response.statusCode == 200) {
//   //       final List<dynamic> data = json.decode(response.body);
//   //
//   //       setState(() {
//   //         properties = data.map((json) {
//   //           // Debug: print the json object
//   //           print('Received JSON: $json');
//   //
//   //           // Handle potential null values
//   //           return PropertyDetailsModel.fromJson(json as Map<String, dynamic>);
//   //         }).toList();
//   //       });
//   //     } else {
//   //       // Handle server errors here
//   //       print('Failed to load properties: ${response.statusCode}');
//   //     }
//   //   } catch (error) {
//   //     // Handle connection errors here
//   //     print('Error fetching properties: $error');
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     bool hasDetails = widget.imagePath.isNotEmpty &&
//         widget.address.isNotEmpty &&
//         widget.areaCode.isNotEmpty &&
//         widget.postalCode.isNotEmpty;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Properties',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             fontFamily: "Inter",
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: bWhite,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>
//                       Homepage()), // Replace Homepage with your home page widget
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.asset(
//                 'assets/logo/Taurgo Logo.png'), // Path to your company icon
//           ),
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
//         color: Colors.white, // Ensure this is set to Colors.white
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SearchBarSection(),
//               // hasDetails
//               //     ? ListView.builder(
//               //         itemCount: properties.length,
//               //         shrinkWrap: true,
//               //         physics: NeverScrollableScrollPhysics(),
//               //         itemBuilder: (context, index) {
//               //           final property = properties[index];
//               //           return propertyContainer(
//               //               property.imageUrl,
//               //               property.address,
//               //               property.areaCode,
//               //               property.postalCode,
//               //               UploadImagePage());
//               //         })
//               //     : Center(
//               //         child: Padding(
//               //           padding: const EdgeInsets.all(16.0),
//               //           child: Text(
//               //             'No files available',
//               //             style: TextStyle(
//               //               fontSize: 18.0,
//               //               color: kPrimaryColor,
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//
//               hasDetails
//                   ? propertyContainer(widget.imagePath, widget.address,
//                       widget.areaCode, widget.postalCode, UploadImagePage())
//                   : Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text(
//                           'No files available',
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: kPrimaryColor,
//                           ),
//                         ),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white, // Set Scaffold background color to white
//     );
//   }
//
//   Widget propertyContainer(String? imagePath, String address, String areaCode,
//       String postalCode, Widget page) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => page,
//           ),
//         );
//       },
//       child: Container(
//         height: 310,
//         margin: EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 8.0,
//               spreadRadius: 2.0,
//               offset: Offset(2.0, 2.0),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(16.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(10.0),
//                 ),
//                 child: imagePath != null && imagePath.isNotEmpty
//                     ? Image.network(
//                         imagePath,
//                         width: double.infinity,
//                         height: 150.0,
//                         fit: BoxFit.cover,
//                         loadingBuilder: (BuildContext context, Widget child,
//                             ImageChunkEvent? loadingProgress) {
//                           if (loadingProgress == null) {
//                             return child;
//                           }
//                           return Center(
//                             child: CircularProgressIndicator(
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded /
//                                       loadingProgress.expectedTotalBytes!
//                                   : null,
//                             ),
//                           );
//                         },
//                         errorBuilder: (context, error, stackTrace) {
//                           return Container(
//                             color: Colors.grey[200],
//                             width: double.infinity,
//                             height: 150.0,
//                             child: Icon(
//                               Icons.error,
//                               color: Colors.red,
//                               size: 50,
//                             ),
//                           );
//                         },
//                       )
//                     : Container(
//                         color: Colors.grey[200],
//                         width: double.infinity,
//                         height: 150.0,
//                         child: Icon(
//                           Icons.image_not_supported,
//                           color: Colors.grey,
//                           size: 50,
//                         ),
//                       ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 16.0, right: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(height: 8.0),
//                   Text(
//                     "Address",
//                     style: TextStyle(
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 12.0),
//                   Text(
//                     address,
//                     textAlign: TextAlign.justify,
//                     style: TextStyle(
//                       fontSize: 11.0,
//                       color: kSecondaryTextColourTwo,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Row(
//                     children: [
//                       Text(
//                         "Area : ",
//                         style: TextStyle(
//                           fontSize: 11.0,
//                           color: kPrimaryTextColour,
//                         ),
//                       ),
//                       Text(
//                         "$areaCode",
//                         style: TextStyle(
//                           fontSize: 11.0,
//                           color: kSecondaryTextColourTwo,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Postalcode : ",
//                         style: TextStyle(
//                           fontSize: 11.0,
//                           color: kPrimaryTextColour,
//                         ),
//                       ),
//                       Text(
//                         "$postalCode",
//                         style: TextStyle(
//                           fontSize: 11.0,
//                           color: kSecondaryTextColourTwo,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 8.0),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:taurgo_developement/costants/AppColors.dart';
// // import 'package:taurgo_developement/pages/home.dart';
// // import 'imagePageComponents/search_bar_section.dart';
// //
// // class ProperyPage extends StatefulWidget {
// //   final String imagePath;
// //   final String address;
// //   final String areaCode;
// //   final String postalCode;
// //
// //   const ProperyPage({
// //     Key? key,
// //     required this.imagePath,
// //     required this.address,
// //     required this.areaCode,
// //     required this.postalCode,
// //   }) : super(key: key);
// //
// //   @override
// //   State<ProperyPage> createState() => _ProperyPageState();
// // }
// //
// // class _ProperyPageState extends State<ProperyPage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     // Check if any of the details are empty
// //     bool hasDetails = widget.imagePath.isNotEmpty &&
// //         widget.address.isNotEmpty &&
// //         widget.areaCode.isNotEmpty &&
// //         widget.postalCode.isNotEmpty;
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           'Properties',
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.w500,
// //             fontFamily: "Inter",
// //           ),
// //         ),
// //         centerTitle: true,
// //         backgroundColor: bWhite,
// //         leading: GestureDetector(
// //           onTap: () {
// //             Navigator.pushReplacement(
// //               context,
// //               MaterialPageRoute(builder: (context) => Homepage()),
// //             );
// //           },
// //           child: Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Image.asset('assets/logo/Taurgo Logo.png'),
// //           ),
// //         ),
// //         actions: [
// //           IconButton(
// //             icon: Icon(
// //               Icons.notifications_none,
// //               color: kPrimaryColor,
// //             ),
// //             onPressed: () {},
// //           ),
// //           IconButton(
// //             icon: Icon(
// //               Icons.help_outline,
// //               color: kPrimaryColor,
// //             ),
// //             onPressed: () {},
// //           ),
// //         ],
// //       ),
// //       body: Container(
// //         color: Colors.white,
// //         child: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               SearchBarSection(),
// //               hasDetails
// //                   ? propertyContainer(
// //                 widget.imagePath,
// //                 widget.address,
// //                 widget.areaCode,
// //                 widget.postalCode,
// //               )
// //                   : Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Text(
// //                     'No files available',
// //                     style: TextStyle(
// //                       fontSize: 18.0,
// //                       color: kSecondaryTextColourTwo,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       backgroundColor: Colors.white,
// //     );
// //   }
// //
// //   Widget propertyContainer(String imagePath, String address, String areaCode, String postalCode) {
// //     return Container(
// //       height: 310,
// //       margin: EdgeInsets.all(16.0),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(10.0),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black12,
// //             blurRadius: 8.0,
// //             spreadRadius: 2.0,
// //             offset: Offset(2.0, 2.0),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: <Widget>[
// //           Container(
// //             padding: EdgeInsets.all(16.0),
// //             child: ClipRRect(
// //               borderRadius: BorderRadius.vertical(
// //                 top: Radius.circular(20.0),
// //                 bottom: Radius.circular(20.0),
// //               ),
// //               child: Image.file(
// //                 File(imagePath),
// //                 width: double.infinity,
// //                 height: 150.0,
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //           ),
// //           Padding(
// //             padding: EdgeInsets.only(left: 16.0, right: 16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: <Widget>[
// //                 Text(
// //                   address,
// //                   style: TextStyle(
// //                     fontSize: 12.0,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 SizedBox(height: 8.0),
// //                 Text(
// //                   "Area Code: $areaCode",
// //                   textAlign: TextAlign.justify,
// //                   style: TextStyle(
// //                     fontSize: 11.0,
// //                     color: kSecondaryTextColourTwo,
// //                   ),
// //                 ),
// //                 SizedBox(height: 8.0),
// //                 Text(
// //                   "Postal Code: $postalCode",
// //                   textAlign: TextAlign.justify,
// //                   style: TextStyle(
// //                     fontSize: 11.0,
// //                     color: kSecondaryTextColourTwo,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           SizedBox(height: 12.0),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// //

import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
import 'package:taurgo_developement/pages/navpages/upload_image_page.dart';

import '../home.dart';

class ProperyPage extends StatefulWidget {
  final String imagePath;
  final String address;
  final String areaCode;
  final String postalCode;

  const ProperyPage({
    Key? key,
    required this.imagePath,
    required this.address,
    required this.areaCode,
    required this.postalCode,
  }) : super(key: key);

  @override
  State<ProperyPage> createState() => _ProperyPageState();
}

class _ProperyPageState extends State<ProperyPage> {
  @override
  Widget build(BuildContext context) {
    bool hasDetails = widget.imagePath.isNotEmpty &&
        widget.address.isNotEmpty &&
        widget.areaCode.isNotEmpty &&
        widget.postalCode.isNotEmpty;
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
              MaterialPageRoute(
                  builder: (context) =>
                      Homepage()), // Replace Homepage with your home page widget
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
      body: Container(
        color: Colors.white, // Ensure this is set to Colors.white
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarSection(),
              hasDetails
                  ? propertyContainer(widget.imagePath, widget.address,
                  widget.areaCode, widget.postalCode, UploadImagePage())
                  : Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'No files available',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white, // Set Scaffold background color to white
    );
  }

  Widget propertyContainer(String imagePath, String address, String areaCode,
      String postalCode, Widget page) {
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
                  SizedBox(height: 8.0),
                  Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    address,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 11.0,
                      color: kSecondaryTextColourTwo,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
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
                        "$areaCode",
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
                        "$postalCode",
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
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:taurgo_developement/costants/AppColors.dart';
// import 'package:taurgo_developement/pages/home.dart';
// import 'imagePageComponents/search_bar_section.dart';
//
// class ProperyPage extends StatefulWidget {
//   final String imagePath;
//   final String address;
//   final String areaCode;
//   final String postalCode;
//
//   const ProperyPage({
//     Key? key,
//     required this.imagePath,
//     required this.address,
//     required this.areaCode,
//     required this.postalCode,
//   }) : super(key: key);
//
//   @override
//   State<ProperyPage> createState() => _ProperyPageState();
// }
//
// class _ProperyPageState extends State<ProperyPage> {
//   @override
//   Widget build(BuildContext context) {
//     // Check if any of the details are empty
//     bool hasDetails = widget.imagePath.isNotEmpty &&
//         widget.address.isNotEmpty &&
//         widget.areaCode.isNotEmpty &&
//         widget.postalCode.isNotEmpty;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Properties',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             fontFamily: "Inter",
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: bWhite,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => Homepage()),
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.asset('assets/logo/Taurgo Logo.png'),
//           ),
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
//         color: Colors.white,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SearchBarSection(),
//               hasDetails
//                   ? propertyContainer(
//                 widget.imagePath,
//                 widget.address,
//                 widget.areaCode,
//                 widget.postalCode,
//               )
//                   : Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'No files available',
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       color: kSecondaryTextColourTwo,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
//
//   Widget propertyContainer(String imagePath, String address, String areaCode, String postalCode) {
//     return Container(
//       height: 310,
//       margin: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 8.0,
//             spreadRadius: 2.0,
//             offset: Offset(2.0, 2.0),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.all(16.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(20.0),
//                 bottom: Radius.circular(20.0),
//               ),
//               child: Image.file(
//                 File(imagePath),
//                 width: double.infinity,
//                 height: 150.0,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 16.0, right: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   address,
//                   style: TextStyle(
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   "Area Code: $areaCode",
//                   textAlign: TextAlign.justify,
//                   style: TextStyle(
//                     fontSize: 11.0,
//                     color: kSecondaryTextColourTwo,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   "Postal Code: $postalCode",
//                   textAlign: TextAlign.justify,
//                   style: TextStyle(
//                     fontSize: 11.0,
//                     color: kSecondaryTextColourTwo,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 12.0),
//         ],
//       ),
//     );
//   }
// }
//
//
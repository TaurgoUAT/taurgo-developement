import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/costants/status.dart';
import 'package:taurgo_developement/pages/FolderContentsPage.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/helpAndSupportPage.dart';
import 'package:taurgo_developement/pages/navpages/notification/notificationPage.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> completedProperties = [];
  List<Map<String, dynamic>> pendingProperties = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProperties();
  }

  Future<void> fetchProperties() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        QuerySnapshot snapshot = await _firestore
            .collection('to-be-completed')
            .doc(referenceNumber) // Corrected: using user.uid instead of referenceNumber
            .collection('properties')
            .orderBy('createdAt', descending: true)
            .get();

        List<Map<String, dynamic>> allProperties = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        // Separate properties based on status
        completedProperties = allProperties
            .where((property) => property['status'] == status[1])
            .toList();
        pendingProperties = allProperties
            .where((property) => property['status'] == status[0])
            .toList();

        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Failed to fetch properties: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

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
              MaterialPageRoute(builder: (context) => Homepage()), // Replace HomePage with your home page widget
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo/Taurgo Logo.png', // Path to your company icon
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_outline,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Helpandsupportpage()), // Replace HomePage with your home page widget
              );
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: bWhite,
          body: Column(
            children: <Widget>[
              const SizedBox(height: 18),
              // Padding(
              //   padding: EdgeInsets.only(left: 16.0),
              //   child: Row(
              //     children: [
              //
              //       Text(
              //         'Taurgo',
              //         style: TextStyle(
              //           color: kPrimaryColor,
              //           fontSize: 18,
              //           fontWeight: FontWeight.w700,
              //           fontFamily: "Inter",
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: 16.0, bottom: 16.0, top: 4),
              //   child: Text(
              //     'Tours',
              //     style: TextStyle(
              //       fontSize: 36,
              //       fontWeight: FontWeight.w900,
              //       fontFamily: "Inter",
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              TabBar(
                padding: EdgeInsets.all(16.0),
                indicatorColor: kPrimaryColor,
                labelColor: kPrimaryColor,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: "Inter",
                ),
                tabs: [
                  Tab(text: 'Completed Tours'),
                  Tab(text: 'Pending Tours'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    buildPropertyList(completedProperties),
                    buildPropertyList(pendingProperties),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPropertyList(List<Map<String, dynamic>> properties) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor, // Set the color to your primary color
          strokeWidth: 6.0,
          strokeCap: StrokeCap.square,// Set the stroke width
        ),
      );
    }

    if (properties.isEmpty) {
      return Center(
        child: Text(
          'No Properties Found.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: properties.length,
      itemBuilder: (context, index) {
        var property = properties[index];

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Card(
            color: kPrimaryColor,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: (property['imageUrls'] != null &&
                  property['imageUrls'].isNotEmpty)
                  ? Image.network(
                property['imageUrls'][0],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
                  : Image.asset(
                'assets/images/placeholder.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                property['address'] ?? '',
                style: TextStyle(
                  color: bWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
                ),
              ),
              subtitle: Text(
                'Area Code: ${property['areaCode'] ?? ''}',
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                ),
              ),
              trailing: Text(
                property['status'].toUpperCase() ?? ''.toUpperCase(),
                style: TextStyle(
                  color: property['status'] == status[1]
                      ? Colors.green
                      : Colors.orange,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inter",
                ),
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PropertyDetailsPage(property),
                //   ),
                // );
              },
            ),
          ),
        );
      },
    );
  }
}


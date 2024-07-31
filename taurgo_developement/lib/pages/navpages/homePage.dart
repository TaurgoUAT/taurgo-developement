import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/costants/status.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/completedPropertyPage.dart';
import 'package:taurgo_developement/pages/navpages/helpAndSupportPage.dart';

class HomePage extends StatefulWidget {

  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, dynamic>? userDetails;

  List<Map<String, dynamic>> completedProperties = [];
  List<Map<String, dynamic>> pendingProperties = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
    fetchProperties();
  }

  Future<void> fetchUserDetails() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        QuerySnapshot snapshot = await _firestore
            .collection('users-deatils')
            .doc(user.uid)
            .collection('users')
            .orderBy('createdAt', descending: true)
            .limit(1) // Fetch only the most recent document
            .get();

        if (snapshot.docs.isNotEmpty) {
          if(mounted){
            setState(() {
              userDetails = snapshot.docs.first.data() as Map<String, dynamic>;
              isLoading = false;
            });
          }

        } else {
          print("No user details found for this user.");
          if(mounted){
            setState(() {
              isLoading = false;
            });
          }

        }
      }
    } catch (e) {
      print("Failed to fetch user details: $e");
      if(mounted){
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> fetchProperties() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        //Need to chnage
        QuerySnapshot snapshot = await _firestore
            .collection('properties')
            .doc(
                user.uid) // Corrected: using user.uid instead of referenceNumber
            .collection('property-details')
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

        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (e) {
      print("Failed to fetch properties: $e");
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Tours',
          style: TextStyle(
            color: kPrimaryColor,
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
                      Homepage()), // Replace HomePage with your home page widget
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
                MaterialPageRoute(
                    builder: (context) =>
                        Helpandsupportpage()), // Replace HomePage with your home page widget
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
            crossAxisAlignment: CrossAxisAlignment.start,
            // Aligns children to the left
            children: <Widget>[
              const SizedBox(height: 24),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  // Horizontal padding
                  child: RichText(
                    text: TextSpan(
                        text: "Welcome Back,",
                        style: TextStyle(color: kPrimaryColor, fontSize: 20),
                        children: [
                          TextSpan(
                            text: userDetails?['userName'] ?? '',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )),
              const SizedBox(height: 24),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  // Horizontal padding
                  child: Text('“It’s great to see you again!"',
                      style: TextStyle(fontSize: 16, color: kPrimaryColor.withOpacity(0.6))
                  ),),


              const SizedBox(height: 2),
              TabBar(
                padding: EdgeInsets.all(16.0),
                indicatorColor: kPrimaryColor,
                labelColor: kPrimaryColor,
                dividerColor: kPrimaryColor.withOpacity(0.4),
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
        child: SizedBox(
          width: 60.0,
          height: 60.0,
          child: CircularProgressIndicator(
            color: kPrimaryColor, // Set the color to your primary color
            strokeWidth: 6.0,
            strokeCap: StrokeCap.square,// Set the stroke width
          ),
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
            color: kPrimaryColor.withOpacity(1),
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
                'Ref No: ${property['referanceNumber'] ?? ''}',
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 10,
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
                if (property['status'] == status[1]) {
                  // Only navigate if the property is completed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompletedPropertyPage(
                        virtualTourUrl: property['360Tour'],
                        floorPlanUrl: property['floorPlanUrl'],
                        twoDimensionPlanUrl: property['2dPlanUrl'],
                      ),
                    ),
                  );
                } else {
                  // Optionally show a message if the property is not completed
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Tour Not Completed',style: TextStyle(
                          color: kPrimaryColor,
                        fontSize: 16
                      )),
                      content: Text(
                          'This tour is still pending. We will upload your '
                              'Tour Soon',style: TextStyle(
                          color: Colors.black,
                        fontWeight: FontWeight.w100
                      )),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK',style: TextStyle(
                            color: kPrimaryColor
                          ),),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}

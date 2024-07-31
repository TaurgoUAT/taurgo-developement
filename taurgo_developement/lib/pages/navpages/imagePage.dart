import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/home.dart';

import 'helpAndSupportPage.dart';

class Imagepage extends StatefulWidget {
  const Imagepage({super.key});

  @override
  State<Imagepage> createState() => _ImagepageState();
}

class _ImagepageState extends State<Imagepage> {
  late Stream<List<String>> imageStream;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    imageStream = _fetchImageUrls();
  }

  Stream<List<String>> _fetchImageUrls() async* {
    User? user = _auth.currentUser;
    final userId = user?.uid; // Replace with the actual user ID
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore
        .collection('to-be-completed')
        .doc(userId)
        .collection('properties')
        .get();

    List<String> imageUrls = [];
    for (var doc in querySnapshot.docs) {
      final data = doc.data();
      final urls = List<String>.from(data['imageUrls'] ?? []);
      imageUrls.addAll(urls);
    }
    yield imageUrls;
  }

  Widget buildGridView(List<String> images) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle tap on image
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Images',
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
              MaterialPageRoute(builder: (context) => Homepage()), // Replace
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                'assets/logo/Taurgo Logo.png'), // Path to your company icon
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.notifications_none, color: kPrimaryColor),
          //   onPressed: () {},
          // ),
          IconButton(
            icon: Icon(Icons.help_outline, color: kPrimaryColor),
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
      body: Container(
        color: bWhite,
        child: StreamBuilder<List<String>>(
          stream: imageStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: SizedBox(
                width: 60.0,
                height: 60.0,
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                  // Set the color to your primary color
                  strokeWidth: 6.0,
                  strokeCap: StrokeCap.square, // Set the stroke width
                ),
              ));
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Text('No images found.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        color: Colors.grey,
                      )));
            }

            final images = snapshot.data!;
            return buildGridView(images);
          },
        ),
      ),
    );
  }
}

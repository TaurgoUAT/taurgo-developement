import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class ProfileSection extends StatelessWidget {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> userDetails = [];

  bool isLoading = true;

  @override
  void initState() {
    fetchProperties();
  }

  Future<void> fetchProperties() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        QuerySnapshot snapshot = await _firestore
            .collection('users-deatils')
            .doc(user!.uid) // Corrected: using user.uid instead of referenceNumber
            .collection('users')
            .orderBy('createdAt', descending: true)
            .get();

        List<Map<String, dynamic>> allProperties = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

      }
    } catch (e) {
      print("Failed to fetch properties: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Name',
                  style: TextStyle(fontSize: 14, color: Color(0xFF777777))),
              Text("",
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Email Address',
                  style: TextStyle(fontSize: 14, color: Color(0xFF777777))),
              Text('user@example.com', style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}

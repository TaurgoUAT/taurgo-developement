import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
String generateCustomReference(String userId) {
  DateTime now = DateTime.now();
  int randomNumber = Random().nextInt(99999); // Generate a random number
  return 'REF-${userId.substring(0, 4)}-${now.year}${now.month}${now.day}-${randomNumber.toString().padLeft(5, '0')}';
}

String referenceNumber = generateCustomReference(user!.uid);

List<String> status = ['pending', 'completed', 'rejected'];

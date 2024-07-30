import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;

String generateCustomReference(String userId) {
  DateTime now = DateTime.now();
  int randomNumber = Random().nextInt(99999); // Generate a random number
  return 'TAURGO-${randomNumber.toString().padLeft(5, '0')}';
}

String referenceNumber = generateCustomReference(user!.uid);

List<String> status = ['pending', 'completed', 'rejected'];

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/shareImagePage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ShareButton extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  Future<void> _uploadImages(BuildContext context) async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles == null) return;

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        int totalFiles = pickedFiles.length;
        int uploadedFiles = 0;

        for (XFile file in pickedFiles) {
          File imageFile = File(file.path);
          String fileName = file.name;
          Reference storageRef = FirebaseStorage.instance.ref().child('images/${user.uid}/$fileName');
          UploadTask uploadTask = storageRef.putFile(imageFile);
          TaskSnapshot taskSnapshot = await uploadTask;
          String downloadUrl = await taskSnapshot.ref.getDownloadURL();
          await FirebaseFirestore.instance.collection('images').add({
            'url': downloadUrl,
            'uploaded_at': Timestamp.now(),
            'user_id': user.uid,
          });

          uploadedFiles++;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Uploaded $uploadedFiles of $totalFiles images')),
          );
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('All images uploaded successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User is not authenticated')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload images: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _uploadImages(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShareImagePage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          'Share with Taurgo',
          style: TextStyle(fontSize: 18),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Button corner radius
        ),
      ),
    );
  }
}
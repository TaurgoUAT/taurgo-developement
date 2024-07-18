import 'dart:io';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:taurgo_developement/pages/home.dart';

class UploadByCategoryPage extends StatefulWidget {
  const UploadByCategoryPage({super.key});

  @override
  State<UploadByCategoryPage> createState() => _UploadByCategoryPageState();
}

class _UploadByCategoryPageState extends State<UploadByCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Image Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle image selection by category
              },
              child: Text('Category 1'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle image selection by category
              },
              child: Text('Category 2'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle image selection by category
              },
              child: Text('Category 3'),
            ),
          ],
        ),
      ),
    );
  }
}

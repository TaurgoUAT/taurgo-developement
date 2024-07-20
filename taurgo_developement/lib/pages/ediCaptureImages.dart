import 'package:flutter/material.dart';

class EditImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with back and home icons
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, size: 30),
                  Icon(Icons.home, size: 30),
                ],
              ),
            ),
            // Image preview area
            Expanded(
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  'assets/sample_image.jpg', // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Bottom bar with edit controls
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.undo, size: 30),
                  Icon(Icons.crop, size: 30),
                  Icon(Icons.share, size: 30),
                  Icon(Icons.delete, size: 30),
                  Icon(Icons.check_circle, size: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EditImageScreen(),
  ));
}

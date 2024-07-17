import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with home and settings icons
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.home, size: 30),
                  Icon(Icons.settings, size: 30),
                ],
              ),
            ),
            // Camera preview area
            Expanded(
              child: Stack(
                children: [
                  // Replace with your camera preview widget
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'assets/sample_camera_view.jpg', // Replace with your camera view
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Camera button at the center top
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFBFDAD3),
                        child:
                            Icon(Icons.camera, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Bottom bar with camera controls
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.camera_alt, size: 40),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFFBFDAD3),
                    child: Icon(Icons.stop, color: Colors.white, size: 40),
                  ),
                  Icon(Icons.crop_square, size: 40),
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
    home: CameraScreen(),
  ));
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewPropertyScreen(),
    );
  }
}

class NewPropertyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            // Add your onPressed code here!
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/property_image.jpg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              'Tap on screen to create new property',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.camera, color: Colors.white),
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your onTap code here!
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white.withOpacity(0.8),
                        child: Icon(Icons.stop, color: Colors.grey, size: 30),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.photo_library, color: Colors.white),
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white.withOpacity(0.8),
                child: Icon(Icons.camera_alt, color: Colors.cyan, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

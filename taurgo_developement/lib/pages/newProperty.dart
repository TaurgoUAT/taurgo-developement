import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'display_picture_screen.dart'; // Adjust the path as per your project structure

class NewPropertyScreen extends StatefulWidget {
  final CameraDescription camera;

  NewPropertyScreen({required this.camera});

  @override
  _NewPropertyScreenState createState() => _NewPropertyScreenState();
}

class _NewPropertyScreenState extends State<NewPropertyScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _captureImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      Get.to(() => DisplayPictureScreen(imagePath: image.path));
    } catch (e) {
      print(e);
    }
  }

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
                  FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(_controller);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  // Center text
                  Center(
                    child: Text(
                      'Tap on screen to create new property',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
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
                    child: IconButton(
                      icon: Icon(Icons.stop, color: Colors.white, size: 40),
                      onPressed: _captureImage,
                    ),
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

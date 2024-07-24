import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/property/addPropertyDetaillPage.dart';
import '../../costants/AppColors.dart';

class CameraPreviewPage extends StatefulWidget {
  final CameraController cameraController;

  const CameraPreviewPage({Key? key, required this.cameraController})
      : super(key: key);

  @override
  _CameraPreviewPageState createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  late CameraController _cameraController;
  final ImagePicker _picker = ImagePicker();
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _cameraController = widget.cameraController;
    _initializeControllerFuture = _cameraController.initialize();
  }

  Future<void> _capturePhoto() async {
    try {
      await _initializeControllerFuture;
      final XFile photo = await _cameraController.takePicture();
      if (photo != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPropertyDetailsPage(imagePath: photo.path),
          ),
        );
      }
    } catch (e) {
      print('Error capturing photo: $e');
    }
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AddPropertyDetailsPage(imagePath: pickedFile.path),
        ),
      );
      print('Image picked from gallery: ${pickedFile.path}');
    }
  }

  Future<void> _switchCamera() async {
    if (_cameraController.description.lensDirection ==
        CameraLensDirection.back) {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);
      if (frontCamera != null) {
        setState(() {
          _cameraController =
              CameraController(frontCamera, ResolutionPreset.high);
          _initializeControllerFuture = _cameraController.initialize();
        });
      }
    } else {
      final cameras = await availableCameras();
      final backCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back);
      if (backCamera != null) {
        setState(() {
          _cameraController =
              CameraController(backCamera, ResolutionPreset.high);
          _initializeControllerFuture = _cameraController.initialize();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(
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
              MaterialPageRoute(
                  builder: (context) =>
                      Homepage()), // Replace with your home page widget
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                'assets/logo/Taurgo Logo.png'), // Path to your company icon
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.help_outline,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              fit: StackFit.expand,
              children: [
                AspectRatio(
                  aspectRatio: _cameraController.value.aspectRatio,
                  child: CameraPreview(_cameraController),
                ),
                // Optional: add other widgets on top of the preview if needed
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.cameraswitch_sharp, color: kPrimaryColor),
              onPressed: () {
                _switchCamera();
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt_outlined, color: kPrimaryColor),
              onPressed: () {
                _capturePhoto();
              },
            ),
            IconButton(
              icon: Icon(Icons.photo_library, color: kPrimaryColor),
              onPressed: () {
                _pickImageFromGallery();
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../pages/property/camerPreviewPage.dart';

class CustomFloatingActionButton extends StatefulWidget {
  final bool isVisible;

  const CustomFloatingActionButton({Key? key, required this.isVisible})
      : super(key: key);

  @override
  _CustomFloatingActionButtonState createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    _cameras = await availableCameras();
    if (_cameras!.isNotEmpty) {
      _cameraController = CameraController(
        _cameras!.first,
        ResolutionPreset.high,
      );
      await _cameraController!.initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isVisible) return SizedBox.shrink();

    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      child: Icon(
        Icons.add,
        size: 48,
      ),
      onPressed: () async {
        if (_cameraController != null &&
            _cameraController!.value.isInitialized) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CameraPreviewPage(cameraController: _cameraController!),
            ),
          );
        }
      },
    );
  }
}

// class CameraPreviewPage extends StatelessWidget {
//   final CameraController cameraController;
//
//   const CameraPreviewPage({Key? key, required this.cameraController}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Camera Preview')),
//       body: CameraPreview(cameraController),
//     );
//   }
// }

// class CameraPreviewPage extends StatefulWidget {
//   final CameraController cameraController;
//
//   const CameraPreviewPage({Key? key, required this.cameraController}) : super(key: key);
//
//   @override
//   _CameraPreviewPageState createState() => _CameraPreviewPageState();
// }
//
// class _CameraPreviewPageState extends State<CameraPreviewPage> {
//   late CameraController _cameraController;
//   final ImagePicker _picker = ImagePicker();
//   late Future<void> _initializeControllerFuture;
//   int _selectedIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _cameraController = widget.cameraController;
//     _initializeControllerFuture = _cameraController.initialize();
//   }
//
//   Future<void> _capturePhoto() async {
//     try {
//       await _initializeControllerFuture;
//       final XFile photo = await _cameraController.takePicture();
//       if (photo != null) {
//         // Handle the captured photo, e.g., display it or save it
//         print('Photo taken: ${photo.path}');
//       }
//     } catch (e) {
//       print('Error capturing photo: $e');
//     }
//   }
//
//   Future<void> _pickImageFromGallery() async {
//     final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       File imageFile = File(pickedFile.path);
//       // Handle the selected image, e.g., display it or save it
//       print('Image picked from gallery: ${imageFile.path}');
//     }
//   }
//
//   Future<void> _switchCamera() async {
//     if (_cameraController.description.lensDirection == CameraLensDirection.back) {
//       // Switch to front camera
//       final cameras = await availableCameras();
//       final frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
//       if (frontCamera != null) {
//         _cameraController = CameraController(frontCamera, ResolutionPreset.high);
//         _initializeControllerFuture = _cameraController.initialize();
//         setState(() {});
//       }
//     } else {
//       // Switch to back camera
//       final cameras = await availableCameras();
//       final backCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back);
//       if (backCamera != null) {
//         _cameraController = CameraController(backCamera, ResolutionPreset.high);
//         _initializeControllerFuture = _cameraController.initialize();
//         setState(() {});
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Camera Preview')),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return CameraPreview(_cameraController);
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               icon: Icon(Icons.camera_alt),
//               onPressed: () {
//                 _switchCamera();
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.camera),
//               onPressed: () {
//                 _capturePhoto();
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.photo_library),
//               onPressed: () {
//                 _pickImageFromGallery();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

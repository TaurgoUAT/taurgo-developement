import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'dart:io';

class UploadImagesButton extends StatefulWidget {
  @override
  _UploadImagesButtonState createState() => _UploadImagesButtonState();
}

class _UploadImagesButtonState extends State<UploadImagesButton> {
  List<File> _imageFiles = [];

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _imageFiles = pickedFiles.map((file) => File(file.path)).toList();
      });
    }
  }

  Future<void> selectFromCamera(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile == null) return;
      final imageTemp = File(pickedFile.path);
      // Update the UI
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image captured from camera')),
      );
      // Update state to display the selected image
      setState(() => _imageFiles.add(imageTemp));
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(),
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(
            child: GestureDetector(
          onTap: () {
            _pickImages(); // Call method to open gallery
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: kPrimaryColor, size: 32),
              SizedBox(height: 8),
              // Add spacing between the icon and the text
              GestureDetector(
                onTap: () {
                  _pickImages(); // Call method to open gallery
                },
                child: Text(
                  'Upload 2D Images',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = kPrimaryColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    var path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(8)));
    var dashWidth = 4.0;
    var dashSpace = 4.0;
    var distance = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
      distance = 0.0;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

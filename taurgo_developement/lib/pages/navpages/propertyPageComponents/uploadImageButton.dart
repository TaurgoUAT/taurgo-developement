import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class UploadImagesButton extends StatelessWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: kPrimaryColor, size: 32),
              SizedBox(height: 8), // Add spacing between the icon and the text
              Text(
                'Upload 2D Images',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
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
      ..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(8)));

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

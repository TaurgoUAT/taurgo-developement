import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class UploadImagesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
            color: kPrimaryColor, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
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
    );
  }
}

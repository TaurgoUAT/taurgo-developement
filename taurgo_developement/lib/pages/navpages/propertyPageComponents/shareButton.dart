import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          'Share with Taurgo',
          style: TextStyle(fontSize: 18),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Button corner radius
        ),
      ),
    );
  }
}
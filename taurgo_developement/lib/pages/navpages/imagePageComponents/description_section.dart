import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class CapturedImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 40.0, 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Captured Images',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ),
          ),
        ],
      ),
    );
  }
}

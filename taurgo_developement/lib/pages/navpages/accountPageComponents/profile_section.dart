import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 40.0, 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Name',
                  style: TextStyle(fontSize: 14, color: Color(0xFF777777))),
              Text('Full Name',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Email Address',
                  style: TextStyle(fontSize: 14, color: Color(0xFF777777))),
              Text('user@example.com', style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class SubscriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          16.0, 24.0, 16.0, 24.0), // Same padding as ProfileSection
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subscription',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Premium Package',
              style: TextStyle(fontSize: 14, color: Color(0xFF0E0F11))),
        ],
      ),
    );
  }
}

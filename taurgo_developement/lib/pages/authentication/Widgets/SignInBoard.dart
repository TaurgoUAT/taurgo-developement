import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class SignInCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 40.0, 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign In',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,
              fontFamily: "Inter",),
          ),

        ],
      ),
    );
  }
}
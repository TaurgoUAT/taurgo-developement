import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class HelpSupportButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 50,
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: kSecondaryButtonColor,
            foregroundColor: kSecondaryButtonTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.help_outline, color: Colors.black),
                  SizedBox(width: 8),
                  Text('Help and Support',
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                ],
              ),
              Icon(Icons.chevron_right, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
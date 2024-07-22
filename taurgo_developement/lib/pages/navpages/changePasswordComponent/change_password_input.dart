import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class ChangePasswordInput extends StatelessWidget {
  final String label;
  final IconData icon;

  const ChangePasswordInput({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: Icon(icon, color: kPrimaryColor),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        obscureText: true,
      ),
    );
  }
}

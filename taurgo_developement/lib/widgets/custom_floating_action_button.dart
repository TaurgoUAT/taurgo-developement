import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/newPropertyScreen.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final bool isVisible;

  const CustomFloatingActionButton({Key? key, required this.isVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return SizedBox.shrink();

    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      child: Icon(
        Icons.add,
        size: 48,
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewPropertyScreen()));
      },
    );
  }
}
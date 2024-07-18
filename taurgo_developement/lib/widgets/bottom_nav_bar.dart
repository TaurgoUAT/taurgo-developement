import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentTab;
  final ValueChanged<int> onTabSelected;

  CustomBottomNavBar({required this.currentTab, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

      color: kPrimaryColor,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 68,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTabItem(
                  index: 0,
                  icon: Icons.home,
                  text: 'Home',
                ),
                buildTabItem(
                  index: 1,
                  icon: Icons.list_alt_rounded,
                  text: 'Properties',
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTabItem(
                  index: 2,
                  icon: Icons.image,
                  text: 'Image',
                ),
                buildTabItem(
                  index: 3,
                  icon: Icons.person,
                  text: 'Account',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabItem({required int index, required IconData icon, required String text}) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () => onTabSelected(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentTab == index ? Colors.white : Colors.white.withOpacity(0.6),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontFamily: "Inter",
              color: currentTab == index ? Colors.white : Colors.white.withOpacity(0.6),
            ),
          )
        ],
      ),
    );
  }
}

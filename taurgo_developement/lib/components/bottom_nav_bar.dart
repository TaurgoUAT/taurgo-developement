import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .shifting, // Use shifting type for custom styles
      selectedItemColor: Colors.white, // Selected item color
      unselectedItemColor:
          Colors.white.withOpacity(0.6), // Unselected item color
      backgroundColor: Color(0xFF286167), // Background color
      currentIndex: 4, // Current index of the selected item

      // Items in the bottom navigation bar
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Color(0xFF286167), // Color of the item
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_city),
          label: 'Properties',
          backgroundColor: Color(0xFF286167), // Color of the item
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle, size: 50), // Size of the plus icon
          label: '', // Empty label
          backgroundColor: Color(0xFF286167), // Color of the item
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'Images',
          backgroundColor: Color(0xFF286167), // Color of the item
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
          backgroundColor: Color(0xFF286167), // Color of the item
        ),
      ],
    );
  }
}

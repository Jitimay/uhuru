import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1, // Height of the separator line
          color: Colors.white, // Color of the separator line
        ),
        Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 8,
              padding: const EdgeInsets.all(16),
              selectedIndex: selectedIndex,
              onTabChange: onTabChange,
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.favorite_border, text: 'Favorite'),
                GButton(icon: Icons.message, text: 'Inbox'),
                GButton(icon: Icons.shopping_bag_outlined, text: 'Order'),
                GButton(icon: Icons.person_outline, text: 'Profile'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
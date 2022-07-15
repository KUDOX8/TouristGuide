import 'package:flutter/material.dart';
import 'package:tourist_guide/utils/constants.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  List<bool> isSelected = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
      child: NavigationBar(
        height: 75,
        backgroundColor: white,
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home_outlined,
                  color: isSelected[0] ? black : grey),
              label: ''),
          NavigationDestination(
              icon: Icon(Icons.confirmation_number_outlined,
                  color: isSelected[1] ? black : grey),
              label: ''),
          NavigationDestination(
              icon: Icon(Icons.favorite_border_outlined,
                  color: isSelected[2] ? black : grey),
              label: ''),
          NavigationDestination(
              icon: Icon(Icons.person_outline,
                  color: isSelected[3] ? black : grey),
              label: ''),
        ],
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
            isSelected = [false, false, false, false];
            isSelected[index] = true;
          });
        },
        selectedIndex: _currentIndex,
      ),
    );
  }
}

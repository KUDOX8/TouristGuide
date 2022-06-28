import 'package:flutter/material.dart';
import 'package:tourist_guide/constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore',
              style: TextStyle(fontSize: 10, color: Colors.grey[800]),
            ),
            const Text(
              'Al-Ahsa',
              style: TextStyle(fontSize: 20, color: black, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Image.asset('assets/images/AlAhsa_logo.png', height: 70),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tourist_guide/utils/constants.dart';

import '../../../../core/models/Language.dart';

class TopBar extends StatelessWidget {
  final int languageNumber;
  const TopBar(this.languageNumber, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Language.languages['Explore']![languageNumber],
              style: TextStyle(fontSize: 10, color: Colors.grey[800]),
            ),
            Text(
              Language.languages['Al-Ahsa']![languageNumber],
              style: const TextStyle(
                  fontSize: 20, color: black, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Image.asset('assets/images/AlAhsa_logo.png', height: 70),
      ],
    );
  }
}

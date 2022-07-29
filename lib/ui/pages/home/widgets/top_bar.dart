import 'package:flutter/material.dart';
import 'package:tourist_guide/utils/constants.dart';

import '../../../../core/models/translation.dart';

class TopBar extends StatelessWidget {
  final Languages language;
  const TopBar(this.language, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // const HamburgerMenu(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translateEnglishToAnotherLanguage('Explore', language),
              style: TextStyle(fontSize: 10, color: Colors.grey[800]),
            ),
            Text(
              translateEnglishToAnotherLanguage('Al-Ahsa', language),
              style: const TextStyle(
                  fontSize: 20, color: black, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}

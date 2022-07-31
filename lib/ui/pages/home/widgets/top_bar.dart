import 'package:flutter/material.dart';
import 'package:tourist_guide/l10n/localization.dart';
import 'package:tourist_guide/utils/constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

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
              context.loc.explore,
              style: TextStyle(fontSize: 10, color: Colors.grey[800]),
            ),
            Text(
              context.loc.alahsa,
              style: const TextStyle(
                  fontSize: 20, color: black, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}

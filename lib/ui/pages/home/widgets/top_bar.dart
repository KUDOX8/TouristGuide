import 'package:flutter/material.dart';
import 'package:tourist_guide/l10n/localization.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.loc.explore,
          style: TextStyle(fontSize: 10, color: Colors.grey[400]),
        ),
        Text(
          context.loc.alahsa,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

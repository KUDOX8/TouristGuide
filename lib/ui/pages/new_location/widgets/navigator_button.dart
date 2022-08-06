// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const NavigatorButton({required this.title, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return FlatButton(
      onPressed: onTap,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      color: Colors.amber,
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.0228),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

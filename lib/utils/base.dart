import 'package:flutter/material.dart';
import 'package:tourist_guide/utils/constants.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RaisedButton(
        onPressed: () => Navigator.pushNamed(context, homePage),
      ),
    );
  }
}

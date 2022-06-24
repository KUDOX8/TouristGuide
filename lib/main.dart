import 'package:flutter/material.dart';
import 'package:tourist_guide/ui/pages/home/home.dart';
import 'package:tourist_guide/ui/pages/place_details/place_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

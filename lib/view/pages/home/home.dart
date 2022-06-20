import 'package:flutter/material.dart';
import 'package:tourist_guide/view/pages/home/widgets/categories_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: const [
        CategoriesBar(),
      ]),
    );
  }
}

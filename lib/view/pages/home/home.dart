import 'package:flutter/material.dart';
import 'package:tourist_guide/view/pages/home/widgets/bottom_nav_bar.dart';
import 'package:tourist_guide/view/pages/home/widgets/categories_bar.dart';
import 'package:tourist_guide/view/pages/home/widgets/top_bar.dart';
import 'package:tourist_guide/view/pages/search/widgets/search_bar.dart';
import 'package:tourist_guide/view/place_card/place_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.08),
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          const TopBar(),
          const SizedBox(
            height: 50,
          ),
          const SearchBar(),
          const SizedBox(
            height: 25,
          ),
          const CategoriesBar(),
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: List.generate(10, (index) {
                return const PlaceCard();
              }),
            ),
          )
        ]),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/ui/pages/home/widgets/bottom_nav_bar.dart';
import 'package:tourist_guide/ui/pages/home/widgets/categories_bar.dart';
import 'package:tourist_guide/ui/pages/home/widgets/top_bar.dart';
import 'package:tourist_guide/ui/pages/search/widgets/search_bar.dart';
import 'package:tourist_guide/ui/shared/widgets/place_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // hardcoded places for testing purposes. Will be deleted when we add the database.
  List<PlaceCard> placeCards = [
    PlaceCard(PlaceModel(
      placeID: 1,
      placeName: "Al-Qara Hill",
      placeType: "",
      numberOfStars: 5,
      imageURL: "assets/images/Alqara.jpg",
    )),
    PlaceCard(PlaceModel(
      placeID: 2,
      placeName: "Jawatha Park",
      placeType: "",
      numberOfStars: 4.5,
      imageURL: "assets/images/Jawatha_Park.jpg",
    )),
    PlaceCard(PlaceModel(
      placeID: 2,
      placeName: "Jawatha Park",
      placeType: "",
      numberOfStars: 4.5,
      imageURL: "assets/images/Jawatha_Park.jpg",
    )),
    PlaceCard(PlaceModel(
      placeID: 2,
      placeName: "Jawatha Park",
      placeType: "",
      numberOfStars: 4.5,
      imageURL: "assets/images/Jawatha_Park.jpg",
    )),
    PlaceCard(PlaceModel(
      placeID: 2,
      placeName: "Jawatha Park",
      placeType: "",
      numberOfStars: 4.5,
      imageURL: "assets/images/Jawatha_Park.jpg",
    )),
    PlaceCard(PlaceModel(
      placeID: 2,
      placeName: "Jawatha Park",
      placeType: "",
      numberOfStars: 4.5,
      imageURL: "assets/images/Jawatha_Park.jpg",
    )),
    PlaceCard(PlaceModel(
      placeID: 2,
      placeName: "Jawatha Park",
      placeType: "",
      numberOfStars: 4.5,
      imageURL: "assets//images/Jawatha_Park.jpg",
    )),
    PlaceCard(PlaceModel(
      placeID: 2,
      placeName: "Jawatha Park",
      placeType: "",
      numberOfStars: 4.5,
      imageURL: "assets//images/Jawatha_Park.jpg",
    )),
  ];

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
              childAspectRatio: 0.7 / 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: placeCards,
            ),
          )
        ]),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

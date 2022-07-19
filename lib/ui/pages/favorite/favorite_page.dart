import 'package:flutter/material.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/ui/shared/widgets/place_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<PlaceCard> favPlaces = [
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
      imageURL: "assets/images/Jawatha_Park.jpg",
    )),
    PlaceCard(PlaceModel(
      placeID: 2,
      placeName: "Jawatha Park",
      placeType: "",
      numberOfStars: 4.5,
      imageURL: "assets/images/Jawatha_Park.jpg",
    )),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Favorites'), elevation: 0, centerTitle: true),
      body: favPlaces.isEmpty
          ? const Center(
              child: Text('Add your favorite places to display it here'),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                cacheExtent: 9999999999,
                childAspectRatio: 0.7 / 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                children: favPlaces,
              ),
            ),
    );
  }
}

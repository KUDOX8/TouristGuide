import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/core/notifiers/cafe_notifier.dart';
import 'package:tourist_guide/core/notifiers/restaurant_notifier.dart';
import 'package:tourist_guide/core/services/database_service.dart';
import 'package:tourist_guide/ui/pages/home/widgets/bottom_nav_bar.dart';
import 'package:tourist_guide/ui/pages/home/widgets/categories_bar.dart';
import 'package:tourist_guide/ui/pages/home/widgets/top_bar.dart';
import 'package:tourist_guide/ui/pages/search/widgets/search_bar.dart';
import 'package:tourist_guide/ui/shared/widgets/place_card.dart';
import 'package:tourist_guide/ui/shared/widgets/place_generator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // hardcoded places for testing purposes. Will be deleted when we add the database.
  List<PlaceModel> placeModelList = [
    PlaceModel(
      placeID: 1,
      placeName: "Al-Qara Hill",
      placeType: ["Historical"],
      numberOfStars: 5,
      imageURL: "assets/images/Alqara.jpg",
    ),
    PlaceModel(
      placeID: 2,
      placeName: "Jawatha Park",
      placeType: ["Park"],
      numberOfStars: 4.5,
      imageURL: "assets/images/Jawatha_Park.jpg",
    ),
  ];
  List<PlaceModel> _shownPlaceCards = [
    PlaceModel(
      placeID: 1,
      placeName: "Al-Qara Hill",
      placeType: ["Historical"],
      numberOfStars: 5,
      imageURL: "assets/images/Alqara.jpg",
    ),
    PlaceModel(
      placeID: 2,
      placeName: "Jawatha Park",
      placeType: ["Park"],
      numberOfStars: 4.5,
      imageURL: "assets/images/Jawatha_Park.jpg",
    ),
  ];

  void _editList(String type, bool reset, bool isSelected) {
    if (reset) {
      _shownPlaceCards = placeModelList;
      setState(() {
        if (type != "All") {
          _shownPlaceCards = _shownPlaceCards
              .where((placeCard) => placeCard.placeType.contains(type))
              .toList();
        }
      });
    } else {
      setState(() {
        if (isSelected) {
          _shownPlaceCards += placeModelList
              .where((placeCard) => placeCard.placeType.contains(type))
              .toList();
        } else {
          _shownPlaceCards
              .removeWhere((place) => place.placeType.contains(type));
        }
      });
    }
    print(_shownPlaceCards);
  }

  // List<PlaceCard> all = [];
  // List<PlaceCard> cafes = [];
  // List<PlaceCard> restaurants = [];

  // @override
  // void initState() {
  //   CafeNotifier _cafeNotifier =
  //       Provider.of<CafeNotifier>(context, listen: false);
  //   RestaurantNotifier _restaurantNotifier =
  //       Provider.of<RestaurantNotifier>(context, listen: false);

  //   DatabaseService().getPlaces(_cafeNotifier, 'cafes');
  //   DatabaseService().getPlaces(_restaurantNotifier, 'restaurants');

  //   for (var placeModel in _cafeNotifier.placeList) {
  //     cafes.add(PlaceCard(placeModel));
  //   }
  //   for (var placeModel in _restaurantNotifier.placeList) {
  //     restaurants.add(PlaceCard(placeModel));
  //   }
  //   all.addAll(cafes);
  //   all.addAll(restaurants);
  //   super.initState();
  // }

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
          CategoriesBar(_editList),
          Expanded(child: PlaceGenerator(placeList: _shownPlaceCards))
        ]),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

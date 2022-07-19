import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/core/notifiers/place_notifier.dart';
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
  bool _isAllPrev = true;
  void _editList(String type, bool reset, bool isSelected) {
    if (reset) {
      setState(() {
        _shownPlaceCards = placeModelList;
      });

      if (type == "All") {
        _isAllPrev = true;
        return;
      }
      setState(() {
        _shownPlaceCards = _shownPlaceCards
            .where((placeCard) => placeCard.placeType.contains(type))
            .toList();
        _isAllPrev = false;
      });
    } else {
      if (_isAllPrev) _shownPlaceCards = [];
      setState(() {
        if (isSelected) {
          _shownPlaceCards += placeModelList
              .where((placeCard) => placeCard.placeType.contains(type))
              .toList();
          _isAllPrev = false;
        } else {
          _shownPlaceCards
              .removeWhere((place) => place.placeType.contains(type));
        }
      });
    }
  }

  List<PlaceCard> all = [];

  @override
  void initState() {
    PlaceNotifier _placeNotifier =
        Provider.of<PlaceNotifier>(context, listen: false);

    DatabaseService().getPlaces(_placeNotifier, 'places');

    for (var placeModel in _placeNotifier.placeList) {
      all.add(PlaceCard(placeModel));
    }

    super.initState();
  }

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

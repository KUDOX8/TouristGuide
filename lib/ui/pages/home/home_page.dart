import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/core/notifiers/favorite_places_notifiers.dart';
import 'package:tourist_guide/core/notifiers/place_notifier.dart';
import 'package:tourist_guide/core/services/database_service.dart';
import 'package:tourist_guide/ui/pages/home/widgets/categories_bar.dart';
import 'package:tourist_guide/ui/pages/home/widgets/pop_up_menu.dart';
import 'package:tourist_guide/ui/pages/home/widgets/top_bar.dart';
import 'package:tourist_guide/ui/pages/search/widgets/search_bar.dart';
import 'package:tourist_guide/ui/shared/widgets/place_generator.dart';
import 'package:tourist_guide/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<PlaceModel> _all = PlaceNotifier().placeList;
  List<PlaceModel> _shownPlaceCards = PlaceNotifier().placeList;
  bool _isAllPrev = true;
  void _editList(String type, bool reset, bool isSelected) {
    if (reset) {
      setState(() {
        _shownPlaceCards = _all;
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
          _shownPlaceCards += _all
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

  @override
  void initState() {
    FavoritePlacesNotifier _favoriteNotifier =
        Provider.of<FavoritePlacesNotifier>(context, listen: false);

    DatabaseService().getPlacesID(_favoriteNotifier);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.08),
      color: white,
      child: Scaffold(
        backgroundColor: white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const TopBar(),
          leadingWidth: _screenSize.width,
          actions: const [PopUpMenu()],
          backgroundColor: const Color(0x00000000),
          iconTheme: const IconThemeData(color: black, size: 32),
          elevation: 0,
        ),
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          const SearchBar(),
          const SizedBox(
            height: 25,
          ),
          CategoriesBar(_editList),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: PlaceGenerator(placeList: _shownPlaceCards))
        ]),
      ),
    );
  }
}

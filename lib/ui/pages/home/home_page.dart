import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/core/notifiers/favorite_places_notifiers.dart';
import 'package:tourist_guide/core/notifiers/place_notifier.dart';
import 'package:tourist_guide/core/notifiers/theme_notifier.dart';
import 'package:tourist_guide/core/services/database_service.dart';
import 'package:tourist_guide/ui/pages/favorite/favorite_page.dart';
import 'package:tourist_guide/ui/pages/home/widgets/categories_bar.dart';
import 'package:tourist_guide/ui/pages/home/widgets/pop_up_menu.dart';
import 'package:tourist_guide/ui/pages/home/widgets/top_bar.dart';
import 'package:tourist_guide/ui/pages/search/widgets/search_bar.dart';
import 'package:tourist_guide/ui/pages/settings/settings_page.dart';
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
  int _selectedIndex = 0;
  
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier =
    Provider.of<ThemeNotifier>(context, listen: true);
    Size _screenSize = MediaQuery.of(context).size;

    List <Widget> _pages= [
      Container(
        padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.08),
        color: themeNotifier.isDarkMode ? darkBackgroundColor : white,
        child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [TopBar(), PopUpMenu()],
        ),
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
      ),const FavoritePage(),const SettingsPage()];
    
    

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: ""),
        ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(

          child: _pages.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/core/services/database_service.dart';
import 'package:tourist_guide/main.dart';
import 'package:tourist_guide/ui/pages/favorite/favorite_page.dart';
import 'package:tourist_guide/ui/pages/home/widgets/categories_bar.dart';
import 'package:tourist_guide/ui/pages/home/widgets/top_bar.dart';
import 'package:tourist_guide/ui/pages/new_location/personal_information.dart';
import 'package:tourist_guide/ui/pages/search/widgets/search_bar.dart';
import 'package:tourist_guide/ui/pages/settings/settings_page.dart';
import 'package:tourist_guide/ui/shared/widgets/place_generator.dart';
import 'package:tourist_guide/utils/constants.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<Home> {
  late List<PlaceModel> _shownPlaceCards = [];
  late List<PlaceModel> _all = [];

  bool _isAllPrev = true;
  void _editList(String type, bool reset, bool isSelected, WidgetRef ref) {
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
    DatabaseService().getPlacesID(ref.read(favoriteNotifier));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _shownPlaceCards = ref.watch(placeNotifier).placeList;
    _all = ref.watch(placeNotifier).placeList;
    super.didChangeDependencies();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifier);

    Size _screenSize = MediaQuery.of(context).size;

    List<Widget> _pages = [
      Container(
        padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.08),
        color: theme.isDarkMode ? darkBackgroundColor : white,
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [TopBar()],
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
      ),
      const PersonalInformation(),
      const FavoritePage(),
      const SettingsPage(),
    ];

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Theme.of(context).iconTheme.color,
          unselectedItemColor: Theme.of(context).iconTheme.color,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_business_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
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

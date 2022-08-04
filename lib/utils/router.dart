import 'package:flutter/material.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/ui/pages/favorite/favorite_page.dart';
import 'package:tourist_guide/ui/pages/home/home_page.dart';
import 'package:tourist_guide/ui/pages/place_details/place_details_page.dart';
import 'package:tourist_guide/ui/pages/settings/settings_page.dart';
import 'package:tourist_guide/utils/constants.dart';

Route<dynamic> geneateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => const Home());

    case placeDetailsPage:
      PlaceModel placeDetailsArgument = settings.arguments as PlaceModel;
      return MaterialPageRoute(
        builder: (context) => PlaceDetailsPage(
          detailedPlaceModel: DetailedPlaceModel.fromPlaceModel(
            placeModel: placeDetailsArgument,
            numberOfReviews: 325,
            price: 10,
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            url: "https://goo.gl/maps/ogqKiZMuvyikpdxVA",
            showImagesURL: [],
          ),
        ),
      );

    case favoritePage:
      return MaterialPageRoute(builder: (context) => const FavoritePage());

    case settingsPage:
      return MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Home());
  }
}

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
                placeModel: placeDetailsArgument,
              ));

    case favoritePage:
      return MaterialPageRoute(builder: (context) => const FavoritePage());

    case settingsPage:
      return MaterialPageRoute(builder: (context) => const SettingsPage());

    default:
      return MaterialPageRoute(builder: (context) => const Home());
  }
}

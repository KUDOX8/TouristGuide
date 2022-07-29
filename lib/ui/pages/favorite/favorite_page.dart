import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/core/notifiers/favorite_places_notifiers.dart';
import 'package:tourist_guide/core/notifiers/place_notifier.dart';
import 'package:tourist_guide/ui/shared/widgets/place_generator.dart';
import 'package:tourist_guide/utils/constants.dart';

import '../../../core/models/translation.dart';

class FavoritePage extends StatefulWidget {
  final Languages language;
  const FavoritePage(this.language, {Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<PlaceModel> _getFavoritePlaces(
      List<String> placesID, List<PlaceModel> placeModels) {
    List<PlaceModel> favPlaces = [];
    for (PlaceModel place in placeModels) {
      if (placesID.contains(place.placeID)) favPlaces.add(place);
    }
    return favPlaces;
  }

  @override
  Widget build(BuildContext context) {
    FavoritePlacesNotifier _favoriteNotifier =
        Provider.of<FavoritePlacesNotifier>(context, listen: true);

    return Scaffold(
      appBar: AppBar(

        title: Text(
           translateEnglishToAnotherLanguage('Favorites', widget.language),
          style: titleTextStyle,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0x00000000),
        iconTheme: const IconThemeData(color: black, size: 32),
      ),

      body: _favoriteNotifier.placesID.isEmpty
          ? Center(
              child: Text(
                translateEnglishToAnotherLanguage(
                    'Add your favorite places to display it here',
                    widget.language),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlaceGenerator(

                placeList:
                    _getFavoritePlaces(_favoriteNotifier.placesID, placeModels),
                language: widget.language,

              )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_guide/core/models/place_model.dart';

import 'package:tourist_guide/l10n/localization.dart';
import 'package:tourist_guide/main.dart';
import 'package:tourist_guide/ui/shared/widgets/place_generator.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
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
    final favorites = ref.watch(favoriteNotifier);
    final places = ref.watch(placeNotifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.favorite,
          style:
              TextStyle(color: Theme.of(context).appBarTheme.backgroundColor),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0x00000000),
        iconTheme:
            IconThemeData(color: Theme.of(context).iconTheme.color, size: 32),
      ),
      body: favorites.placesID.isEmpty
          ? Center(
              child: Text(
                context.loc.addFavoritePlaces,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlaceGenerator(
                placeList:
                    _getFavoritePlaces(favorites.placesID, places.placeList),
              )),
    );
  }
}

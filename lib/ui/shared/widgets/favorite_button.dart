import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_guide/core/notifiers/favorite_places_notifiers.dart';
import 'package:tourist_guide/core/services/database_service.dart';

import '../../../utils/constants.dart';

class FavoriteButton extends StatefulWidget {
  final String placeID;
  const FavoriteButton({Key? key, required this.placeID}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    FavoritePlacesNotifier _favoriteNotifier =
        Provider.of<FavoritePlacesNotifier>(context, listen: true);

    isFavorite = _favoriteNotifier.placesID.contains(widget.placeID);

    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: InkWell(
        onTap: () {
          isFavorite = !isFavorite;
          if (isFavorite) {
            _favoriteNotifier.placesID =
                _favoriteNotifier.placesID + [widget.placeID];
          } else {
            _favoriteNotifier.placesID.remove(widget.placeID);
            _favoriteNotifier.placesID = _favoriteNotifier.placesID;
          }

          DatabaseService().setPlacesID(_favoriteNotifier.placesID);

          setState(() {});
        },
        child: Container(
          width: 40,
          height: 40,
          color: white,
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_outline,
            size: 25,
            color: red,
          ),
        ),
      ),
    );
  }
}

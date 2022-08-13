import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_guide/core/services/database_service.dart';
import 'package:tourist_guide/main.dart';

import '../../../utils/constants.dart';

class FavoriteButton extends ConsumerStatefulWidget {
  final String placeID;
  const FavoriteButton({Key? key, required this.placeID}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends ConsumerState<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteNotifier);

    isFavorite = favorites.placesID.contains(widget.placeID);

    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: InkWell(
        onTap: () {
          isFavorite = !isFavorite;
          if (isFavorite) {
            favorites.placesID = favorites.placesID + [widget.placeID];
          } else {
            favorites.placesID.remove(widget.placeID);
            favorites.placesID = favorites.placesID;
          }

          DatabaseService().setPlacesID(favorites.placesID);

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

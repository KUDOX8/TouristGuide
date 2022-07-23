import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/core/notifiers/favorite_places_notifiers.dart';

class DatabaseService {
  final FirebaseFirestore _storeInstance = FirebaseFirestore.instance;

  void getPlaces(dynamic placeNotifier, String collectionName) async {
    QuerySnapshot cafeSnapshot =
        await _storeInstance.collection(collectionName).get();

    List<PlaceModel> _placeList = [];

    for (var place in cafeSnapshot.docs) {
      PlaceModel placeModel = PlaceModel(
        placeName: place.get('placeName'),
        placeType: place.get('placeType'),
        placeID: place.get('placeID'),
        imageURL: place.get('imageURL'),
        numberOfStars: place.get('numberOfStars'),
      );

      _placeList.add(placeModel);
    }

    placeNotifier.placesList = _placeList;
  }

  void getPlacesID(FavoritePlacesNotifier _favoriteNotifier) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (!pref.containsKey('favorite')) {
      pref.setStringList('favorite', []);
    }

    _favoriteNotifier.placesID = pref.getStringList('favorite')!;
  }

  void setPlacesID(List<String> placesID) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setStringList('favorite', placesID);
  }
}

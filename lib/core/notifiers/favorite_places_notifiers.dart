import 'package:flutter/material.dart';

class FavoritePlacesNotifier with ChangeNotifier {
  List<String> _placesID = [];

  List<String> get placesID => (_placesID);

  set placesID(List<String> placesID) {
    _placesID = placesID;

    notifyListeners();
  }
}

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tourist_guide/core/models/place_model.dart';

class RestuarantNotifier with ChangeNotifier {
  List<PlaceModel> _placeList = [];

  UnmodifiableListView<PlaceModel> get placeList =>
      UnmodifiableListView(_placeList);

  set placeList(List<PlaceModel> placesList) {
    _placeList = placesList;
    notifyListeners();
  }
}
